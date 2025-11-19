select
    movie_title,
    avg_rating,
    number_of_reviews
from 
    {{ ref ('fact_ratings') }}
    join
        {{ ref('dim_movie') }} using (movie_id)
order by   
    2 DESC
limit 10