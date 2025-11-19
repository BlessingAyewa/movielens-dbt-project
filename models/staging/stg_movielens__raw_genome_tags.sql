with 

source as (

    select * from {{ source('movielens', 'raw_genome_tags') }}

),

renamed as (

    select
        tagid as tag_id,
        tag

    from source

)

select * from renamed