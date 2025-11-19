with

source as (

    select * from {{ source('movielens', 'raw_ratings') }}

),

renamed as (

    select
        userid as user_id,
        movieid as movie_id,
        rating,
        timestamp
    from source

)

select * from renamed