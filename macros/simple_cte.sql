{% macro select_sources(refs) %}
WITH 
{% for ref in refs %}

{{ ref }} AS (

  SELECT *
  FROM {{ source('tpc', ref) }}

)
{%- if not loop.last -%}
,
{%- endif -%}

{% endfor %}
{% endmacro %}

{% macro select_refs(refs) %}
WITH 
{% for model in refs %}

{{ model }} AS (

  SELECT *
  FROM {{ ref(model) }}

)
{%- if not loop.last -%}
,
{%- endif -%}

{% endfor %}
{% endmacro %}