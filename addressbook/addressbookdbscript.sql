#UC1 creating databse addressbookservice
show databases;
create database addressbookservice;
show databases;
use addressbookservice;
select database();

#UC2 creating table AddressBook and assigning attributes
create table AddressBook
(
first_Name varchar(50) not null,
last_Name varchar(50) not null,
address varchar(150) not null,
city varchar(50) not null,
state varchar(60) not null,
zip int not null,
phoneNumber long not null,
email varchar(50) not null
);
describe AddressBook;

#UC3 Inserting new contacts to addressbook
insert into AddressBook( first_Name, last_Name, address, city, state,zip, phoneNumber,email ) values
('Shivam',	'Mishra', 	'gate no 1',	'Pune',	'Maharastra',	411039,	8830466378,	'shivammishra7789@gmail.com'),
('Bunty',	'Pandey',	'Mumbai',	'Mumbai',	'Maharastra',	411001,	8974561234,	'bunty@gmail.com'),
('Charan',	'Tiwari',	'Delhi',	'Delhi',	'Delhi',	110001,	7894562541,	'charan@gmail.com'),
('Durga',	'Shukla',	'gate no 2',	'Pune',	'Maharastra',	411025,	9568741253,	'durga@gmail.com'),
('Abhi',	'Ojha',	'Delhi',	'Delhi',	'Delhi',	110015,	8745896582,	'abhi@gmail.com'),
('Dibyesh' , 'mishra' , 'ballia' , 'sikandarpur' ,'uttarpradesh' , 234562 , 8577858332 ,'dibyesh@gmail.com');
select * from addressbook;

#UC4 Ability to edit existing contact person using name
update addressbook set address='Ville Parle' where first_name='Bunty'; 
select * from addressbook;

#UC5 Delete contact using persons name
delete from addressbook where first_name='Charan'; 
select * from addressbook;

#UC6 Retrieve person belonging to city or state
select * from addressbook where city='pune' or state='Maharastra';

#UC7 get size of addressbook by city and state
select city,count(city) from addressbook group by city;
select state,count(state) from addressbook group by state;

#UC8 sort names alphabitically for given city
select * from addressbook where city='pune' order by first_name;

#UC9 ability to identify each addressbook with name and type
alter table addressbook add name varchar(50) after last_name;
alter table addressbook add relation varchar(50) after name;
select * from addressbook;
update addressbook set name='Shiv' where first_name='shivam';
update addressbook set relation='Family' where first_name='shivam'; 
update addressbook set relation='Family' where first_name='bunty'; 
update addressbook set relation='Family' where first_name='durga'; 
update addressbook set relation='Professional' where first_name='abhi'; 
update addressbook set relation='Friend' where first_name='dibyesh';
update addressbook set relation='Professional' where first_name='durga';
select * from addressbook;

#UC10 getting number of contact count by type
select relation, count(relation) from addressbook group by relation; 

#UC11 ability to add contact to both friend and family
insert into addressbook (first_name,last_name,relation,address,city,state,zip,phoneNumber,email) value
						('Manali','Wani','Friend' and 'Family','hadapsar','Pune','Maharastra',411025,8974589621,'manali@gmail.com');

 









