use CS2_Persons
GO
insert into [dbo].[Adresse]
values ('9015','Buhwil'),
		('8583','Sulgen'),
		('9500','Wil'),
		('9323','Steinach'),
		('2345','Bern'),
		('6845','Weinfelden');


		-- insert Ort values
insert into [Adresse] (PLZ,Ort)
values	(8000, 'Z�rich'),
		(8021,'Z�rich'),
		(8048, 'Z�rich'), 
		(3000, 'Bern'),
		(4000, 'Basel');


insert into Persons
values(1,'Keller','Stefan','Thurstrasse 1','0796320511'),
		(2,'Keller','Hans','Dorfstrasse 23','07854693'),
		(3,'Schneider','J�rg','Amperestrasse 2','0714478603'),
		(4,'Eberle','Janine','M�hle 1','0527895236'),
		(1,'Schenk','Roland','Am Bach 76','0452369856');
--insert into Anrede (Anrede)
--values	('Herr'),
--		('Frau');
