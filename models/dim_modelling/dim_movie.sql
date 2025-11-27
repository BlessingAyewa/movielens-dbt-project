with calc_index as(
    select 
        movie_id,
        title as movie_title,
        row_number() over(order by movie_id) as row_idx
    from {{ref('stg_movielens__raw_movies')}}
)
select 
    movie_id,
    movie_title,
    movie_title || repeat(chr(8203), row_idx) as movie_title_unique
from calc_index