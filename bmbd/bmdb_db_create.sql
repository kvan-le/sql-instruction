drop database if exists bmdb;
create database bmdb;
use bmdb;

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
('13', 'Black Swan', 4, 2010, 'Darryn Aronofsky'),
('14', 'Joker', 5, 2019, 'Todd Phillips')

;


create table actor (
	id 				int 			not null primary key auto_increment,
	firstname 		varchar(25) 	not null,
	lastname 		varchar(25) 	not null,
	gender 			varchar(1) 		not null,
	birthdate 		date 		not null,
    
    constraint unq_actor unique (firstname, lastname, birthdate)

    /* constraint unq_actor unique (firstname, lastname, birthdate) this is so no 2 actors have the same firstlastbd, 
	this ensures data integrity, so that if there are 1000's of data the data is clean */
);

Insert into actor (id, firstname, lastname, gender, birthdate) values 
('1', 'Won', 'Bin', 'm', '1956-11-10'),
('2', 'Keanu', 'Reeves', 'm', '1964-09-02'),
('3', 'Leonardo', 'DiCaprio', 'm', '1974-11-11'),
('4', 'Ellen', 'Page', 'f', '1987-02-01'),
('5', 'Ralph', 'Fiennes', 'm', '1962-12-22'),
('6', 'Ryunosuke', 'Kamiki', 'm', '1993-05-19'),
('7', 'Fionn', 'Whitehead', 'm', '1997-07-18'),
('8', 'Keira', 'Knightley', 'f', '1985-03-26'),
('9', 'Benedict', 'Cumberbatch', 'm', '1976-07-19'),
('10', 'Ryan', 'Gosling', 'm', '1980-11-12'),
('11', 'Emma', 'Stone', 'f', '1988-11-06'),
('12', 'Hugh', 'Jackman', 'm', '1968-10-12'),
('13', 'Patrick', 'Stewart', 'm', '1940-07-13'),
('14', 'Jesse', 'Eisenberg', 'm', '1983-10-05'),
('15', 'Andrew', 'Garfield', 'f', '1983-08-20'),
('16', 'Margot', 'Robbie', 'f', '1990-07-02'),
('17', 'Zazi', 'Beetz', 'f', '1991-09-12'),
('18', 'Emma', 'Watson', 'f', '1990-04-15')
;


-- business rule - combo of actor+movie must be unique
create table credit (
	id 				int 			not null primary key auto_increment,
	movieID			int(11)			 	not null,
	actorID 		int(11) 			not null,
	role 			varchar(255) 		not null,
  foreign key (movieID) references movie(id),
    foreign key (actorID) references actor(id),
    
   CONSTRAINT act_mov unique (movieid, actorid)
);

Insert into credit (movieID, actorID, role) values
('1', '1', 'Cha Tae Sik'),
('2', '2', 'John Wick'),
('3', '3', 'Cobb'),
('3', '4', 'Ariadne'),
('4', '5', 'M. Gustave'),
('5', '6', 'Taki'),
('6', '7', 'Tommy'),
('7', '8', 'Joan'),
('7', '9', 'Alan'),
('8', '10', 'Sebastian'),
('8', '11', 'Mia'),
('9', '12', 'Logan'),
('9', '13', 'Professor X'),
('10', '14', 'Mark'),
('10', '15', 'Eduardo'),
('11', '3', 'Hugh Glass'),
('12', '3', 'Jordan'),
('12', '16', 'Naomi')
 
;



create table genre (
	id 				int 			not null primary key auto_increment,
	name			varchar(10)			 	not null

        -- constraint act_mov unique (actorid, movie)
);

Insert into genre (id, name) values
('1', 'Thriller'),
('2', 'Crime'),
('3', 'Scifi'),
('4', 'Adventure'),
('5', 'Romance'),
('6', 'Action'),
('7', 'Drama'),
('8', 'Comedy'),
('9', 'Biography'),
('10', 'Animation'),
('11', 'Fantasy')
;




create table moviegenre (
	id 				int 			not null primary key auto_increment,
	movieID			int			 	not null,
	genreID 		int 			not null,
	
  foreign key (movieID) references movie(id),
    foreign key (genreID) references genre(id)
    
    -- constraint act_mov unique (actorid, movie)
);


Insert into moviegenre (id, movieID, genreID) values
('1', '1', '2'),
('2', '2', '1'),
('3', '3', '3'),
('4', '4', '4'),
('5', '5', '11'),
('6', '6', '6'),
('7', '7', '9'),
('8', '8', '8'),
('9', '9', '7'),
('10', '10', '9'),
('11', '11', '6'),
('12', '12', '2')
;


/* create a user and grant privileges to that user
 even if you drop the db this user still exists */

-- drop user if exists bmdb_user@localhost;
-- create user bmdb_user@localhost identified by 'sesame';
-- grant select, insert, delete, update on bmdb.* to bmdb_user@localhost;