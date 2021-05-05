create database hotel;
use hotel;
create table invoice
(
net_amount int,
vat int,
tax int,
total int,
Date1 date,
invoiceID int not null auto_increment,
PID int,
GID int, 
primary key(invoiceID)
);
desc invoice;
create table gust(
GID int not null,
NIC int(15),
gender char ,
GustName char(12),
country char(15),
address varchar(20),
primary key(GID)

);
insert into gust(GID,NIC,gender,GustName,country,address)
values(1,123456,'M','saad','Pakistan','lahore');
select *from gust;
alter table invoice add foreign key(GID) references gust(GID) ;
CREATE TABLE reservation (
  ReID int(11) NOT NULL AUTO_INCREMENT,
  Rtype char(20) ,
  noOfnights int(11) ,
  RegDate date ,
  NOOFrooms int(11) ,
  RID int ,
  PRIMARY KEY (ReID),
   CHECK (Rtype in ('Online','Offline')),
   foreign key(RID) references room(RID)
) ;
INSERT INTO reservation (ReID,Rtype,noOfnights,RegDate,NOOFrooms,RID)
VALUES(1,'online',2,'2021-6-4',1,2);
select * from reservation;
create table payment(
PID int,
PaymentDATE DATE,
paymenttype char(20),
totalamuout int,
net_amount int
);

create table room(
RID int not null auto_increment,
Roomstatus bool, /*0 means free and  1 mean reserve*/
charge int,
roomtype char(20),
primary key(RID)
);
 
insert into room(RID,Roomstatus,charge,roomtype)
values(3,1,200,'1st class');
desc room;
select * from room;
create table payment
(
PID int ,
paymentDATE DATE,
paymenttype char(11),
total_amount int,
net_amount int,
primary key(PID)
);
alter table invoice add foreign key(PID) references payment(PID) ;
insert into payment(PID,paymentDATE,paymenttype,total_amount,net_amount)
values(1,'2021-6-4','online',200,150);
insert into payment(PID,paymentDATE,paymenttype,total_amount,net_amount)
values(2,'2021-6-4','online',220,160);

alter table payment change paymenttype  creditcard char (11);
select * from payment;
delete from payment where PID=1;
select * from payment;
