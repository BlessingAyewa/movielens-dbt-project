select
    genre,
    count (distinct movie_id) as number_of_movies
from 
    {{ ref ('dim_genre') }}
    left join
        {{ ref('dim_movie_genre') }} using (genre_id)
    left join
        {{ ref ('fact_ratings') }} using (movie_id)
group by
    genre
order by   
    2 DESC

