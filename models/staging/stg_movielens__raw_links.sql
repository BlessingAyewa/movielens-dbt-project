with 

source as (

    select * from {{ source('movielens', 'raw_links') }}

),

renamed as (

    select
        movie_id,
        imbd_id,
        imbd_link,
        tmbd_id,
        tmbd_link,
        img_link,
        budget_value as budget_USD,
        revenue_value as revenue_USD,
        lang as original_language
        
    from source

)

select * from renamed