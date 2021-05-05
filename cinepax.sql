drop database if EXISTS Cinepax;
create database Cinepax;
use Cinepax;

create table if not exists Movie(
MovieID int primary key,
MName varchar(50),
Realease_Date date,
Play_time int
);

insert into movie values (1,'Fast and Furious 8','2017-04-13',136);
insert into movie values (2,'Logan','2017-03-07',137);
insert into movie values (3,'Terminator Genisys','2015-07-01',126);
insert into movie values (4,'Captain America: Civil War','2017-06-06',147);
insert into movie values (5,'Batman v Superman: Dawn of Justice','2016-03-25',151);
insert into movie values (6,'The Hitman Bodyguard','2017-08-18',125);
insert into movie values (7,'Hotel Transylvania 2','2015-09-25',89);
insert into movie values (8,'The Dark Tower','2017-08-04',95);
insert into movie values (9,'Atomic Blonde','2017-07-28',115);
insert into movie values (10,'Spider-Man: Homecoming','2017-07-07',133);

create table if not exists MType(
TypeID int primary key auto_increment,
TName varchar(2)
);
insert into MType(Tname) values('2D');
insert into MType(Tname) values('3D');
insert into MType(Tname) values('3D');


create table if not exists Movie_Type(
TypeID int,
MovieID int,
primary key(TypeID,MovieID),
foreign key(TypeID) references MType(TypeID),
foreign key(MovieID) references Movie(MovieID)
);

insert into Movie_Type values(1,1);
insert into Movie_Type values(2,1);
insert into Movie_Type values(1,2);
insert into Movie_Type values(1,3);
insert into Movie_Type values(2,3);
insert into Movie_Type values(1,4);
insert into Movie_Type values(2,4);
insert into Movie_Type values(1,5);
insert into Movie_Type values(2,5);
insert into Movie_Type values(1,6);
insert into Movie_Type values(1,7);
insert into Movie_Type values(2,7);
insert into Movie_Type values(1,8);
insert into Movie_Type values(1,9);
insert into Movie_Type values(2,10);

create table if not exists Category(
CatID int primary key auto_increment,
CatName varchar(25)
);

insert into Category(CatName) values ('Action');
insert into Category(CatName) values ('Adventure');
insert into Category(CatName) values ('Animation');
insert into Category(CatName) values ('Crime');
insert into Category(CatName) values ('Drama');
insert into Category(CatName) values ('Sci-Fi');
insert into Category(CatName) values ('Thriller');
insert into Category(CatName) values ('Comedy');
insert into Category(CatName) values ('Mystery');
insert into Category(CatName) values ('Horror');


create table if not exists Movie_Category(
MovieID int,
CatID int,
foreign key(MovieID) references Movie(MovieID),
foreign key(CatID) references Category(CatID)
);

insert into Movie_Category values (1,1);
insert into Movie_Category values (1,2);
insert into Movie_Category values (1,4);
insert into Movie_Category values (2,1);
insert into Movie_Category values (2,5);
insert into Movie_Category values (2,6);
insert into Movie_Category values (3,1);
insert into Movie_Category values (3,6);
insert into Movie_Category values (4,1);
insert into Movie_Category values (4,6);
insert into Movie_Category values (5,1);
insert into Movie_Category values (5,6);
insert into Movie_Category values (5,7);
insert into Movie_Category values (6,1);
insert into Movie_Category values (6,8);
insert into Movie_Category values (7,3);
insert into Movie_Category values (7,8);
insert into Movie_Category values (7,2);
insert into Movie_Category values (8,1);
insert into Movie_Category values (8,2);
insert into Movie_Category values (8,10);
insert into Movie_Category values (9,1);
insert into Movie_Category values (9,7);
insert into Movie_Category values (9,9);
insert into Movie_Category values (10,1);
insert into Movie_Category values (10,4);
insert into Movie_Category values (10,6);



create table if not exists Screen(
ScreenID int primary key,
ScreenName varchar(25)
);

insert into Screen values (1,'Silver');
insert into Screen values (2,'Gold');
insert into Screen values (3,'Platinum');
insert into Screen values (4,'Platinum Plus');

