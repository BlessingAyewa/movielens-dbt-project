select
    movie_id,
    count(*) as number_of_reviews,
    ROUND(avg(rating), 2) as avg_rating
from 
    {{ref('stg_movielens__raw_ratings')}}
group by 
    1
order by 
    2 DESC, 3 DESC
