-- .1 Retrieve Latest Transactions: Write an SQL query to obtain the most recent versions of each transaction

SELECT 
  * EXCEPT (RANK_ID) 
FROM (
  SELECT 
    *
    , RANK() OVER (PARTITION BY cart_id ORDER BY version DESC) AS RANK_ID 
  FROM 
    `gcp-perso.lucky_cart.transactions`)
WHERE RANK_ID=1;