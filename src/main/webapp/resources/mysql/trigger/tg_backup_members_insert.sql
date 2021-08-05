DELIMITER //
CREATE TRIGGER backMembersTBL_DeleteTrg
AFTER DELETE 
ON members
FOR EACH ROW
BEGIN
INSERT INTO backup_members VALUES(OLD.member_num, OLD.member_id, OLD.member_name, OLD.member_phone, OLD.member_nick, OLD.member_joindate, OLD.member_manager, OLD.member_logindate,
OLD.member_point, '삭제', current_timestamp(), CURRENT_USER());
END //
DELIMITER ;