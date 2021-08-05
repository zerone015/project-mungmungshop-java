DELIMITER //
CREATE TRIGGER membersTBL_insertTrg
AFTER INSERT 
ON members
FOR EACH ROW
BEGIN
INSERT INTO point_history VALUES(null, new.member_num, '적립', 500, '회원가입 적립', null, default);
END //
DELIMITER ;