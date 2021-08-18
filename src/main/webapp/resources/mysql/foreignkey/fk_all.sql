alter table cart add foreign key(p_code) references products(p_code) on delete cascade;
alter table love add foreign key(p_code) references products(p_code) on delete cascade;
alter table address add foreign key(member_num) references members(member_num) on delete cascade;
alter table point_history add foreign key(member_num) references members(member_num) on delete cascade;
alter table reviews add foreign key(p_code) references products(p_code) on delete cascade;
alter table orders_detail add foreign key(order_code) references orders(order_code) on delete cascade;
alter table delivery add foreign key(order_code) references orders(order_code) on delete cascade;

SET FOREIGN_KEY_CHECKS = 0;