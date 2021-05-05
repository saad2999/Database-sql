show databases;
show tables;
use cinepax;
show tables;
select * from booking;
select * from category;
select * from movie;
select * from movie_type;
select * from mtype;
select * from category;
select * from screen_movie ;



-- Q1
select movie.MName,mtype.TName from movie inner join movie_type inner join mtype where movie.MovieID=movie_type.MovieID and movie_type.TypeID=mtype.TypeID and  movie.MName in (select movie.MName from movie where year(movie.Realease_Date)  >=  '2000' and year (movie.Realease_Date) <='2017');
-- Q2
select movie.MName,customer.CName from movie inner join screen_movie inner join booking inner join customer on movie.MovieID=screen_movie.MovieID and screen_movie.Screen_Movie_ID=booking.Screen_Movie_ID and booking.CID=customer.CID and booking.No_of_Seats>5;
-- Q3
select staff.SName from movie inner join screen_movie inner join booking inner join staff where movie.MovieID=screen_movie.MovieID and screen_movie.Screen_Movie_ID=booking.Screen_Movie_ID and booking.SID=staff.SID and movie.MName='Logan' and staff.SDesignation='Ticket Issuer';
-- Q4
select movie.MName from movie natural join  movie_type natural join mtype where  mtype.TName ='2D' and mtype.TName='3D';
-- Q5
select movie.MName,staff.SName from movie inner join screen_movie inner join booking inner join staff on movie.MovieID=screen_movie.MovieID and screen_movie.Screen_Movie_ID=booking.Screen_Movie_ID and booking.SID=staff.SID and staff.SDesignation='Ticket Issuer' ;
-- Q6
 select movie.MName,category.CatName from movie inner  join movie_category  right outer join category on movie.MovieID=movie_category.MovieID and category.CatID= movie_category.CatID;
--  q7
select  movie.MName,customer.CName from movie inner join  screen_movie inner join booking right outer join customer  on movie.MovieID=screen_movie.MovieID and  screen_movie.Screen_Movie_ID=booking.Screen_Movie_ID and customer.CID=booking.CID;
-- q8

select  movie.MName,count(booking.No_of_Seats) from movie inner join  screen_movie inner join booking  on movie.MovieID=screen_movie.MovieID and  screen_movie.Screen_Movie_ID=booking.Screen_Movie_ID ;
-- q9
select category.CatName, count(movie.MName) as numberOfmovies from movie  inner  join movie_category  right outer join category on movie.MovieID=movie_category.MovieID and category.CatID= movie_category.CatID group by category.CatID;
-- q10
-- select  movie.MName,movie.play_time from movie where movie.play_time >120 and  movie.MovieID in (select MovieID from category or select )

-- q11
select Sname  from staff where staff.SAddress='kharian'  and staff.SID  not in(select booking.SID from booking);
-- q12
select category.CatID from category where category.CatID not in  (select category.CatID from category inner join movie_category on category.CatID= movie_category.CatID  ) ;
-- q13
select  s.MName from movie as a where  a.MovieID in(select movie.MovieID from movie  where movie.MovieID <> a.MovieID and movie.Realease_Date=a.Realease_Date  ) ;


