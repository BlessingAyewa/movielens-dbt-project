with

source as (

    select * from {{ source('movielens', 'raw_movies') }}

),

renamed as (

    select
        movieid as movie_id,
        title,
        genres
    from source

)

select * from renamed