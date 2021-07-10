select * from information_schema.table_constraints where constraint_schema = 'petshopdb';

alter table cart drop foreign key fk_cart_memberNum;
alter table cart drop foreign key fk_cart_pCode;
alter table delivery drop foreign key fk_delivery_ordercode;
alter table love drop foreign key fk_love_memberNum;
alter table love drop foreign key fk_love_pCode;
alter table orders drop foreign key fk_order_customer; 
alter table orders drop foreign key fk_order_pcode;
alter table orders_detail drop foreign key fk_ordersDetail_orderCode;
alter table reviews drop foreign key fk_reviews_pcode;