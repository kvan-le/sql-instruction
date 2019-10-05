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
 
 -- foreign key violation
 insert into credit (movieid, actorid, role) values (99, 99, 'test');
 
 -- all emma born after 1960 V this is when you have multiple where clauses
select * from actor a
where firstname = 'Emma' and birthdate > '1960-01-01';

-- youngest actor
select * from actor a order by birthdate desc limit 1;


-- oldest actor
select * from actor a
where a.birthdate = (select min(birthdate) from actor);

-- movies with 5 rating and the corresponding actors in those movies
select m.title, m.rating, a.firstname, a.lastname
from credit c
join movie m
on c.movieid = m.id
join actor a
on a.id = c.actorid

where m.rating = (select max(rating) from movie);


-- all actors born before 1960 or after 1980

select * from actor 
where birthdate < '1960-01-01' 
or birthdate > '1980-01-01';

-- and or , first name has to begin with letter R and lastname is gosling
select * from actor
where firstname = 'R%'
and (lastname = 'Fiennes'
or lastname = 'Gosling'); 

/* all movies genres actors and characters
 the separator callout and giving it name after to define space, then join them to show */
 
 
 -- select single actor from actor list with first name
select * from actor
where firstname = 'Leonardo';


-- list all actors from one movie
select * from credit c
where movieID = 3;

-- list a specific actor, their name, role, and year of movie
select m.title, m.year, a.firstname, c.role
from movie m
join credit c
on c.movieid = m.id
join actor a 
on a.id = c.actorid
where a.id = 3
;


-- list all movies and associated actors
select m.title, a.firstname 
from credit c
join movie m
on c.movieid = m.id
join actor a 
on a.id = c.actorid;

-- list actors and their roles with film title with first name ascending
select a.firstname, a.lastname, m.title, c.role 
from actor a, credit c, movie m
where a.id = c.actorid and m.id = c.movieid
order by firstname asc ;

-- select movie
select * from movie where movie.title = "Inception";


-- select movie title with genre without join
select m.title, g.name
from movie m, genre g, moviegenre mg
where mg.movieid = m.id
and g.id = mg.genreid;

-- all movies with genres, actors, and role                                                                     
select m.title, g.name, c.role, m.year, a.firstname
from moviegenre mg
join movie m 
on m.id = mg.movieid
join genre g
on g.id = mg.genreid
join credit c on c.movieid = m.id 
join actor a on a.id = c.actorid;


-- movies with genres ordered by newest movie released
select m.title, g.name, m.year
from moviegenre mg
join movie m 
on m.id = mg.movieid
join genre g
on g.id = mg.genreid
order by m.year desc
;

--  list everything with all joins
select *
	from movie m
    join movieGenre mg on mg.movieID = m.ID
    join genre g on g.ID = mg.genreID
    join credit c on c.movieID = m.ID
    join actor a on a.ID = c.actorID    
;
    
-- same thing order by rating
select m.title, g.name, m.rating
from movie m
    join movieGenre mg on mg.movieID = m.ID
    join genre g on g.ID = mg.genreID
    join credit c on c.movieID = m.ID
    join actor a on a.ID = c.actorID
    order by m.rating
    ;
    
    
-- rated 4 movies
select * from movie m
where m.rating = '4';

-- count movies with year 2010
select count(*), m.title
 from movie m
where m.year = '2010'
group by m.title
;
    
-- count movies with a certain genre
select count(*), g.name
 from  moviegenre mg
 join genre g
 on g.id = mg.genreid
group by g.name
;

-- show all movies including those without roles or genres
select m.title, c.role, g.name 'genre'
from movie m
left join credit c
on m.id = c.movieid
left join moviegenre mg
on m.id = mg.movieid
left join genre g on g.id = mg.genreid
;
















