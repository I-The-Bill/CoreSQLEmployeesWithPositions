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
	primary key (EmpId),
    foreign key (EmpId) References EmployeeInfo(EmpId)
);


