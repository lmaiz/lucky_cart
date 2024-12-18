CREATE TABLE `gcp-perso.lucky_cart.transactions` (
  shopper_id STRING,
  cart_id STRING,
  transaction_date DATETIME,
  order_status STRING,
  store_id STRING,
  final_ati_amount FLOAT64,
  final_tf_amount FLOAT64,
  total_discount_ati_amount FLOAT64,
  total_discount_tf_amount FLOAT64,
  delivery_ati_amount FLOAT64,
  delivery_tf_amount FLOAT64,
  delivery_mode STRING,
  delivery_date DATETIME,
  promo_code STRING,
  promo_code_ati_amount FLOAT64,
  cancelation_date DATETIME,
  products ARRAY<STRUCT<
    product_id STRING,
    unit_ati_amount FLOAT64,
    unit_tf_amount FLOAT64,
    quantity INT64,
    final_ati_amount FLOAT64,
    final_tf_amount FLOAT64
  >>,
  version DATETIME
);
