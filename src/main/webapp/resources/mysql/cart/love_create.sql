create table love(
love_code int not null auto_increment primary key,
member_num int not null,
p_code char(7) not null,
constraint fk_love_memberNum foreign key(member_num) references Members(member_num) on delete cascade,
constraint fk_love_pCode foreign key(p_code) references products(p_code) on delete cascade
)default charset=utf8;
