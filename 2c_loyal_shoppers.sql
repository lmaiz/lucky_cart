-- ● Loyal Shoppers: Find the number of shoppers who engaged in at least 1 transaction
-- during the last 3 months and at least 1 transaction during the current month.
WITH transactions_over_last_3_months AS (
  SELECT
    *
  FROM
    `gcp-perso.lucky_cart.transactions`
  WHERE
    TRANSACTION_DATE >= DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH), MONTH)
    AND TRANSACTION_DATE <= LAST_DAY(CURRENT_DATE(), MONTH))
, activity_grouped_by_shopper_and_month AS (
  SELECT
    shopper_id
    , CAST(FORMAT_DATETIME("%Y-%m-01", transaction_date) AS DATETIME)
  FROM 
    transactions_over_last_3_months
  GROUP BY 
    shopper_id
    , CAST(FORMAT_DATETIME("%Y-%m-01", transaction_date) AS DATETIME)
)
, active_months_by_shopper AS (
  SELECT
    shopper_id
    , count(shopper_id) AS number_of_active_months
  FROM 
    activity_grouped_by_shopper_and_month
  GROUP BY
    shopper_id)

SELECT
  count(*) AS number_of_loyal_shoppers
FROM 
  active_months_by_shopper
WHERE
  number_of_active_months = 4;