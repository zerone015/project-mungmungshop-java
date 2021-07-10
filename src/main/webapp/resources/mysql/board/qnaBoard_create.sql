create table qnaBoard(
qna_no int not null auto_increment primary key,
qna_originNo int not null,
qna_groupOrd int not null default '0',
qna_groupLayer int not null default '0',
qna_title varchar(45) not null,
qna_writer varchar(11) not null,
qna_content varchar(1000) not null,
qna_date timestamp not null default current_timestamp,
qna_secret char(1) not null default 'N',
qna_hits int not null default '0'
)default charset=utf8;