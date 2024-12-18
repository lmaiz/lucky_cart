INSERT INTO `gcp-perso.lucky_cart.transactions` (
  shopper_id, cart_id, transaction_date, order_status, store_id, final_ati_amount,
  final_tf_amount, total_discount_ati_amount, total_discount_tf_amount, delivery_ati_amount,
  delivery_tf_amount, delivery_mode, delivery_date, promo_code, promo_code_ati_amount,
  cancelation_date, products, version
)
VALUES
(
  "shopper_001", 
  "cart_001", 
  "2024-09-10 11:00:00", 
  "Confirmed", 
  "store_003", 
  220.00, 
  200.00, 
  20.00, 
  18.00, 
  7.00, 
  6.50, 
  "express", 
  "2024-09-12 14:00:00", 
  "PROMO15", 
  15.00, 
  NULL, 
  [
    STRUCT("product_001", 110.00, 100.00, 1, 110.00, 100.00), 
    STRUCT("product_008", 110.00, 100.00, 1, 110.00, 100.00)
  ],
  "2024-09-10 11:15:00"
),
(
  "shopper_001", 
  "cart_002", 
  "2024-10-18 09:30:00", 
  "Pending", 
  "store_001", 
  200.00, 
  180.00, 
  20.00, 
  18.00, 
  5.00, 
  4.50, 
  "standard", 
  "2024-10-20 10:00:00", 
  "PROMO10", 
  10.00, 
  NULL, 
  [
    STRUCT("product_001", 100.00, 90.00, 1, 100.00, 90.00), 
    STRUCT("product_002", 100.00, 90.00, 1, 100.00, 90.00)
  ],
  "2024-10-18 09:45:00"
),
(
  "shopper_001", 
  "cart_003", 
  "2024-11-05 10:45:00", 
  "Delivered", 
  "store_002", 
  260.00, 
  240.00, 
  20.00, 
  18.00, 
  10.00, 
  9.00, 
  "standard", 
  "2024-11-07 09:00:00", 
  "PROMO20", 
  20.00, 
  NULL, 
  [
    STRUCT("product_014", 130.00, 120.00, 1, 130.00, 120.00), 
    STRUCT("product_003", 130.00, 120.00, 1, 130.00, 120.00)
  ],
  "2024-11-05 11:00:00"
),
(
  "shopper_001", 
  "cart_004", 
  "2024-12-15 14:30:00", 
  "Confirmed", 
  "store_001", 
  100.25, 
  90.00, 
  10.25, 
  9.00, 
  5.50, 
  5.00, 
  "standard", 
  "2024-12-16 10:00:00", 
  "PROMO10", 
  10.00, 
  NULL, 
  [
    STRUCT("product_001", 50.00, 45.00, 1, 50.00, 45.00),
    STRUCT("product_002", 50.25, 45.00, 1, 50.25, 45.00)
  ],
  "2024-12-15 14:45:00"
),
(
  "shopper_002", 
  "cart_005", 
  "2024-08-22 14:30:00", 
  "Confirmed", 
  "store_002", 
  180.00, 
  160.00, 
  20.00, 
  18.00, 
  10.00, 
  9.00, 
  "standard", 
  "2024-08-24 12:00:00", 
  "PROMO20", 
  20.00, 
  NULL, 
  [
    STRUCT("product_010", 90.00, 80.00, 1, 90.00, 80.00), 
    STRUCT("product_011", 90.00, 80.00, 1, 90.00, 80.00)
  ],
  "2024-08-22 14:45:00"
),
(
  "shopper_002", 
  "cart_006", 
  "2024-12-14 16:00:00", 
  "Pending", 
  "store_002", 
  200.00, 
  180.00, 
  20.00, 
  18.00, 
  NULL, 
  NULL, 
  NULL, 
  NULL, 
  "PROMO20", 
  20.00, 
  NULL, 
  [
    STRUCT("product_003", 100.00, 90.00, 2, 200.00, 180.00)
  ],
  "2024-12-14 16:15:00"
),
(
  "shopper_002", 
  "cart_007", 
  "2024-12-14 16:00:00", 
  "Confirmed", 
  "store_002", 
  250.00, 
  220.00, 
  30.00, 
  28.00, 
  NULL, 
  NULL, 
  "express", 
  "2024-12-16 14:00:00", 
  "PROMO25", 
  25.00, 
  NULL, 
  [
    STRUCT("product_004", 120.00, 110.00, 1, 120.00, 110.00), 
    STRUCT("product_005", 130.00, 120.00, 1, 130.00, 120.00)
  ],
  "2024-12-15 10:30:00"
),
(
  "shopper_003", 
  "cart_008", 
  "2024-11-20 15:45:00", 
  "Pending", 
  "store_003", 
  180.00, 
  160.00, 
  20.00, 
  18.00, 
  10.00, 
  9.00, 
  "standard", 
  "2024-11-22 09:00:00", 
  "PROMO15", 
  15.00, 
  NULL, 
  [
    STRUCT("product_006", 90.00, 80.00, 1, 90.00, 80.00), 
    STRUCT("product_007", 90.00, 80.00, 1, 90.00, 80.00)
  ],
  "2024-11-20 16:00:00"
),
(
  "shopper_004", 
  "cart_009", 
  "2024-12-10 12:00:00", 
  "Delivered", 
  "store_004", 
  300.00, 
  270.00, 
  30.00, 
  27.00, 
  15.00, 
  13.00, 
  "express", 
  "2024-12-12 08:00:00", 
  "PROMO30", 
  30.00, 
  NULL, 
  [
    STRUCT("product_008", 150.00, 135.00, 1, 150.00, 135.00), 
    STRUCT("product_009", 150.00, 135.00, 1, 150.00, 135.00)
  ],
  "2024-12-10 12:30:00"
)
;
