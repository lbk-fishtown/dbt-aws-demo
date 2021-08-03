{{
    config(
        materialized='view',
        bind=False
    )
}}

select * 
from   {{ source('rjf_height', 'height_survey_results') }}