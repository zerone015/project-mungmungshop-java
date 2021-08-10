DELIMITER //
CREATE TRIGGER loveTBL_deleteTrg
AFTER delete 
ON love
FOR EACH ROW
BEGIN
update products set p_loves = p_loves - 1 where p_code = OLD.p_code;
END //
DELIMITER ;