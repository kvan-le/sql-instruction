-- create and select the database
drop database if exists prs;
create database prs;
use prs;

create table User (
id				int primary key auto_increment,
username		varchar(20)	not null unique,
password		varchar(10)	not null,
firstname		varchar(20) not null,
lastname		varchar(20) not null,
phonenumber		varchar(12) not null,
email			varchar(75) not null unique,
isreviewer		tinyint(1),
isadmin			tinyint(1),

constraint uname unique (username)

);

create table Vendor (
id			int primary key auto_increment,
code		varchar(10)	not null unique,
name		varchar(255) not null,
address		varchar(255) not null,
city		varchar(255) not null,
state		varchar(2) not null,
zip			varchar(5) not null,
phonenumber		varchar(12) not null,
email			varchar(100) not null,

constraint vcode unique (code)
);



create table Request (
id				int primary key auto_increment,
userid			int not null,
description		varchar(100) not null,
justification	varchar(255) not null,
dateneeded		date not null,
deliverymode	varchar(25) not null,
status			varchar(20) not null,
total			decimal(10,2) not null,
submitteddate		datetime not null,
reasonforrejection	varchar(100),

foreign key (userid) references user(id)


);

create table Product (
id			int primary key auto_increment,
vendorid	int not null,
partnumber	varchar(50) not null,
name		varchar(150) not null,
price		decimal(10,2) not null,
unit			varchar(255), 
photopath		varchar(255),

foreign key (vendorid) references vendor(id),
constraint vendor_part unique (vendorid, partnumber)
);


create table LineItem (
id			int primary key auto_increment,
requestid	int not null,
productid 	int not null,
quantity	int not null,

foreign key (requestid) references request(id),
foreign key (productid) references product(id),

constraint req_pdt unique (requestid, productid)
);


