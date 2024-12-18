-- 3- Data Quality Assessment:

--a) Check missing values on mandatory fields
SELECT
  (COUNTIF(shopper_id IS NULL OR shopper_id="") / count(*)) * 100 AS percentage_missing_shopper_id
  , (COUNTIF(cart_id IS NULL OR cart_id="") / count(*)) * 100 AS percentage_missing_cart_id
  , (COUNTIF(transaction_date IS NULL) / count(*))*100 AS percentage_missing_transaction_date
  , (COUNTIF(version IS NULL) / count(*)) * 100 AS percentage_missing_version
FROM 
  `gcp-perso.lucky_cart.transactions`;

-- b) Duplicates on PKs
SELECT
  count(*) AS number_of_duplicates
FROM
  `gcp-perso.lucky_cart.transactions`
GROUP BY
  shopper_id
  , cart_id
  , version
HAVING
  count(*)>1
;
-- c) Check outliers 
-- Check Int/Float fields
SELECT
  (COUNTIF(final_ati_amount < 0) / count(*)) * 100 AS percentage_negative_final_ati_amount
  , (COUNTIF(final_tf_amount < 0) / count(*)) * 100 AS percentage_negative_final_tf_amount
  , (COUNTIF(total_discount_ati_amount < 0) / count(*)) * 100 AS percentage_negative_total_discount_ati_amount
  , (COUNTIF(total_discount_tf_amount < 0) / count(*)) * 100 AS percentage_negative_total_discount_tf_amount
  -- , etc. for every price fields 
FROM 
  `gcp-perso.lucky_cart.transactions`;

-- Check Date fields
-- Let's say the system was put in place on 2017-01-01. We shouldn't have any transactions before this date
SELECT
  (COUNTIF(transaction_date < "2017-01-01" OR transaction_date > CURRENT_DATE()) / count(*)) * 100 AS percentage_inconsistent_transaction_date
  , (COUNTIF(version < "2017-01-01" OR version > CURRENT_DATE()) / count(*)) * 100 AS percentage_inconsistent_version
FROM 
  `gcp-perso.lucky_cart.transactions`;

-- Check consistency on delivery_mode and order_status fields
SELECT
  (COUNTIF(delivery_mode NOT IN ("standard", "express", NULL)) / count(*)) * 100 AS percentage_inconsistent_delivery_mode
  , (COUNTIF(order_status NOT IN ("Confirmed", "Pending", "Cancelled" , NULL)) / count(*)) * 100 AS percentage_inconsistent_order_status
FROM 
  `gcp-perso.lucky_cart.transactions`;

-- d) Check format

-- Date format
SELECT
  (COUNTIF(CAST(transaction_date AS STRING) NOT LIKE '____-__-__ __:__:__') / count(*)) * 100 AS percentage_invalid_format_transaction_date
  , (COUNTIF(CAST(version AS STRING) NOT LIKE '____-__-__ __:__:__') / count(*)) * 100 AS percentage_invalid_format_version
FROM
  `gcp-perso.lucky_cart.transactions`;


-- IDs format
SELECT
  (COUNTIF(shopper_id NOT LIKE 'shopper____') / count(*)) * 100 AS percentage_invalid_format_shopper_id
  , (COUNTIF(cart_id NOT LIKE 'cart____') / count(*)) * 100 AS percentage_invalid_format_cart_id
  , (COUNTIF(store_id NOT LIKE 'store____') / count(*)) * 100 AS percentage_invalid_format_store_id
FROM
  `gcp-perso.lucky_cart.transactions`;
