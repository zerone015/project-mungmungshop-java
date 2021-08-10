DELIMITER //
CREATE TRIGGER loveTBL_insertTrg
AFTER INSERT 
ON love
FOR EACH ROW
BEGIN
update products set p_loves = p_loves + 1 where p_code = new.p_code;
END //
DELIMITER ;