create table if not exists SType(
TypeID int primary key auto_increment,
TName varchar(2)
);
insert into SType(TName) values('2D');
insert into SType(TName) values('3D');

create table if not exists Screen_Type(
ScreenID int,
TypeID int,
primary key(ScreenID,TypeID),
foreign key(ScreenID) references Screen(ScreenID),
foreign key(TypeID) references SType(TypeID)
);

insert into Screen_Type values (1,1);
insert into Screen_Type values (2,1);
insert into Screen_Type values (2,2);
insert into Screen_Type values (3,1);
insert into Screen_Type values (3,2);
insert into Screen_Type values (4,2);



create table if not exists Screen_Movie(
Screen_Movie_ID int primary key auto_increment,
Screening_Date date,
Shift varchar(25),
MovieID int,
ScreenID int,
foreign key(MovieID) references Movie(MovieID),
foreign key(ScreenID) references Screen(ScreenID)
);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','After Noon',1,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Morning',1,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Evening',1,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','After Noon',1,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Morning',1,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Evening',1,4);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','After Noon',2,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Morning',2,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Evening',2,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','After Noon',2,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Evening',2,3);


insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','After Noon',3,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Evening',3,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','After Noon',3,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Morning',3,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Evening',3,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','After Noon',3,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Morning',3,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Evening',3,4);


insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','After Noon',4,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Morning',4,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-24','Evening',4,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','After Noon',4,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Morning',4,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-25','Evening',4,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','After Noon',4,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Morning',4,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Evening',4,3);


insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','After Noon',5,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Evening',5,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','After Noon',5,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Morning',5,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Evening',5,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','After Noon',5,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Morning',5,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Evening',5,4);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','After Noon',6,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-26','Evening',6,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','After Noon',6,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Morning',6,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Evening',6,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','After Noon',6,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Morning',6,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Evening',6,2);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','After Noon',7,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Evening',7,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','After Noon',7,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Morning',7,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Evening',7,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','After Noon',7,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Morning',7,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Evening',7,3);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','After Noon',8,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-27','Evening',8,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','After Noon',8,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Morning',8,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-28','Evening',8,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','After Noon',8,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Morning',8,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Evening',8,2);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','After Noon',9,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Evening',9,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','After Noon',9,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','Morning',9,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','Evening',9,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','After Noon',9,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','Morning',9,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','Evening',9,1);

insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','After Noon',10,1);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-29','Evening',10,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','After Noon',10,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','Morning',10,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-30','Evening',10,4);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','After Noon',10,3);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','Morning',10,2);
insert into Screen_Movie(Screening_Date,Shift,MovieID,ScreenID) values ('2017-08-31','Evening',10,4);


create table if not exists Customer(
CID int primary key,
CName varchar(25),
CAddress varchar(50)
);

insert into Customer values (1,'Ali','DHA');
insert into Customer values (2,'Ahmad','Johar Town');
insert into Customer values (3,'Amna','Bahria Town');
insert into Customer values (4,'Iqra','Muslim Town');
insert into Customer values (5,'Shahzaib','Mughalpura');
insert into Customer values (6,'Suleman','Faisal Town');
insert into Customer values (7,'Jahangir','Gulshan Ravi');
insert into Customer values (8,'Sadaf','DHA');
insert into Customer values (9,'Awais','Bahria Town');
insert into Customer values (10,'Samia','Faisal Town');

create table if not exists Staff(
SID int primary key,
SName varchar(25),
SDesignation varchar(25),
SAddress varchar(25)
);

insert into Staff values (1,'Shahroz','Admin','DHA');
insert into Staff values (2,'Iqbal','Ticket Issuer','Johar Town');
insert into Staff values (3,'Nasir','Ticket Issuer','Mughalpura');
insert into Staff values (4,'Awais','Admin','Bahria Town');
insert into Staff values (5,'Saqib','Ticket Issuer','Gulshan Ravi');
insert into Staff values (6,'Ali','Ticket Issuer','Johar Town');
insert into Staff values (7,'Waqar','Admin','Faisal Town');
insert into Staff values (8,'Jamshed','Ticket Issuer','Johar Town');
insert into Staff values (9,'Saqlain','Admin','Mughalpura');
insert into Staff values (10,'Sajjad','Ticket Issuer','Gulshan Ravi');


