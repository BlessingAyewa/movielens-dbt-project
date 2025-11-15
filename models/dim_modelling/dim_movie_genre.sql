with array as (
    select
        movie_id,
        STRTOK_TO_ARRAY (genres, '|') as genres_array
    from {{ref('stg_movielens__raw_movies')}} 
),
flatten as (
    select
        a.movie_id,
        f.value as genres_items
    from 
        array as a,
        LATERAL FLATTEN(INPUT => a.genres_array) as f
)
--select distinct genres_items from flatten
select
    f.movie_id,
    g.genre_id
from flatten as f
    left join {{ref('dim_genre')}} as g
    on f.genres_items = g.genre