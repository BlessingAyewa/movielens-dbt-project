with 

source as (

    select * from {{ source('movielens', 'raw_movies') }}

)

select * from source