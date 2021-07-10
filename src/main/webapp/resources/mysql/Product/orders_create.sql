create table orders(
order_code char(7) not null default '0' primary key,
p_code char(7) not null,
customer int not null,
order_date timestamp not null default current_timestamp,
order_quantity int not null,
order_status varchar(10) not null default '입금 대기중',
constraint fk_order_pcode foreign key(p_code) references Products(p_code) on delete restrict,
constraint fk_order_customer foreign key(customer) references Members(Member_Num) on delete restrict
)default charset=utf8;