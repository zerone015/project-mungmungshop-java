create table backup_members(
Member_Num int not null primary key,
Member_ID varchar(11) not null,
Member_PW varchar(100) not null,
Member_name varchar(45) not null,
Member_Phone varchar(13) not null,
Member_Nick varchar(20) not null,
Member_joindate timestamp not null,
Member_manager int not null,
Member_logindate timestamp,
member_point int not null,
modType char(2) not null,
modDate timestamp not null,
modUser varchar(256) not null);
