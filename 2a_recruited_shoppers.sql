-- ● Recruited Shoppers: Calculate the number of shoppers who initiated their first
-- transaction during the current month.
SELECT 
  COUNT(*) AS number_of_shoppers
  , CONCAT(EXTRACT(MONTH FROM CURRENT_DATE()),"-",EXTRACT(YEAR FROM CURRENT_DATE())) AS current_month,
FROM (
  SELECT
    *
    , RANK() OVER (PARTITION BY shopper_id ORDER BY transaction_date ASC) AS RANK_ID 
  FROM 
    `gcp-perso.lucky_cart.transactions`)
WHERE 
  RANK_ID=1 
  AND EXTRACT(MONTH FROM transaction_date) = EXTRACT(MONTH FROM CURRENT_DATE())
  AND EXTRACT(YEAR FROM transaction_date) = EXTRACT(YEAR FROM CURRENT_DATE());