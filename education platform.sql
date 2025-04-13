create table members (
	id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	username varchar(50) unique not null,
	email varchar(100) unique not null,
	password varchar(100) not null,
	created_at timestamp default current_timestamp
);

create table categories (
	id smallint primary key,
	name varchar(100) not null
);

create table courses (
	id bigint primary key,
	name varchar(200) not null,
	description text,
	start_date date not null,
	end_date date not null,
	instructor varchar(100) not null,
	category_id smallint,
	foreign key (category_id) references categories(id)
);

create table certificates (
	id bigint primary key,
	certificate_code varchar(100) unique,
	issue_date date not null
);

create table certificates_assignments (
	id bigserial primary key,
	user_id integer not null,
	certificate_id bigint not null,
	assignment_date date default current_date,
	foreign key (user_id) references members(id),
	foreign key (certificate_id) references certificates(id)	
);

create table blog_posts (
	id bigserial primary key,
	title varchar(225) not null,
	content text not null,
	publish_date timestamp default current_timestamp,
	author_id integer not null,
	foreign key (author_id) references members(id)
);