create table if not exists Booking(
BID int primary key auto_increment,
No_of_Seats int,
Staff_Booking_Date date,
Screen_Movie_ID int,
foreign key(Screen_Movie_ID) references Screen_Movie(Screen_Movie_ID),
SID int,
CID int,
foreign key(SID) references Staff(SID),
foreign key(CID) references Customer(CID)
);


insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-22',21,1,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-22',7,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-22',1,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-22',4,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',8,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-22',7,1,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-22',1,2,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(8,'2017-08-22',21,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-22',12,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',3,10,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-22',10,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-22',12,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(8,'2017-08-22',1,6,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-22',7,7,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',3,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-22',12,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',2,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-22',13,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-22',4,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(8,'2017-08-22',8,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-22',15,8,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',3,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-22',7,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-22',13,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-22',9,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-22',2,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-22',11,2,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-22',9,6,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-22',14,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-22',16,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-23',4,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',10,5,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',7,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-23',13,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',8,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-23',11,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',6,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-23',2,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',2,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-23',11,6,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-23',5,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-23',12,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',9,9,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-23',22,8,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',11,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-23',4,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',20,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-23',15,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-23',12,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-23',4,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',21,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-23',7,8,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',2,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-23',13,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',6,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',2,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',11,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',9,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',22,3,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',1,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-24',4,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',8,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',2,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',10,9,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',3,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',11,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-23',4,2,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',20,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-23',15,1,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-23',12,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-23',8,7,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',21,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-23',7,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-23',22,3,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-23',13,8,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',6,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',2,9,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',11,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-23',9,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-23',14,9,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',1,1,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-24',4,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',8,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',2,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',10,7,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',3,3,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',12,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',25,6,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',1,9,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-24',5,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',11,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-24',13,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',20,1,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-24',5,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',22,7,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-24',6,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',8,6,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-24',7,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',2,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',4,4,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-24',10,3,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',2,8,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',20,2,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',1,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',3,5,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-24',16,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',22,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',1,1,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',17,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-24',9,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',14,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',5,8,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',20,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',3,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',20,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',1,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',23,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-24',16,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',18,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-24',1,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',21,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-24',9,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',14,1,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',5,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',20,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',3,8,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',20,8,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',24,7,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-24',5,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-24',26,2,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-24',26,3,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-24',20,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',16,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',6,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',26,8,3); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',26,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',17,1,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',16,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',6,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',16,5,1); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',10,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',17,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',16,2,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',17,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',5,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',23,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',14,9,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',18,9,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',23,9,2); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',23,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',15,9,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',24,8,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',25,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',16,1,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',24,9,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',6,8,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',4,2,7); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',15,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',16,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',17,9,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',14,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',25,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',42,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',10,6,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,5,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',15,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',24,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',18,1,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',14,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',6,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',4,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',16,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',15,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',16,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',5,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',16,3,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',6,9,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',16,1,6); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,10,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',10,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',17,5,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',16,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',17,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',5,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',23,2,4);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',14,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',18,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',41,10,10); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',23,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',15,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',23,3,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',24,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',16,10,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',24,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-25',6,4,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,1,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',4,8,5); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',15,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',16,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',17,10,1);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',14,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',41,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',23,7,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-25',10,7,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,7,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',15,3,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',4,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',18,7,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',14,8,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',6,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',4,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',16,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',37,5,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,7,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-25',16,5,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-25',5,1,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',40,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',37,5,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',24,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',23,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',38,9,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',5,4,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-25',6,3,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-25',4,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-25',25,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-25',28,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-25',4,5,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',17,1,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',26,5,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',30,7,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',26,5,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-26',27,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',28,5,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',26,4,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',29,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',28,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-26',31,5,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',30,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-26',18,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',38,1,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-26',40,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',35,5,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',38,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',18,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',35,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',32,9,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-26',29,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',37,7,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-26',17,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',27,3,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',28,5,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',35,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-26',29,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',30,5,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-26',26,1,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',29,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',37,5,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',34,5,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',29,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-26',33,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',31,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-26',18,5,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-26',27,5,7);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-26',32,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',29,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',39,7,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',17,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',18,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-26',28,5,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-26',36,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-26',28,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-26',30,2,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',38,6,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',27,8,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',17,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',33,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',53,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-27',54,7,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',53,9,2); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',39,9,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',54,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',36,6,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',32,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-27',39,9,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-26',31,1,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-26',53,3,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-26',34,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-27',39,4,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',53,8,2); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',53,8,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',35,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',54,8,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',54,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-27',53,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',54,7,7); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',33,9,5); 
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',39,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',32,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',40,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',41,1,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-27',42,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-27',39,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-27',44,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',70,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',45,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',33,7,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-27',36,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',31,5,8);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-27',43,3,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-27',46,8,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',34,2,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',45,6,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-27',32,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',46,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',55,4,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',56,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',54,7,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-27',55,3,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',57,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',55,3,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',54,3,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(8,'2017-08-27',57,3,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',55,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',57,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',57,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',56,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',41,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',40,3,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',33,3,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-27',45,5,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-27',46,4,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-27',73,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',70,9,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(8,'2017-08-27',46,1,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-27',45,2,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',40,6,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-27',31,8,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-27',33,3,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-28',43,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',55,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',57,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',56,5,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-28',43,3,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',56,3,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',47,3,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',56,3,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',43,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',42,6,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',36,1,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-28',34,3,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',44,4,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',35,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',47,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',48,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',49,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',50,4,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',48,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',71,3,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',49,2,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',50,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',49,3,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',61,5,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',44,3,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',34,1,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',36,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',42,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',47,3,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-28',71,7,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',34,3,10);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',48,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-28',35,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',42,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',48,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',43,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',62,1,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',70,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',49,5,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',42,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',61,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-28',58,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-28',59,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',60,1,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',58,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',58,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',52,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',51,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',50,9,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',58,8,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',52,9,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-28',60,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-28',58,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-28',58,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',52,10,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',51,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',50,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',58,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',52,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',58,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',50,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',58,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',63,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',61,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',62,10,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',63,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',50,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',63,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',50,7,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',61,9,3);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',62,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',62,5,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',69,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',50,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',51,7,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',52,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',58,1,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',61,4,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',58,2,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',63,2,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',69,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-29',50,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',69,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-29',70,7,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-29',69,2,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',52,3,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',50,5,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',59,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',60,8,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',63,2,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',52,9,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-29',52,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',51,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',62,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',51,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',61,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',50,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',52,10,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-29',59,7,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-29',61,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-29',65,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-29',62,4,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-29',62,2,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(7,'2017-08-29',50,8,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',71,9,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-30',64,10,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-30',72,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-30',71,9,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',63,10,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-30',64,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',63,4,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-30',67,2,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-30',66,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',65,5,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',64,6,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',73,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',64,9,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-30',75,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',73,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',72,4,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',63,10,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',66,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',72,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-30',64,2,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-30',67,1,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',65,9,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',68,9,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',64,8,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',64,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',74,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',71,9,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',72,4,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-30',63,2,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',65,2,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',63,7,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',68,6,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-30',63,3,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',64,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-30',71,2,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-30',74,2,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-30',65,5,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-30',66,2,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',65,1,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-30',63,4,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-30',64,2,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-30',64,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',65,7,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-30',76,3,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-30',71,2,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(2,'2017-08-31',75,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-31',76,3,5);

insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-31',66,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',67,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-31',74,10,10);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-31',68,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-31',66,7,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-31',74,2,7);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-31',66,6,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-31',76,5,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',76,6,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',76,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-31',68,8,2);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-31',75,10,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-31',76,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',76,7,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-31',73,4,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-31',66,10,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',75,3,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',76,1,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',75,3,1);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-31',67,10,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-31',68,10,9);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-31',76,10,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-31',76,5,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(3,'2017-08-31',75,3,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(10,'2017-08-31',67,6,4);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(5,'2017-08-31',76,9,6);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(1,'2017-08-31',68,8,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(4,'2017-08-31',75,1,5);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(6,'2017-08-31',68,6,8);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-31',74,4,3);
insert into Booking(No_of_Seats,Staff_Booking_Date,Screen_Movie_ID,SID,CID) values(9,'2017-08-31',68,3,4);