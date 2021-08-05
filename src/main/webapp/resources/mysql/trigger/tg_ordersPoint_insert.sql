DELIMITER //
CREATE TRIGGER ordersTBL_insertTrg
AFTER INSERT 
ON orders
FOR EACH ROW
BEGIN
INSERT INTO point_history VALUES(null, new.member_num, '적립', new.order_addPoint, '주문결제 적립', new.order_code, default);
IF new.order_usePoint <> 0 THEN
	INSERT INTO point_history VALUES(null, new.member_num, '사용', new.order_usePoint, '주문결제 사용', new.order_code, default);
END IF;
END //
DELIMITER ;
