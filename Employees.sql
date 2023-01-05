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

#1
select EmpFname as EmpName from EmployeeInfo;

#2
select count(Department) from EmployeeInfo where department = 'HR';

#3
select current_date();

#4
select SUBSTRING(EmpLname, 1, 4) as L_Name_Abbreveation from EmployeeInfo;

#5
select SUBSTRING_INDEX(Address,'(',1) as City from EmployeeInfo;

#6
CREATE TABLE EmployeeInfoClone SELECT * FROM EmployeeInfo;
Select * from EmployeeInfoClone;

#7
select EmployeeInfo.EmpID, EmpFname, EmpLname, salary from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID where EmployeePosition.Salary >= 50000 and EmployeePosition.Salary <= 100000;

#8
select EmpFname, EmpLname from EmployeeInfo where substring(EmpFname,1,1) = 's';

#9
select * from EmployeeInfo limit 3;

#10
select concat(EmpFname,' ',EmpLname) as 'FullName' from EmployeeInfo;

#11
select * from Employeeinfo where DOB between '1970-02-05' and '1975-12-31' order by gender, DOB;

#12
select * from Employeeinfo order by EmpLname Desc, Department Asc;

#13
select * from Employeeinfo where substring(EmpLname,length(EmpLname),1) = 'a' and length(EmpLname) = 5;

#14
Select * from Employeeinfo where EmpFname != 'Sonia' and  EmpFname != 'Sanjay';

#15
Select * from Employeeinfo where Address = 'Delhi(DEL)';

#16
Select EmployeePosition.EmpId,EmpFname,EmpLname from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID and EmployeePosition.EmpPosition = 'Manager';

#17
Select Department, count(department) as 'Employee Count' from EmployeeInfo group by department;

#18
select * from EmployeeInfo where EmpID%2 = 1; #Odd
select * from EmployeeInfo where EmpID%2 = 0; #Even

#19
Select EmployeePosition.EmpId,EmpFname,EmpLname,Department,Project,Address,DOB,Gender from EmployeeInfo join EmployeePosition on EmployeeInfo.EmpID = EmployeePosition.EmpID  where exists (select DateOfJoining from EmployeePosition) group by EmployeeInfo.EmpId;

#20
(Select Salary from EmployeePosition order by salary  Limit 2) union (Select Salary from EmployeePosition order by salary DESC Limit 2);  

#21
select Max(Salary) from EmployeePosition;

#22
Select * from EmployeeInfo group by EmpFname Having count(*) > 1;

#23
Select * from EmployeeInfo where department = 'Admin';

#24
Select * from EmployeeInfo order by EmpID desc limit 3;

#25
select salary from EmployeePosition order by salary desc limit 3,1;

#26
(select * from EmployeeInfo order by EmpId Asc limit 1) union (select * from EmployeeInfo order by EmpId Desc limit 1);

#27
Alter table EmployeeInfo add Email varchar(70);
SELECT * FROM EmployeeInfo WHERE Email NOT REGEXP '^[^@]+@[^@]+\.[^@]{2,}$';

#28
select Department from EmployeeInfo where department in (select department from  EmployeeInfo group by department having count(*)<2);

#29
select EmpPosition, count(salary) from EmployeePosition group by EmpPosition;

#30
Select * from EmployeeInfo where EmpID < (select count(*) from EmployeeInfo)/2;






