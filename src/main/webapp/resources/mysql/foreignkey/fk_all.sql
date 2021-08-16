alter table cart add foreign key(p_code) references products(p_code) on delete cascade;
alter table love add foreign key(p_code) references products(p_code) on delete cascade;
alter table point_history add foreign key(member_num) references members(member_num) on delete cascade;
alter table address add foreign key(member_num) references members(member_num) on delete cascade;

SET FOREIGN_KEY_CHECKS = 0;