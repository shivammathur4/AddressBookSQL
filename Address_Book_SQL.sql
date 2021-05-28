create database Address_Book_Service;

use Address_Book_Service;


create table Address_Book
(
	First_Name varchar(20),
	Last_Name varchar(20),
	Address varchar(20),
	City varchar(15),
	State varchar(15),
	Zip int,
	Phone_Number varchar(13),
	Email varchar(20)
);

Insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Phone_Number,Email) values
('Abhishek','J','Vijaynagar','Mysore','Karnataka',590016,'8951604950','abhij@gmail.com'),
('Bhavana','Ram','Indiranagar','Belgaum','Mumbai',548965,'9984189632','bhavana@gmail.com'),
('Chandan','Jay','Rajajinagar','Hubli','Madhyapradesh',571258,'7412365895','jay@gmail.com'),
('Darmesh','Reddy','Chordroad','Hyderabad','Andhrapradesh',589647,'7547891235','reddy@yahoo.com')

Select * from Address_Book

update Address_Book set Last_Name='Kunal' where First_Name='Darmesh';

Select * from Address_Book

Delete from Address_Book where First_Name = 'Darmesh';

Select * from Address_Book;

Select COUNT(City) as City_Count from Address_Book ;
Select COUNT(State) as State_Count from Address_Book ;

Select * from Address_Book order by First_Name Asc;



Alter table  Address_Book add AddressBook_Name varchar(20) , Type varchar(20);

Update Address_Book set Type = 'Family' , AddressBook_Name = 'A' where First_Name='Abhishek';
Update Address_Book set Type = 'Friend', AddressBook_Name = 'B' where Last_Name='Ram';
Update Address_Book set Type='Profession' , AddressBook_Name = 'C' where Last_Name='Jay';

select * from Address_Book

Select COUNT(Type) as Family_Members from Address_Book where Type = 'Family' group by Type;

Select Count(Type) as Friend from Address_Book where Type = 'Friend' group by Type;

insert into Address_Book values
('Abhishek','J','Vijaynagar','Mysore','Karnataka',590016,'8951604950','abhij@gmail.com','B','Friend');

--UC12 --> Ability to create Normalization table for Address_Book

/*----------------------CREATE NEW ADDRESS BOOK-------------------------*/
create table New_Address_Book
(
	Id int primary key identity(1,1),
	First_Name varchar(50),
	Last_Name varchar(50),
	Address varchar(50),
	City varchar(50),
	State varchar(50),
	Zip int,
	Phone_Number varchar(50),
	Email varchar(50)
);

Insert into New_Address_Book values
('Prerana','Singh','CollegeRoad','Belgaum','Karnataka',590016,'8792981111','prerana@gmail.com'),
('Rani','Weeber','Srinagar','Hubli','Karnataka',589632,'7412589632','rani@gmail.com'),
('Vicky','Kaushal','Ameerpet','Hyderabad','AndhraPradesh',456987,'8523697412','vivek@gmail.com'),
('Saayesha','Tubaki','Basweshwar Nagar','Bangalore','Karnataka',560079,'6987452315','saayesha@gmail.com')

select * from New_Address_Book

create table Address_Book_Name
(
	Id int,
	Name varchar(30),
	Foreign Key (Id) references New_Address_Book(Id)
);

select * from Address_Book_Name;

create table Address_Book_Type
(
	Id int,
	Type varchar(50),
	Foreign Key (Id) references New_Address_book(Id),
);

Select * from Address_Book_Type

Insert into Address_Book_Type values(1,'Friend'),(2,'Family'),(3,'Profession'),(4,'Friend');



select * from New_Address_Book where city = 'Belgaum';

select * from New_Address_Book where state = 'Andhra Pradesh'

Select Count(state) as State_Count from New_Address_Book where state = 'Karnataka' group by state 

Select Count(city) as City_Count from New_Address_Book where city = 'Bangalore' group by city 

Select * from New_Address_Book order by First_Name

Select Count(Type) , Type
from Address_Book_Name ad_name  , Address_Book_Type ad_type
where ad_name.Id = ad_type.Id
group by Type;


Alter table New_Address_Book 
Add AddedDate DateTime

select * from New_Address_Book

Update New_Address_Book Set AddedDate = '01-01-2019' where Id = 1;
Update New_Address_Book Set AddedDate = '02-12-2019' where Id = 2;
Update New_Address_Book Set AddedDate = '03-09-2018' where Id = 3;
Update New_Address_Book Set AddedDate = '12-04-2020' where Id = 4;

select * from New_Address_Book

update New_Address_Book Set First_Name = 'Surabhi' where Id = 4;

select * from New_Address_Book