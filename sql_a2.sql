create database a2;
use a2;
create table books
(
book_id varchar(100) not null unique ,
Title char(100),
publisher_name char(100),
primary key(book_id)
);
desc books;
create table Book_Author
(
book_id varchar(100) ,
Author_Nme char(100),
foreign key(book_id) references books(book_id)  on delete cascade on update cascade  

);
desc Book_Author;
create table Publisher
(
PublisherName char(100) not null unique,
Address varchar(100),
Phone int (50),
primary key(PublisherName)
);
desc Publisher;
alter table books add foreign key(publisher_name) references Publisher(PublisherName);

create table Book_Copies
(
book_id varchar(100),
Brach_id varchar(100),
no_of_copys  int (100),
foreign key(book_id) references books(book_id)
);
desc Book_Copies;
alter table Book_Copies change Brach_id Branch_id varchar(100);
create table Book_Loan
(
book_id varchar(100) ,
branch_id varchar(100),
Card_no int (50),
Date_out date,
Due_Date date,
foreign key (book_id) references books(book_id)
);
desc Book_Loan;

create table Library_Branch
(
branch_id varchar(100) not null unique,
branch_name char(100),
Address varchar(100),
primary key(branch_id) 
);
alter table Book_Copies add foreign key(branch_id) references Library_branch(branch_id) on delete restrict;
alter table Book_Loan add foreign key(branch_id) references Library_branch(branch_id) on delete restrict;
desc Library_Branch;
create table Borrower
(
Card_no int(50) not null unique,
Borrower_name char(100),
Address varchar(100),
phone bigint (50),
primary key(Card_no)
);
alter table Book_Loan add foreign key(Card_no) references Borrower(Card_no) on delete restrict;
desc Borrower;
alter table Publisher change phone phone bigint(100);
insert into Publisher(PublisherName,Address,Phone)
values('Picador',' 175 5th Ave, New York, NY 10010, United States', 01483869839),('Penguin Books','1745 Broadway, New York, NY 10019, United States',8667616685),('Riverhead Books','New York City',' 8667616685'),('Allen & Unwin','406 Albert Street, East Melbourne', 014838697651),('HarperCollins','195 Broadway New York City, USA, ', 18002427737);

insert into Publisher(PublisherName,Address,Phone)
values('HarperCollins','195 Broadway New York City, USA, ', 18002427737);
select * from Borrower;
insert into books(book_id,Title,publisher_name )
values('boo1001','The Kite Runner','Riverhead Books'),('boo1002','the alchemist','HarperCollins'),('boo1003','the book thief ','Picador'),('boo1004','forty rules of love','Penguin Books'),('boo1005','Frankenstein','Allen & Unwin');
update Publisher
set Phone=8667616685
where PublisherName='Penguin Books';
insert into  Book_Author(book_id ,Author_Nme )
values('boo1001','Khaled Hosseini'),('boo1002','Paulo Coelho'),('boo1003','Markus Zusak'),('boo1004','Elif Shafak'),('boo1005','Mary Shelley');
insert into Library_Branch(branch_id,branch_name,Address)
values('br1001','branch1','c block iqbal town lahore'),('br1002','branch2','Empress Market karachi'),('br1003','branch3','Lyallpur Town faisalabad'),('br1004','branch4','Lower Topa murree'),('br1005','branch5','Miranjani abbottabad');

insert into  Book_Copies(book_id,Branch_id,no_of_copys)
values('boo1001','br1001',8),('boo1001','br1002',10),('boo1002','br1002',20),('boo1004','br1003',50),('boo1003','br1004',18),('boo1004','br1004',28),('boo1005','br1001',35),('boo1005','br1001',8);
insert into Borrower(Card_no,Borrower_name,Address,phone)
values(181,'saad','main colony lahore',03210000000),(312,'ali','iqbal town   lahore',03210000002),(182,'bilal','nishter colony lahore',03210000003),(721,'irfan','Lyallpur Town faisalabad',03210000004),(191,'imran','Empress Market karachi',03210000005);

select e.Branch_id,s.Branch_id, Branch_name  from Book_Copies as e, Library_Branch as s 
where no_of_copys <10 and e.Branch_id=s.Branch_id;
 select e.Branch_id,s.Branch_id, Branch_name  from Book_Copies as e, Library_Branch as s 
where ;
