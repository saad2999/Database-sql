create database glab3;
drop database glab3;
use glab3;
create table Movies(
id int not null unique,
title char(100),
category char(100),
primary key(id)
);
select *from Movies;
insert into Movies(id,title,category)
values(1, 'ASSASSINS CREED: EMBERS', 'Animations'),(2, 'Real Steel(2012)', 'Animations'),(3, 'Alvin and the Chipmunks', 'Animations'),(4,'The Adventures of Tin Tin','Animations'),(5,'Safe (2012)','Action'),(6,'Safehouse (2012)','Action'),(7,'ANGRY BIRD','Comedy'),(8,'Shrek','Comedy'),(9,'Kung fu panda','Comedy'),(10,'Marley and me','Romance');
drop table Movies;
desc Movies;
create table members(
id int not null unique,
firstName char(100), 
LastName char(100),
movies_id int,
primary key(id),
foreign key(movies_id) references Movies(id)
);
desc members;
insert into members(id,firstName,LastName,movies_id)
values (1, 'Adam', 'Smith', 1),(2,' Ravi', 'Kumar', 2),(3, 'Susan', 'Davidson', 3),(4,'Jenny','Adrianna',8),(6,'Lee','Pong',10);

select * from Movies inner join members on Movies.id=members.id ;
select * from Movies right outer join members on Movies.id=members.id ;
select * from Movies left outer join members on Movies.id=members.id ;

-- L1S19BSCS0051 SHAHWAIZ MEHDI
          
          

