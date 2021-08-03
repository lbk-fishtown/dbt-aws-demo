{% macro vacuumable_tables_sql() %}
    {#-
    Override default behaviour for identifying tables to vacuum. 
    https://github.com/dbt-labs/redshift/blob/0.5.0/macros/redshift_maintenance_operation.sql
    -#}

    select
        current_database() as table_database,
        table_schema,
        table_name
    from information_schema.tables
    where table_schema LIKE 'dbt_lbondkennedy'
    order by table_schema, table_name

{% endmacro %}