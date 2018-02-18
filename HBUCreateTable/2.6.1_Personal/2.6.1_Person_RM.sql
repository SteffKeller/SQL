use DB2_Person;
go
----create Table---------------------

CREATE TABLE Person (
  PersonalNr INTEGER  NOT NULL   IDENTITY ,
  Name VARCHAR(20)    ,
  Adresse VARCHAR(50)    ,
  Geburtsdatum DATE      ,
PRIMARY KEY(PersonalNr));
GO




CREATE TABLE Kunde (
  Person_PersonalNr INTEGER  NOT NULL  ,
  Funktion VARCHAR(20)    ,
  Umsatz Float   ,
  PRIMARY KEY(Person_PersonalNr),
  FOREIGN KEY(Person_PersonalNr)
    REFERENCES Person(PersonalNr));
GO


CREATE INDEX IFK_Rel_01 ON Kunde (Person_PersonalNr);
GO


CREATE TABLE Dozent (
  Person_PersonalNr INTEGER  NOT NULL  ,
  Biographie VARCHAR(50)    ,
  HonorarproTag float   ,
  PRIMARY KEY(Person_PersonalNr),
  FOREIGN KEY(Person_PersonalNr)
    REFERENCES Person(PersonalNr));
GO


CREATE INDEX IFK_Rel_02 ON Dozent (Person_PersonalNr);
GO



--------------insert Data------------

use DB2_Person;

insert into Person(Name,Adresse,Geburtsdatum)
values	('Walter Meier','Riedstrasse',convert (date,'01.01.1990',104)),
		('Franz Müller','Dorfstrasse ',convert (date,'12.12.1989',104)),
		('Liese Lotte','Zürich 45 ',convert (date,'12.12.2012',104)),
		('Stefan Keller','Thurstrasse ',convert (date,'12.12.1981',104));
select * from Person;

go 

insert into Kunde(Person_PersonalNr,Funktion,Umsatz)
values ((select PersonalNr from Person where Name = 'Stefan Keller'), 'Entwickler',120000),
		((select PersonalNr from Person where Name = 'Walter Meier'), 'PM',50000);

insert into Dozent(Person_PersonalNr,Biographie,HonorarproTag)
values ((select PersonalNr from Person where Name = 'Franz Müller'), 'Irgendw her',1400),
((select PersonalNr from Person where Name = 'Liese Lotte'), 'Irgendwas',800),
((select PersonalNr from Person where Name = 'Stefan Keller'), 'Irgendwas',800);



---------------query-----------------
select Person.PersonalNr,
		Person.Name,
		Person.Adresse,
		Person.Geburtsdatum,
		Kunde.Funktion,
		Kunde.Umsatz
		from Kunde 
		inner join Person 
		on Kunde.Person_PersonalNr = Person.PersonalNr
	

select Person.PersonalNr,
		Person.Name,
		Person.Adresse,
		Person.Geburtsdatum,
		Dozent.Biographie,
		Dozent.HonorarproTag
		from Dozent 
			inner join Person 
			on Dozent.Person_PersonalNr = Person.PersonalNr;

select Person.PersonalNr,
		Person.Name,
		Person.Adresse,
		Person.Geburtsdatum,
		Dozent.Biographie,
		Dozent.HonorarproTag,
		Kunde.Funktion,
		Kunde.Umsatz
		from Person
		inner join Dozent
			on Dozent.Person_PersonalNr = Person.PersonalNr 
		inner join Kunde
			on Dozent.Person_PersonalNr = Kunde.Person_PersonalNr;

