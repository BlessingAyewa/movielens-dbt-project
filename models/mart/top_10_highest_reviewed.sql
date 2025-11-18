select
    movie_title,
    number_of_reviews,
    avg_rating
from 
    {{ ref ('fact_ratings') }}
    join
        {{ ref('dim_movie') }} using (movie_id)
order by   
    number_of_reviews DESC
limit 10