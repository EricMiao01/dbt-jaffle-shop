SELECT
    *
FROM
        {{ source('jaffle_shop', 'orders') }}