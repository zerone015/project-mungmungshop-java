create table cart(
cart_code int not null auto_increment primary key,
member_num int not null,
p_code char(7) not null,
cart_quantity int not null,
cart_date timestamp not null default current_timestamp
)default charset=utf8;