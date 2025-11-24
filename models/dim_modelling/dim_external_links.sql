select 
    movie_id,
    imbd_link,
    tmbd_link,
    img_link,
    budget_USD,
    revenue_USD,
    original_language
from {{ref('stg_movielens__raw_links')}}