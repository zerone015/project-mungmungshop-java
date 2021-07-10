create table faqBoard(
faq_no int not null auto_increment primary key,
faq_title varchar(45) not null,
faq_writer varchar(11) not null,
faq_content varchar(1000) not null,
faq_date timestamp not null default current_timestamp,
faq_hits int not null default '0'
)default charset=utf8;