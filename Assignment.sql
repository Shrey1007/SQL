--Q1: Create Tables

create table Departments(
DepartmentId int primary key,
DepartmentName varchar(50) not null unique
)

create table Students(
StudentId int primary key,
Name varchar(50) not null,
Age int check (Age>=17),
DepartmentId int foreign key references Departments(DepartmentId),
)

create table Courses(
CourseId int primary key,
CourseName varchar(50) not null,
DepartmentId int foreign key references Departments(DepartmentId)
)
--Q2: Insert Data
--Insert data to students table

insert into Students
select 1,'Arun',17,1 union all
select 2,'Akash',18,2 union all
select 3,'Sachin',20,3 union all
select 4,'Varun',21,4 union all
select 5,'Kohli',23,5 union all
select 6,'Harish',22,1 union all
select 7,'Tharun',19,2 union all
select 8,'Mohith',20,3 union all
select 9,'Jhon',23,4 union all
select 10,'Pavan',21,5

--Insert data to Departments table

insert into Departments
select 1,'Computer Science' union all
select 2,'Mechanical' union all
select 3,'Electrical' union all
select 4,'Civil' union all
select 5,'Electronics'

--Insert data to Courses table

insert into Courses
select 1,'DBMS',1 union all
select 2,'Thermodynamics',2 union all
select 3,'Circuits',3 union all
select 4,'Structures',4 union all
select 5,'Embedded Systems',5 union all
select 6,'Java',1 union all
select 7,'Actuators',2 union all
select 8,'Transformer',3 union all
select 9,'Design Development',4 union all
select 10,'VLSI',5

--Q3 Apply WHERE & Operators

--Display all students whose age is greater than 20.

select * from Students where Age>20

--Display all courses of the "Computer Science" department.

select * from Courses AS Crs,Departments AS Dep
where Crs.DepartmentId=Dep.DepartmentId AND Dep.DepartmentName='Computer Science'

--Display all students who belong to the "Electronics" department.

select * from Students AS Stud,Departments AS Dep
where Stud.DepartmentId=Dep.DepartmentId AND Dep.DepartmentName='Electronics'

--Display students whose age is between 18 and 22.

select * from Students AS Stud
where Age between 18 AND 22

--Q4: Joins
--INNER JOIN Students with Departments (to show student names with their department names).

select Stud.*,Dep.DepartmentName from Students AS Stud 
inner join Departments AS Dep on Stud.DepartmentId=Dep.DepartmentId

--LEFT JOIN Courses with Departments (to show all courses, even if some department does not exist)

select Crs.*,Dep.DepartmentName from Courses AS Crs 
left join Departments AS Dep on Crs.DepartmentId=Dep.DepartmentId

--RIGHT JOIN Students with Courses (to show all courses, even if no student has enrolled in them).

select Stud.*,Crs.CourseName from Students AS Stud 
right join Courses AS Crs on Crs.CourseId=Stud.DepartmentId