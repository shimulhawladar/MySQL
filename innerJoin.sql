--Create a new database
create database QA;

--Select QA database	
use QA;

--Create Employees Table
CREATE TABLE Employees(
    EmployeesID int,
    LastName varchar(30),
    FirstName varchar(30),
    Salary DOUBLE,
    DepartmentID int default null
);

--Insert Records to Employees Table
insert into Employees values
    (1001,"Smith", "John", 75000.00, 30),
    (1002,"Smith", "Ron", 72000.00, 40),
    (1003,"Smith", "John", 75000.00, Null),
    (1004,"Hough", "Natalie", 82000.00, 30),
    (1005,"Eaton", "lucy", 88000.00, 40);


--Create Departments Table
CREATE TABLE Departments(
    DepartmentID int not null,
    DepartmentName varchar(30),
    LocationID int,
    primary key(DepartmentID)
);

--Insert Records to Departments Table
insert into Departments values
        (30,"Civil",2500),
        (40,"Electric",2501),
        (50,"Computer",2600),
        (60,"HelpDesk",2601);



--Group By Inner Join --> Display departments name with more than 5 employees.
Select d.DepartmentName, COUNT(e.EmployeesID) 	
	from Employees as e
	join Departments as d on d.DepartmentID = e.DepartmentID
	group by DepartmentName having count(EmployeesID) < 5;
	
	
--NON-EQUIJOIN returns non matching records from two or more tables.
Select e.LastName, e.FirstName, d.DepartmentName
	from Employees as e, Departments as d
	where e.DepartmentID != d.DepartmentID
	order by e.LastName;

--Lists the above, but only the employees who’s salary is more than 10K.
select e.LastName, e.FirstName, e.Salary,d.DepartmentName
	 from Employees as e join Departments as D on e.DepartmentID = D.DepartmentID
	 where e.Salary > 10000;
	 
	 
--Find number of employees of each departments, and display as department name & total employees.
select d.DepartmentName, count(e.EmployeesID)
	 from Employees as e join Departments as D on e.DepartmentID = D.DepartmentID
	 group by D.DepartmentID;





