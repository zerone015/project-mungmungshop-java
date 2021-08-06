DELIMITER //
CREATE TRIGGER orders_detailTrg 
AFTER INSERT
ON orders_detail
FOR EACH ROW
BEGIN
UPDATE products SET p_stock = p_stock - NEW.order_quantity
WHERE p_code = NEW.p_code;
END //
DELIMITER ;