create table products(
p_code char(7) not null default '0' primary key,
p_cl1 varchar(10) not null,
p_cl2 varchar(10) not null, 
p_brand varchar(20) not null,
p_name varchar(50) not null,
p_price int not null, 
p_salePrice int, 
p_stock int not null,
p_imageFileName varchar(100) not null,
p_description varchar(1000) not null,
p_date timestamp not null default current_timestamp, 
p_loves int not null default '0',
p_origin varchar(56) not null)default charset=utf8;