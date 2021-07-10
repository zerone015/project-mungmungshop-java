create table delivery(
deli_num int not null auto_increment primary key,
order_code char(7) not null,
deli_name varchar(20) not null,
deli_tel varchar(13) not null,
deli_address varchar(40) not null,
deli_traking int,
deli_request varchar(30),
constraint fk_delivery_ordercode foreign key(order_code) references orders(order_code) on delete restrict
)default charset=utf8;