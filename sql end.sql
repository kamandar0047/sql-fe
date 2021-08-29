CREATE DATABASE ELAN
USE ELAN
 

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

CREATE TABLE   Contactowner(
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
BantypeId int foreign key references Bantype(Id),
CarsupplyId int  foreign key references Carsupply(Id),
ColorId int foreign key references  Color(Id),
ContactownerId int foreign key references Contactowner(Id),
DistancetypeId int  foreign key references Distancetype(Id),
ElantypeId  int  foreign key references Elantype(Id),
EnginevolumeId int foreign key  references Enginevolume(Id),
FotosId int  foreign key references Fotos(Id),
FueltypeId int references Fueltype(Id),
GearboxId int foreign key references Gearbox(Id), 
MarkaId int foreign key references Marka(Id),
PricetypeId int foreign key references Pricetype(Id),
TransmationId int foreign key references Transmation(Id),
YearsId int references Years(Id)
)


CREATE VIEW get_elandetails 
AS
SELECT  e.Id 'Elan Id',
e.Credit 'Elan Credit', 
e.Bartter 'Elan Barter', 
e.Price 'Elan Price',
e.Information 'Elan Information' ,
e.BantypeId 'Elan BantypeId',
e.CarsupplyId 'Elan CarsupplyId',
e.ColorId 'Elan ColorId',
e.ContactownerId 'Elan ContactownerId  ',
e.Distance 'Elan Distance',
e.DistancetypeId 'Elan DistancetypeId',
e.ElantypeId  'Elan ElantypeId',
e.Enginepower 'Elan EnginepowerId',
e.EnginevolumeId 'Elan EnginevolumeId',
e.FotosId 'Elan FotosId',
e.FueltypeId 'Elan FueltypeId',
e.GearboxId 'Elan GearboxId',
e.MarkaId 'Elan MarkaId',
e.PricetypeId 'Elan PricetypeId',
e.TransmationId 'Elan TransmationId',
e.YearsId 'Elan YearsId'

FROM Elan e
JOIN Bantype b
ON e.BantypeId=b.Id
JOIN Carsupply cs
 ON e.CarsupplyId =cs.Id
JOIN Color c
ON e.ColorId =c.Id
JOIN Contactowner ct
 ON e.ContactownerId= ct.Id
  JOIN Distancetype d
 ON e.DistancetypeId=d.Id
 JOIN Elantype el
 ON e.ElantypeId =el.Id
 JOIN Enginevolume eng
 ON e.EnginevolumeId= eng.Id
 JOIN Fotos f
 ON e.FotosId =f.Id
 JOIN Fueltype fl
 ON fl.Id=e.FueltypeId

 JOIN Gearbox g
ON e.GearboxId =g.Id

JOIN Marka m
ON E.MarkaId= m.Id
 JOIN Model ml
 ON m.ModelId=ml.Id

 JOIN Pricetype p
 ON e.PricetypeId=p.Id
 JOIN Transmation t
 ON e.TransmationId=t.Id
	
	JOIN Years y
	ON e.YearsId =y.Id
 

 SELECT *FROM get_elandetails 
 



 SELECT *FROM Elantype



CREATE PROCEDURE GetElanDetailsWithEnginepoweccr @price int =500 
AS
SELECT * FROM Elan
WHERE Price >=@price
EXEC GetElanDetailsWithPrice @id=2

CREATE PROCEDURE GetCity @Fueltype nvarchar(30)
AS
SELECT * 
FROM Elan
WHERE Fueltype = @Fueltype
GO