create table orders_detail(
order_detailCode char(7) not null default '0' primary key,
order_code char(7) not null,
order_price int not null,
delivery varchar(20) not null default '상품 준비중',
constraint fk_ordersDetail_orderCode foreign key(order_code) references orders(order_code) on delete cascade
)default charset=utf8;