drop database if exists bmdb;
create database bmbd;
use bmbd;

create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null unique,
	rating 			varchar(5) 		not null default 0,
	year 			int 			not null,
	director 		varchar(50) 	not null
    -- constraint title unique (the title is unique)
);

Insert into movie (title, rating, year, director) values
('Man From Nowhere', 5, 2010, 'Lee Jeong Beom'),
('John Wick', 4, 2014, 'Chas Stahelski'),
('Inception', 5, 2010, 'Christopher Nolan');


create table actor (
	id 				int 			not null primary key auto_increment,
	firstname 		varchar(25) 	not null,
	lastname 		varchar(25) 	not null,
	gender 			varchar(1) 		not null,
	birthdate 		date 		not null,
    
    constraint unq_actor unique (firstname, lastname, birthdate)

    -- constraint unq_actor unique (firstname, lastname, birthdate) this is so no 2 actors have the same firstlastbd, 
    -- this ensures data integrity, so that if there are 1000's of data the data is clean
);

Insert into actor (firstname, lastname, gender, birthdate) values 
('Won', 'Bin', 'm', '1956-11-10'),
('Keanu', 'Reeves', 'm', '1964-09-02'),
('Leonardo', 'DiCaprio', 'm', '1974-11-11'),
('Ellen', 'Page', 'f', '1987-02-01')
;


-- business rule - combo of actor+movie must be unique
create table credit (
	id 				int 			not null primary key auto_increment,
	movieID			int			 	not null,
	actorID 		int 			not null,
	role 			varchar(90) 		not null,
  foreign key (movieID) references movie(id),
    foreign key (actorID) references actor(id),
    
    constraint act_mov unique (actorid, moviei)
);

Insert into credit (movieID, actorID, role) values
('1', '1', 'lead'),
('2', '2', 'lead'),
('3', '3', 'lead'),
('3', '4', 'support');


-- create user bmdb_user@localhost identified by 'sesame';
-- grant select, insert, delete, update on bmdb.* to bmdb_user@localhost;
