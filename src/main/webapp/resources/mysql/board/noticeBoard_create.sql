create table noticeBoard(
notice_no int not null auto_increment primary key,
notice_title varchar(45) not null,
notice_writer varchar(11) not null,
notice_content varchar(1000) not null,
notice_date timestamp not null default current_timestamp,
notice_hits int not null default '0'
)default charset=utf8;