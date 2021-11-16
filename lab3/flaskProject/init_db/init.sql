create table users
(
	id serial,
	full_name varchar,
	login varchar not null,
	password varchar not null
);

create unique index users_id_uindex
	on users (id);

create unique index users_login_uindex
	on users (login);

alter table users
	add constraint users_pk
		primary key (id);

