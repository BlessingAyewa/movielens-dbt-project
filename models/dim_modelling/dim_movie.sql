select 
    movie_id,
    title as movie_title
from {{ref('stg_movielens__raw_movies')}}