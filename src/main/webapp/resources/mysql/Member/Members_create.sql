create table Members (
Member_Num int not null auto_increment primary key,
Member_ID varchar(11) not null,
Member_PW varchar(20) not null,
Member_name varchar(45) not null,
Member_email varchar(50) not null,
Member_Phone varchar(13) not null,
Member_Nick varchar(20),
Member_joindate timestamp default current_timestamp()
)default charset=utf8;
