DELIMITER $$
CREATE TRIGGER tg_ordersDetail_insert
BEFORE INSERT ON orders_detail
FOR EACH ROW
BEGIN
  INSERT INTO ordersDetail_seq VALUES (NULL);
  SET NEW.order_detailCode = CONCAT('ODD', LPAD(LAST_INSERT_ID(), 4, '0'));
END$$
DELIMITER ;
