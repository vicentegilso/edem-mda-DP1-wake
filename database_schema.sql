-- DATABASE SCRIPT

-- student table
CREATE TABLE student (
	id int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	name varchar NOT NULL,
	age int4 NOT NULL,
	email varchar NOT NULL,
	CONSTRAINT client_pkey PRIMARY KEY (id)
);

-- degree table
CREATE TABLE degree (
	id int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	degree varchar NOT NULL,
	CONSTRAINT degree_pkey PRIMARY KEY (id)
);
-- insert EDEM degrees into degree table
insert into degree(degree) values ('Grado de Ingeniería y Gestión Empresarial');
insert into degree(degree) values ('Grado ADE Creación y Dirección de Empresas');

-- city table
CREATE TABLE city (
	id int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	name varchar NOT NULL,
	country varchar NOT NULL,
	university varchar NOT NULL,
	university_ranking int4 NOT NULL,
	distance_to_vlc float4 NOT NULL,
	direct_flight int4 NOT NULL,
	avg_temp float4 NOT NULL,
	rainy_days int4 NOT NULL,
	bike_stations_km float4 NOT NULL,
	cost_of_living float4 NOT NULL,
	unemployment_rate float4 NOT NULL,
	CONSTRAINT city_pkey PRIMARY KEY (id)
);
-- insert null city to save forms with no recommended city
insert into city (id, name, country, university, university_ranking, distance_to_vlc, direct_flight, avg_temp, rainy_days, bike_stations_km, cost_of_living, unemployment_rate) 
				values (-1, 'NULL', 'NULL', 'NULL', -1, -1, -1, -1, -1, -1, -1, -1);

-- form table
CREATE TABLE form (
	id int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	id_student int4 NOT NULL,
	id_degree int4 NOT NULL,
	english_level varchar NOT NULL,
	budget float4 NOT NULL,
	working_after int4 NOT NULL,
	return_freq varchar NOT NULL,
	clima varchar NOT NULL,
	rain varchar NOT NULL,
	public_bikes int4 NOT NULL,
	date varchar NOT NULL,
	id_city int4,
	CONSTRAINT form_pkey PRIMARY KEY (id),
    CONSTRAINT form_fk FOREIGN KEY (id_student) REFERENCES student(id),
    CONSTRAINT form_fk_1 FOREIGN KEY (id_degree) REFERENCES degree(id),
    CONSTRAINT form_fk_2 FOREIGN KEY (id_city) REFERENCES city(id)
);

-- users table
create table users (
	id int4 not null GENERATED BY DEFAULT AS IDENTITY,
	username varchar not null,
	password varchar not null,
	CONSTRAINT amdin_pkey PRIMARY KEY (id)
);
-- insert users credentials into users table
insert into users (username, password) values ('admin', 'admin');
insert into users (username, password) values ('user', 'user')
