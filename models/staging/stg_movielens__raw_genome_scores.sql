with 

source as (

    select * from {{ source('movielens', 'raw_genome_scores') }}

),

renamed as (

    select
        movieid as movie_id,
        tagid as tag_id,
        relevance

    from source

)

select * from renamed