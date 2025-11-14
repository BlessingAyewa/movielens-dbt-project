with 

source as (

    select * from {{ source('movielens', 'raw_movies') }}

),

renamed as (

    select

    from source

)

select * from renamed