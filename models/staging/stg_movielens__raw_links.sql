with 

source as (

    select * from {{ source('movielens', 'raw_links') }}

),

renamed as (

    select
        movieid as movie_id,
        imdbid as imbd_id,
        tmdbid as tmbd_id
    from source

)

select * from renamed