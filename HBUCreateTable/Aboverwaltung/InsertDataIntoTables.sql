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

insert into Ort (PLZ,Ort)
values	(8000, 'Zürich'),
		(8021,'Zürich'),
		(8048, 'Zürich'), 
		(3000, 'Bern'),
		(4000, 'Basel');
select * from Ort
delete from Ort
go

insert into AboArt (AboArt,Gebühr)
values	('Student',500.00),
		('Jahresabo', 1000.00),
		('Monatsabo', 150.00);
select * from AboArt
go

--identity selber bestimmen
-- set identity_insert Ort On
-- insert into

-- Switch off 
-- set identity_insert Ort OFF




insert into Mitglied (ID, 
						AnredeID,
						AboID, 
						OrtID,
						Nachname,
						Vorname,
						Eintritt)
values 
('Marco','Balmelli', convert (date,'01.01.1990',104)), 
('Sandra','Bürgin', convert (date,'01.05.1989',104)), 
('Reto','Emmenegger', convert (date,'01.10.1994',104)), 
('Georg','Keller',convert (date, '30.11.1996',104)),
('Karina' , 'Müller',convert (date, '30.08.2005',104)),
('Thomas' , 'Groz',convert (date, '15.07.2005',104)),
('Isabelle' , 'Pozi',convert(date, '15.07.2005',104));

print 'Mitglieder einfügen'

select * from Mitglied
go 

delete from Mitglied


--- alle einträge in der Tabelle löschen
delete from Ort;