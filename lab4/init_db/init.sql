create table users
(
	id serial,
	chat_id int not null,
	state int not null,
	login varchar,
	age int
);

create unique index users_id_uindex
	on users (id);

create unique index users_chat_id_uindex
	on users (chat_id);

alter table users
	add constraint users_pk
		primary key (id);

