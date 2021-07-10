create table eventBoard(
event_no int not null auto_increment primary key,
event_title varchar(45) not null,
event_writer varchar(11) not null,
event_content varchar(1000) not null,
event_date timestamp not null default current_timestamp,
event_hits int not null default '0',
event_image_filename varchar(100)
)default charset=utf8;