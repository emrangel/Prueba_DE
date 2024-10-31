WITH unnest_event_params AS (
    SELECT
        event_bundle_sequence_id AS Unique_session_id,
        FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP_SECONDS(CAST(event_timestamp / 1000000 AS INT64))) AS event_date,
        event_name,
        event_timestamp,
        ep.key AS param_key,
        CASE
            WHEN ep.value.string_value IS NOT NULL THEN ep.value.string_value
            WHEN ep.value.int_value IS NOT NULL THEN CAST(ep.value.int_value AS STRING)
            WHEN ep.value.float_value IS NOT NULL THEN CAST(ep.value.float_value AS STRING)
            ELSE NULL
        END AS param_value,
        geo.region AS geo_region  -- Extraemos geo.region directamente
    FROM
        `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210131`,
        UNNEST(event_params) AS ep -- Desanidamos geo
),

event_data AS (
    SELECT
        Unique_session_id,
        event_date,
        event_name,
        event_timestamp,
        MAX(CASE WHEN param_key = 'event_number' THEN param_value END) AS event_number,
        MAX(CASE WHEN param_key = 'campaign_medium' THEN param_value END) AS campaign_medium,
        MAX(CASE WHEN param_key = 'page_location' THEN param_value END) AS page_location,
        MAX(CASE WHEN param_key = 'ga_session_number' THEN param_value END) AS ga_session_number,
        MAX(geo_region) AS geo_region  -- Max para agrupar geo_region
    FROM
        unnest_event_params
    GROUP BY
        Unique_session_id,
        event_date,
        event_name,
        event_timestamp
)

SELECT
    Unique_session_id,
    event_date,
    event_name,
    event_number,
    event_timestamp,
    geo_region,
    campaign_medium,
    page_location,
    ga_session_number
FROM
    event_data
ORDER BY
    event_timestamp;


