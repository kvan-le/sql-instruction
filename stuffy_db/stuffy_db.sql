-- Drop and Create the Database, DDL

drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

-- DDL - Create Tables
create table stuffy (
	id 				int 			primary key auto_increment,
	type 			varchar(255)	not null,
	color 		varchar(20) 	not null,
	size 		varchar(2) 	not null,
	limbs 		int
	);
    

    Insert into stuffy (id, type, color, size, limbs) values 
    ('1', 'Bear', 'black', 'l', '4'),
    ('2', 'Totoro', 'gray', 'xl', '4'),
	('3', 'Duck', 'yellow', 'm', '4'),
    ('4', 'Snake', 'green', 'l', null),
    ('5', 'Cat', 'brown', 's', '4'),
    ('6', 'Deer', 'white', 'l', '4'),
    ('7', 'Panda', 'white', 'l', '4'),
    ('8', 'Bunny', 'pink', 'm', '4'),
    ('9', 'Dummy', 'orange', 's', '3')
    ;
    
-- insert a 'dummy' stuffy
-- 