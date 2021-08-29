CREATE DATABASE ELANS
USE ELANS


CREATE TABLE Color(

Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Model(
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Marka(  
Id int identity primary key,
Name nvarchar(50),
ModelId int foreign key references  Model(Id)
)

CREATE  TABLE Bantype(
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Fueltype( 
Id int identity primary key,
Name nvarchar(50)
)


CREATE TABLE Enginevolume( 
Id int identity primary key,
MaxVolumme int,
MinVolume int

)


CREATE TABLE Carsupply(
Id int identity primary key,
Alloywheels bit,
Centralcloser bit,
Leathersalon bit,
Seatventilation bit,
Abssystem bit,
Parkradar bit,
Xenonlamps bit,
Luke bit,
Conditioners bit,
Rearviewcamera bit,
Rainsessor bit,
Seatheating bit,
Sidecurtains bit
)



CREATE TABLE City (
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE   Contactwitchowner(
Id int identity primary key,
Name nvarchar(50),
Number int ,
Email nvarchar(50),
CityId    int foreign key references  City(Id)
)






CREATE TABLE Pricetype(
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Transmation(
Id int identity primary key,
Name nvarchar(50)
)

CREATE  TABLE Gearbox(
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Years(
Id int identity primary key,
MaxYears int,
MinYears int
)

CREATE TABLE Distancetype(
Id int identity primary key,
Name nvarchar(50)
)

CREATE TABLE Fotos(
Id int identity primary key,
Adress nvarchar(50)
)


CREATE TABLE Elantype(
Id int identity primary key,
Name nvarchar(50)
)



CREATE TABLE Elan(

Id int identity primary key,
 Distance int,

Price int,
Enginepower int,
Credit bit,
Bartter bit,

Information nvarchar(50),

ColorId int foreign key references  Color(Id),
MarkaId int foreign key references Marka(Id),
YearsId int references Years(Id),
PricetypeId int foreign key references Pricetype(Id),

TransmationId int foreign key references Transmation(Id),
GearboxId int foreign key references Gearbox(Id), 
BantypeId int foreign key references Bantype(Id),

FueltypeId int references Fueltype(Id),
EnginevolumeId int foreign key  references Enginevolume(Id),


DistancetypeId int  foreign key references Distancetype(Id),


CarsupplyId int  foreign key references Carsupply(Id),
ContactwithownerId int foreign key references Contactwithowner(Id),
FotosId int  foreign key references Fotos(Id),
ElantypeId  int  foreign key references Elantype(Id)
)