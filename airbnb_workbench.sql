CREATE database airbnb;
USE airbnb;

CREATE TABLE airbnb_open_data(
id BIGINT,
name TEXT,
host_id BIGINT,
host_identitiy_verified VARCHAR(50),
host_name TEXT,
neighbourhood_group VARCHAR(100),
neighbourhood VARCHAR(255),
lat VARCHAR(50),
lng VARCHAR(50),
country VARCHAR(100),
country_code VARCHAR(10),
instant_bookable VARCHAR(10),
cancellation_policy VARCHAR(50),
room_type VARCHAR(100),
construction_year VARCHAR(20),
price VARCHAR(50),
service_fee VARCHAR(50),
minimum_nights VARCHAR(20),
number_of_reviews VARCHAR(20),
last_review VARCHAR(50),
review_per_month VARCHAR(20),
review_rate_number VARCHAR(20),
calculated_host_listing_count VARCHAR(20),
availability_365 VARCHAR(20),
house_rules TEXT,
License TEXT
);

SELECT
id,
instant_bookable,
CASE
WHEN instant_bookable = 'TRUE' THEN 'A-Instant Book'
WHEN instant_bookable = 'FALSE' THEN 'B-Not Instant Book'
ELSE 'Others'
END AS experiment_group,
CAST(REPLACE(REPLACE(price,'$',''),',','') AS DECIMAL(10,2)) AS price_clean,
CAST('review_rate_number' AS DECIMAL(10,2)) AS review_rating_clean,
CAST('number_of_reviews' AS DECIMAL(10,2)) AS review_count_clean
FROM airbnb_open_data
WHERE instant_bookable IN ('TRUE','FALSE');