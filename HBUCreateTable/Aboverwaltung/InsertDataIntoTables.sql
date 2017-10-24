--
--Aboveraltung
--


-- insert the data to the tables

use Abo;

insert into Anrede (Anrede)
values	('Herr'),
		('Frau');
select * from Anrede;
select Anrede from Anrede;
go 

-- reset ID 
DBCC CHECKIDENT ('[Ort]',RESEED, 0);
-- insert Ort values
insert into Ort (PLZ,Ort)
values	(8000, 'Z�rich'),
		(8021,'Z�rich'),
		(8048, 'Z�rich'), 
		(3000, 'Bern'),
		(4000, 'Basel');
select * from Ort
delete from Ort
go
-- insert AboArt values
insert into AboArt (AboArt,Geb�hr)
values	('Student',500.00),
		('Jahresabo', 1000.00),
		('Monatsabo', 150.00);
select * from AboArt
go

--identity selber bestimmen
set identity_insert MItglied On
-- insert into

-- Switch off 
-- set identity_insert Ort OFF


SET IDENTITY_INSERT  Mitglied ON
-- insert mitglieder
insert into Mitglied (ID, 
						AnredeID,
						AboID, 
						OrtID,
						Nachname,
						Vorname,
						Eintritt)
values (33, 
	(select id from Anrede where Anrede = 'Herr'),
	(select id from AboArt where AboArt = 'Student'),
	(select id from Ort where PLZ = '8000'),
	'Balmelli',
	'Marco', 
	convert (date,'01.01.1990',104)),
	(44, 
	(select id from Anrede where Anrede = 'Frau'),
	(select id from AboArt where AboArt = 'Jahresabo'),
	(select id from Ort where PLZ = '8021'),
	'B�rgin','Sandra', convert (date,'01.05.1989',104)),
	(55, 
	(select id from Anrede where Anrede = 'Herr'),
	(select id from AboArt where AboArt = 'Monatsabo'),
	(select id from Ort where PLZ = '8048'), 
	'Emmenegger','Reto', convert (date,'01.10.1994',104)), 
	(66, 
	(select id from Anrede where Anrede = 'Herr'),
	(select id from AboArt where AboArt = 'Jahresabo'),
	(select id from Ort where PLZ = '8021'),
	'Keller','Georg',convert (date, '30.11.1996',104)),
	(77, 
	(select id from Anrede where Anrede = 'Frau'),
	(select id from AboArt where AboArt = 'Jahresabo'),
	(select id from Ort where PLZ = '3000'),
	'M�ller','Karina' ,convert (date, '30.08.2005',104)),
	(88, 
	(select id from Anrede where Anrede = 'Herr'),
	(select id from AboArt where AboArt = 'Student'),
	(select id from Ort where PLZ = '4000'),
	'Groz','Thomas' ,convert (date, '15.07.2005',104)),
	(99, 
	(select id from Anrede where Anrede = 'Frau'),
	(select id from AboArt where AboArt = 'Monatsabo'),
	(select id from Ort where PLZ = '3000'),
	'Pozzi','Isabelle' ,convert(date, '15.07.2005',104));

print 'Mitglieder einf�gen'

select * from Mitglied
go 
-- tabelleninhalt l�schen
delete from Mitglied


--- alle eintr�ge in der Tabelle l�schen
delete from Ort;