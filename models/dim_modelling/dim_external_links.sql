select 
    movie_id,
    imbd_id,
    'http://www.imdb.com/title/tt' || imbd_id as imbd_link,
    tmbd_id,
    'https://www.themoviedb.org/movie/' || tmbd_id as tmbd_link
from {{ref('stg_movielens__raw_links')}}