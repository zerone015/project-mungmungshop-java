create table reviews(
review_num int not null auto_increment primary key,
p_code char(7) not null,
review_writer varchar(20) not null,
review_content varchar(1000) not null,
review_date timestamp not null default current_timestamp,
constraint fk_reviews_pcode foreign key(p_code) references products(p_code) on delete restrict
)default charset=utf8;