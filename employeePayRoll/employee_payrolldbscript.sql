show databases;
#UC1 Ability to create a payroll service database
create database payroll_service;
use payroll_service;
select database();

#UC2 Ability to create a employee payroll table in the payroll service database to manage employee payrolls
create table employee_payroll
(
id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key (id)
);
describe employee_payroll;

#UC3 Ability to create employee payroll data in the payroll service database as part of CRUD Operation
insert into employee_payroll(name, salary, start) values
('Bill',100000,'2010-01-03'),
('Terisa', 200000, '2019-11-13'),
('Charlie', 300000, '2020-05-21');

#UC4 Ability to retrieve all the employee payroll data that is added to payroll service database
select * from employee_payroll;

#UC5 Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database
select name,salary from employee_payroll where name='Bill';
select * from employee_payroll where start between cast('2010-01-01' as date) and date(now());

#UC6 Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add gender char(1) after name;
update employee_payroll set gender='F' where name='Terisa';
update employee_payroll set gender='M' where name='Bill' or name='Charlie';

#UC7 Ability to find sum, average, min, max and number of male and female employees
select avg(salary) from employee_payroll where gender='M' group by gender;
select gender,avg(salary) from employee_payroll group by gender;
select gender,count(name) from employee_payroll group by gender;
select gender,sum(salary) from employee_payroll group by gender;
select gender,min(salary) from employee_payroll group by gender;
select gender,max(salary) from employee_payroll group by gender;

#UC8 Ability to extend employee_payroll data to store employee information like employee phone, address and department
alter table employee_payroll rename column salary to basic_pay;
select * from employee_payroll;
alter table employee_payroll add phone_number bigint after name;
alter table employee_payroll add address varchar(150) default '-----' after phone_number;
alter table employee_payroll add department varchar(50) not null after address;

#UC9 Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
alter table employee_payroll add deductions double default 0 after basic_pay;
alter table employee_payroll add taxable_pay double default 0 after deductions;
alter table employee_payroll add income_tax double default 0 after taxable_pay;
alter table employee_payroll add net_pay double default 0 after income_tax;
select * from employee_payroll;

#UC10 Ability to make Terissa as part of Sales and Marketing Department
update employee_payroll set department='Sales' where name='Terisa';
insert into employee_payroll (name, department, gender, basic_pay, deductions, taxable_pay, income_tax, net_pay, start) values
							 ('Terisa', 'Marketing', 'F', 300000, 100000, 200000, 50000, 150000, '2018-01-03');

#UC11 Implement the ER Diagram into Payroll Service DB
desc employee_payroll;
select * from employee_payroll;
alter table employee_payroll 
drop column department,drop column basic_pay, drop column  deductions,
drop column  taxable_pay,drop column  income_tax,drop column  net_pay, drop column start;
select * from employee_payroll;
select database();
use payroll_service;
describe employee_payroll;
create table department 
(
depart_id int not null auto_increment,
depart_name varchar(60) not null,
 foreign key(depart_id) references employee_payroll(emp_id)
);
describe department;
ALTER TABLE employee_payroll CHANGE id emp_id int;
drop table department;
insert into department(depart_name)values
('Sales'),
('Marketing'),
('Hr');
select * from department;

create table employee_department
(
emp_id int, 
depart_id int,
foreign key(emp_id) references employee_payroll(emp_id)
);
select * from employee_department;
alter table employee_payroll rename employee_details;
select * from employee_details;
delete from employee_details where emp_id=4;

create table employee_payroll
(
emp_id int not null,
basic_pay double
 );
 insert into employee_payroll (emp_id, basic_pay)values
 (1,100000);
 alter table employee_payroll add foreign key (emp_id) references employee_details (emp_id);
alter table employee_payroll add deductions double default 0 after basic_pay;
alter table employee_payroll add taxable_pay double default 0 after deductions;
alter table employee_payroll add tax double default 0 after taxable_pay;
alter table employee_payroll add net_pay double default 0 after tax;
select * from employee_payroll;

create table company
(company_id int not null ,
company_name varchar(150));
insert into company(company_id, company_name) values
(101,'TATA'); 
alter table employee_details add company_id int first;
select * from employee_details;
select * from company;

update employee_details set company_id =101 where emp_id = 1;
update employee_details set company_id =101 where emp_id = 2;
update employee_details set company_id =101 where emp_id = 3;

update employee_details set phone_number =9988556622 where emp_id = 1;
update employee_details set phone_number =9784596521 where emp_id = 2;
update employee_details set phone_number =8899775544 where emp_id = 3;
alter table employee_details add foreign key(company_id) references company(company_id);
alter table employee_department add foreign key(depart_id) references department(depart_id);
alter table department add primary key (depart_id);
describe employee_department ;

