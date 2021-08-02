DELIMITER //
CREATE TRIGGER membersTBL_UpdateTrg
AFTER UPDATE 
ON members_oauth
FOR EACH ROW
BEGIN
update members set member_logindate = new.member_logindate where member_id = OLD.member_id;
END //
DELIMITER ;