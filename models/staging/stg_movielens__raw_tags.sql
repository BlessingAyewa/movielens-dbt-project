with 

source as (

    select * from {{ source('movielens', 'raw_tags') }}

),

renamed as (

    select
        userid as user_id,
        movieid as movie_id,
        tag,
        timestamp

    from source

)

select * from renamed