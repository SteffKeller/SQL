---Hausaufgaben

---A1.1
--Selektieren Sie die alle Mitglieder mit Nachname, Vorname, Eintritt. Sortieren Sie die Ausgabe nach
--Eintritt Datum aufsteigend.

use Abo

select	Nachname as [Name],
		Vorname,
		Eintritt as [MItglied seit] 
		from Mitglied order by Eintritt desc;

--A1.2
--Selektieren Sie die alle Mitglieder mit Nachname, Vorname, Eintritt
-- welche seit dem 01.01.2000 eingetreten sind. 
--Sortieren Sie die Ausgabe nach Nachname, Vorname aufsteigend.

select	Nachname as [Name],
		Vorname,
		Eintritt as [MItglied seit]
		from Mitglied 
		where Eintritt between convert (date,'01.01.2000',104) and GETDATE()
		order by Nachname asc, Vorname asc;

go

--A1.3
--Selektieren Sie die alle Mitglieder deren Nachname mit „B“ beginnt
-- und zeigen Sie den Vornamen, Nachname und Eintrittsdatum an.

select Vorname, Nachname, Eintritt from Mitglied where Nachname like ('B%')

--A1.4
--Selektieren Sie die alle Mitglieder deren Mitgliedernummer kleiner 50 ist 
--und der Eintritt vor 01.01.1995 liegt. 

select * from Mitglied where ID < 50 and Eintritt < convert (date,'01.01.1995',104)

--A1.5
--Selektieren Sie die alle Mitglieder deren Nachname ein „zz“ enthält
-- und das Eintrittsdatum nach dem 01.01.2000 liegt.

select Vorname, Nachname, Eintritt from Mitglied where Nachname like ('%zz%') and Eintritt > convert (date,'01.01.2000',104)

--A1.6
--Selektieren Sie die alle Mitglieder welche zwischen dem 01.01.1994 
--und 01.01.1997 eingetreten sind.
--Zeigen Sie die Ausgabe sortiert nach Eintritt Datum an.
select 
	Mitglied.Vorname, 
	Mitglied.Nachname, 
	Mitglied.Eintritt 
	from Mitglied 
	where Eintritt between convert (date,'01.01.1994',104) and convert (date,'01.01.1997',104) 
	order by Eintritt asc

--A1.7
--Selektieren Sie die alle Mitglieder deren Nachname ein „e“ enthält 
--oder der Vorname mit „a“ endet.

select 
	Mitglied.Vorname,
	Mitglied.Nachname 
	from Mitglied where Mitglied.Nachname like ('%e%') and Mitglied.Vorname like ('%a')


