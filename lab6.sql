create database saadlab;
drop database saadlab;
use saadlab;

CREATE TABLE Employees (

Fname char(100) null,
Minit char null,
Lname char(100) null,
Ssn int not null unique,
Bdate date ,
Address char(100) null,
Sex char null,
Salary int null,
Super_ssn int null,
Dno int null,
primary key(Ssn)

);
insert into Employees(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
values('saad','C','akram',12345678,'1999-09-02','lahore','M',1500,5432198,1),('sana','B','arbaab',12345679,'2000-06-24','karachi','F',3000,5432198,2),('ali','C','ans',12345681,'2003-06-24','karachi','M',3000,5432199,3);
select * from Department;
CREATE TABLE Department (

Dname char(100) null,
Dnumber int not null unique,
Mgr_ssn int null,
Mgr_start_date date , 
primary key(Dnumber),
foreign key(Mgr_ssn) references Employees(Ssn)

);
insert into Department(Dname,Dnumber,Mgr_ssn,Mgr_start_date)
values('Headquarters',1,12345678,'1981-06-19'),('Administration',2,12345679  ,'1995-01-01'),('Research',3,12345681,'1995-01-01');
CREATE TABLE Dept_Locations (

Dnumber int null,
Dlocation char(100) null,
foreign key(Dnumber) references Department(Dnumber)  

);
insert into Dept_Locations(Dnumber,Dlocation)
values(1,'Houston'),(2,'Stafford'),(1,'Sugarland');

select * from Projects;

CREATE TABLE Project (

Pname char(100) null,
Pnumber int not null unique,
Plocation char(100) null,
Dnum int null,
foreign key(Dnum) references Department(Dnumber),
primary key(Pnumber)

);
insert into project (Pname,Pnumber,Plocation,Dnum)
values('ProductX',1,'Bellaire',1),('ProductY',2,'Huston',2),('ProductZ',3,'Sugarland',3);
drop table Works_on;
CREATE TABLE Works_on (

Essn int null,
Pno int null,
Hours int null,
/*foreign key(Essn) references Employees(Ssn),*/
foreign key(Pno) references Project(Pnumber)
);
insert into Works_on(Essn,Pno,Hours)
values(12345678,1,3),(1234579,2,8),(1234581,3,10);
select * from Works_on;
CREATE TABLE Dependant (

Essn int null,
Dependant_name char(100) null,
Sex char null,
Bdate date null,
Relationship char(50) null,
foreign key(Essn) references  Employees(Ssn) 
);
insert into Dependant (Essn,Dependant_name,Sex,Bdate,Relationship)
values(12345678,'saad','M','1986-04-05','Son'),(12345679,'sana','F','1986-06-25','Daughter'),(12345681,'ali','M','1986-06-25','spouse');
 

   
select Fname,salary from Employees
where salary>=1000 and Employees.Sex='M';

select Address from Employees
where Employees.salary>=1000 and Employees.salary <=2000;

select Lname from Employees
where Lname like 'A%B';

select Fname from Employees
where Fname like 'A__';

select Pname,Pnumber from Project
where Project.Dnum=1; 

select Dependant_name from Dependant
where Dependant.Bdate !='%2002%' or Dependant.Bdate !='%2003%'or Dependant.Bdate !='%2004%'; 

select Pno from Works_on
where Works_on.Hours>3 and Works_on.Hours<10;
SET SQL_SAFE_UPDATES =  1;

update  Works_on  set  Hours=5 where  Hours=3;
select * from   Works_on;

delete from Dependant where Sex='M';
select * from Dependant;