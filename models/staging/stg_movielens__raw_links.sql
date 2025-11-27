with 

source as (

    select 
        *, 
        row_number() over(partition by movie_id order by movie_id ASC) as dense_ranking
    from 
        {{ source('movielens', 'raw_links') }}
    order by 
        movie_id ASC

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
    where 
        dense_ranking = 1

)

select * from renamed