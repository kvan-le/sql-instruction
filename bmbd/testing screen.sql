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

Insert into movie (id, title, rating, year, director) values
('1', 'Man From Nowhere', 5, 2010, 'Lee Jeong Beom'),
('2', 'John Wick', 4, 2014, 'Chas Stahelski'),
('3', 'Inception', 5, 2010, 'Christopher Nolan'),
('4', 'The Grand Budapest Hotel', 4, 2014, 'Wes Anderson'),
('5', 'Your Name', 4, 2016, 'Makoto Shinkai'),
('6', 'Dunkirk', 4, 2017, 'Christopher Nolan'),
('7', 'The Imitation Game', 5, 2014, 'Morten Tyldum'),
('8', 'La La Land', 5, 2016, 'Damien Chazelle'),
('9', 'Logan', 5, 2017, 'James Mangold'),
('10', 'The Social Network', 3, 2010, 'David Fincher'),
('11', 'The Revenant', 5, 2015, 'Alejandro Inarritu'),
('12', 'Wolf of Wall Street', 5, 2013, 'Martin Scorsese'),
('13', 'The Avengers', 5, 2012, 'Joss Whedon'),
('14', 'Captain America: Civil War', 4, 2016, 'Anthony Russo'),
('15', 'The Avengers: End Game', 4, 2016, 'Anthony Russo'),
('16', 'The Dark Knight', 5, 2008, 'Christopher Nolan'),
('17', 'Brokeback Mountain', 4, 2005, 'Ang Lee'),
('18', 'Blue Valentine', 4, 2010, 'Derek Cianfrance'),
('19', 'The Amazing Spider-Man', 5, 2012, 'Marc Webb')
;



('1', 'Won', 'Bin', 'm', '1956-11-10'),
('2', 'Keanu', 'Reeves', 'm', '1964-09-02'),
('3', 'Leonardo', 'DiCaprio', 'm', '1974-11-11'),
('4', 'Ellen', 'Page', 'f', '1987-02-01'),
('5', 'Ralph', 'Fiennes', 'm', '1962-12-22'),
('6', 'Ryunosuke', 'Kamiki', 'm', '1993-05-19'),
('7', 'Fionn', 'Whitehead', 'm', '1997-07-18'),
('8', 'Keira', 'Knightley', 'f', '1985-03-26'),
('9', 'Benedict', 'Cumberbatch', 'm', '1976-07-19'),
('', 'Ryan', 'Gosling', 'm', '1980-11-12'),
('', 'Emma', 'Stone', 'f', '1988-11-06'),
('', 'Hugh', 'Jackman', 'm', '1968-10-12'),
('', 'Patrick', 'Stewart', 'm', '1940-07-13'),
('', 'Jesse', 'Eisenberg', 'm', '1983-10-05'),
('', 'Margot', 'Robbie', 'f', '1990-07-02'),
('', 'Scarlett', 'Johansson', 'f', '1984-11-22'),
('', 'Robert', 'Downey Jr.', 'm', '1965-04-04'),
('', 'Chris', 'Evans', 'm', '1981-06-13'),
('', 'Christian', 'Bale', 'm', '1974-01-30'),
('', 'Heath', 'Ledger', 'm', '1979-04-04'),
('', 'Jake', 'Gyllenhaal', 'm', '1980-12-19'),
('', 'Michelle', 'Williams', 'f', '1980-09-09'),
('', 'Andrew', 'Garfield', 'm', '1983')
;
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
