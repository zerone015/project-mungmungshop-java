DROP PROCEDURE IF EXISTS review_pass; 
DELIMITER // 
CREATE PROCEDURE review_pass(IN member_num int, IN member_nick varchar(20), IN p_code char(7)) 
BEGIN 
	update members set member_point = member_point + 500 where member_num = member_num;
    insert into point_history values(null, member_num, '적립', 500, '후기 작성 지급', null, default);
    update reviews set review_test = 'Y' where member_nick = member_nick AND p_code = p_code;
END // 
DELIMITER ;