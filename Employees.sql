drop database if exists employee_practice;
create database if not exists employee_practice;
use employee_practice;

create table if not exists EmployeeInfo(
	EmpId int auto_increment,
    EmpFname varchar(50),
    EmpLname varchar(50),
    Department varchar(50),
    Project varchar(50),
    Address varchar(50),
    DOB date,
    Gender char,
    primary key (EmpId)
    #foreign key (EmpId) References EmployeePosition(EmpId)
);

create table if not exists EmployeePosition(
	EmpID int auto_increment,
	EmpPosition varchar(25),
	DateOfJoining date,
	Salary double,
    foreign key (EmpId) References EmployeeInfo(EmpId)
);

insert into EmployeeInfo(EmpFname, EmpLname, Department, Project, Address, DOB, Gender) 
	value ('Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-01-12','M');
insert into EmployeeInfo(EmpFname, EmpLname, Department, Project, Address, DOB, Gender) 
	value ('Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-02-05','F');
insert into EmployeeInfo(EmpFname, EmpLname, Department, Project, Address, DOB, Gender) 
	value ('Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M');
insert into EmployeeInfo(EmpFname, EmpLname, Department, Project, Address, DOB, Gender) 
	value ('Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992-02-05','F');
insert into EmployeeInfo(EmpFname, EmpLname, Department, Project, Address, DOB, Gender) 
	value ('Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994-03-07','M');
    
Select * from EmployeeInfo;

insert into EmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)
	value (1,'Manager','2022-01-05',500000);
insert into EmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)
	value (2,'Executive','2022-02-05',75000);
insert into EmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)
	value (3,'Manager','2022-01-05',90000);
insert into EmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)
	value (2,'Lead','2022-02-05',85000);
insert into EmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)
	value (1,'Executive','2022-01-05',300000);
    
Select * from EmployeePosition;

#1 . Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use  the ALIAS name as EmpName.
select EmpFname as EmpName from EmployeeInfo;

#2  Write a query to fetch the number of employees working in the department ‘HR’
select count(Department) from EmployeeInfo where department = 'HR';

#3 Write a query to get the current date
select current_date();

#4  Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table
select SUBSTRING(EmpLname, 1, 4) as L_Name_Abbreveation from EmployeeInfo;

#5 Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table
select SUBSTRING_INDEX(Address,'(',1) as City from EmployeeInfo;

#6 Write a query to create a new table that consists of data and structure copied from the other table.
CREATE TABLE EmployeeInfoClone SELECT * FROM EmployeeInfo;
Select * from EmployeeInfoClone;

#7  Write a query to find all the employees whose salary is between 50000 to 100000.
select EmployeeInfo.EmpID, EmpFname, EmpLname, salary from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID where EmployeePosition.Salary >= 50000 and EmployeePosition.Salary <= 100000; # group by EmployeeInfo.EmpID;

#8 Write a query to find the names of employees that begin with ‘S’
select EmpFname, EmpLname from EmployeeInfo where substring(EmpFname,1,1) = 's';

#9  Write a query to fetch top N records.
select * from EmployeeInfo limit 3;

#10  Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space
select concat(EmpFname,' ',EmpLname) as 'FullName' from EmployeeInfo;

#11 Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender.
select * from Employeeinfo where DOB between '1970-02-05' and '1975-12-31' order by gender, DOB;

#12 Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order
select * from Employeeinfo order by EmpLname Desc, Department Asc;

#13 Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select * from Employeeinfo where substring(EmpLname,length(EmpLname),1) = 'a' and length(EmpLname) = 5;

#14  Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
Select * from Employeeinfo where EmpFname != 'Sonia' and  EmpFname != 'Sanjay';

#15 Write a query to fetch details of employees with the address as “DELHI(DEL)”.
Select * from Employeeinfo where Address = 'Delhi(DEL)';

#16 Write a query to fetch all employees who also hold the managerial position.
Select EmployeePosition.EmpId,EmpFname,EmpLname,EmpPosition from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID and EmployeePosition.EmpPosition = 'Manager';

#17 Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order
Select Department, count(department) as 'Employee Count' from EmployeeInfo group by department;

#18 Write a query to calculate the even and odd records from a table.
select * from EmployeeInfo where EmpID%2 = 1; #Odd
select * from EmployeeInfo where EmpID%2 = 0; #Even

#19 Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table
Select EmployeePosition.EmpId,EmpFname,EmpLname,Department,Project,Address,DOB,Gender from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID  where exists (select DateOfJoining from EmployeePosition) group by EmployeeInfo.EmpId;

#20 Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
(Select Salary from EmployeePosition order by salary  Limit 2) union (Select Salary from EmployeePosition order by salary DESC Limit 2);  

#21  Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
select Max(Salary) from EmployeePosition;

#22 Write a query to retrieve duplicate records from a table
Select * from EmployeeInfo group by EmpFname Having count(*) > 1;

#23  Write a query to retrieve the list of employees working in the same department.
Select * from EmployeeInfo where department = 'Admin';

#24  Write a query to retrieve the last 3 records from the EmployeeInfo table.
Select * from EmployeeInfo order by EmpID desc limit 3;

#25  Write a query to find the third-highest salary from the EmpPosition table.
select salary from EmployeePosition order by salary desc limit 3,1;

#26 Write a query to display the first and the last record from the EmployeeInfo table.
(select * from EmployeeInfo order by EmpId Asc limit 1) union (select * from EmployeeInfo order by EmpId Desc limit 1);

#27 . Write a query to add email validation to your database
Alter table EmployeeInfo add Email varchar(70);
SELECT * FROM EmployeeInfo WHERE Email NOT REGEXP '^[^@]+@[^@]+\.[^@]{2,}$';

#28 Write a query to retrieve Departments who have less than 2 employees working in it.
select Department from EmployeeInfo where department in (select department from  EmployeeInfo group by department having count(*)<2);

#29 Write a query to retrieve EmpPostion along with total salaries paid for each of them.
select EmpPosition, sum(salary) from EmployeePosition group by EmpPosition;

#30  Write a query to fetch 50% records from the EmployeeInfo table.
Select * from EmployeeInfo where EmpID < (select count(*) from EmployeeInfo)/2;






