
-- ● Reactivated Shoppers: Determine the count of shoppers who had previous
-- transactional activity, remained inactive for 3 months, and resumed
-- transactions during the current month.

WITH monthly_transaction AS(
  SELECT
    shopper_id
    , CAST(FORMAT_DATETIME("%Y-%m-01", transaction_date) AS DATETIME) AS formatted_transaction_date
  FROM
    `gcp-perso.lucky_cart.transactions`
  GROUP BY
    shopper_id
    , CAST(FORMAT_DATETIME("%Y-%m-01", transaction_date) AS DATETIME)
)
, previous_transaction AS(
  SELECT 
    shopper_id
    , formatted_transaction_date
    , LAG(formatted_transaction_date) OVER(PARTITION BY shopper_id ORDER BY formatted_transaction_date ASC) AS prev_formatted_transaction_date
FROM
  monthly_transaction
)
, inactivity_between_transactions AS(
  SELECT 
    *
    , DATE_DIFF(formatted_transaction_date, prev_formatted_transaction_date, MONTH) - 1 AS month_of_inactivity
  FROM
    previous_transaction)

SELECT
  count(*) AS number_of_reactivated_shoppers
FROM
  inactivity_between_transactions
WHERE
  EXTRACT(MONTH FROM formatted_transaction_date) = EXTRACT(MONTH FROM CURRENT_DATE())
  AND EXTRACT(YEAR FROM formatted_transaction_date) = EXTRACT(YEAR FROM CURRENT_DATE())
  AND month_of_inactivity>=3;