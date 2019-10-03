select * from movie;

select * from actor;

select * from actor  
where birthdate > '1992-11-30';


-- list all actors for a movie
select * from actor a 
join credit c on c.actorid = a.id where c.movieid = 2;

-- list all actors for a movie subselect movie by id & title
select * from actor a 
join credit c on c.actorid = a.id 
where c.movieid = (select id from movie 
where title = 'Inception');

-- list all movies and associated actors - 3 table join
select * from movie m 
join credit c on c.movieid = m.id
join actor a on c.actorid = a.id;


Select title 'Film', concat(firstname, " ",lastname) 'Actor', role 'Role', year 'Year'
from credit c
join movie m
on m.id = movieID
join actor a
on a.id = actorID
;

-- another way to join
select * from actor, credit c
where actor.id = c.actorID;

select * from movie, credit c
where movie.id = c.movieID;


select * from movie;
-- unique constraint violation

insert into movie (title, year, rating, director)
 values ('Inception', 2010, 4, 'Christopher Nolan');
 
 -- foreign key violation
 insert into credit (movieid, actorid, role) values (99, 99, 'test');
 


