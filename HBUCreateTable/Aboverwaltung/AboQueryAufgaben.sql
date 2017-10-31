---Hausaufgaben

---A1.1
--Selektieren Sie die alle Mitglieder mit Nachname, Vorname, Eintritt. Sortieren Sie die Ausgabe nach
--Eintritt Datum aufsteigend.

use Abo

select	Nachname as [Name],
		Vorname,
		Eintritt as [Mitglied seit] 
		from Mitglied order by Eintritt asc;

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
--Selektieren Sie die alle Mitglieder deren Nachname mit ï¿½Bï¿½ beginnt
-- und zeigen Sie den Vornamen, Nachname und Eintrittsdatum an.

select Vorname, Nachname, Eintritt from Mitglied where Nachname like ('B%')

--A1.4
--Selektieren Sie die alle Mitglieder deren Mitgliedernummer kleiner 50 ist 
--und der Eintritt vor 01.01.1995 liegt. 

select * from Mitglied where ID < 50 and Eintritt < convert (date,'01.01.1995',104)

--A1.5
--Selektieren Sie die alle Mitglieder deren Nachname ein ï¿½zzï¿½ enthï¿½lt
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
--Selektieren Sie die alle Mitglieder deren Nachname ein ï¿½eï¿½ enthï¿½lt 
--oder der Vorname mit ï¿½aï¿½ endet.

select 
	Mitglied.Vorname,
	Mitglied.Nachname 
	from Mitglied where Mitglied.Nachname like ('%e%') and Mitglied.Vorname like ('%a')
	

--A.21
--Selektieren Sie die Abos, bei welchen die Gebï¿½hr kleiner oder gleich 500 ist 
--und die Anrede ï¿½Frauï¿½ ist. Sortieren Sie die Ausgabe aufsteigend nach Nachname, Vorname

select a.Anrede, m.Vorname, m.Nachname, aa.Gebühr
	from Mitglied m
		inner join Anrede a 
			on m.AnredeID = a.ID
		inner join AboArt aa 
			on m.AboID = aa.ID
		where a.Anrede = 'Frau' 
			and aa.Gebühr <= 500
		order by Nachname asc, Vorname asc

----A2.2
--Selektieren Sie alle Abos, bei welchen die Anrede „Herr“ 
--ist und der Ort „Bern“ und die Aboart „Student“ ist.
select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
	from Mitglied m
		inner join Anrede a 
			on m.AnredeID = a.ID 
		inner join Ort 
			on  m.OrtID = Ort.ID
		inner join AboArt 
			on m.AboID = AboArt.ID
		where a.Anrede = 'Herr' 
			and Ort.Ort = 'Bern' 
			and AboArt.AboArt = 'Student'

--2.3 Listen Sie alle Abos, bei welchen die 
--Anrede „Herr“ ist und der Ort „Zürich“ oder „Bern“ ist.
select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
	from Mitglied m
		inner join Anrede a 
			on m.AnredeID = a.ID 
		inner join Ort 
			on  m.OrtID = Ort.ID
		inner join AboArt 
			on m.AboID = AboArt.ID
		where a.Anrede = 'Herr' 
		and Ort.Ort in ( 'Bern','Zürich')


--2.4
--Zeige alle Abos, bei welchen die Aboart nicht „Student“, 
--die Anrede „Herr“ und der Ort nicht „Bern“ ist.

select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
from Mitglied m
inner join Anrede a on m.AnredeID = a.ID 
inner join Ort on  m.OrtID = Ort.ID
inner join AboArt on m.AboID = AboArt.ID
where a.Anrede = 'Herr' and Ort.Ort  <> 'Bern' and AboArt <> 'Student'

--A2.5
--Zeige alle Abos an, bei welchen das 
--Eintrittsdatum > 1.1.2005 oder die Anrede „Frau“ ist.
select a.Anrede, m.Vorname, m.Nachname, AboArt.AboArt, m.Eintritt
from Mitglied m
inner join Anrede a on m.AnredeID = a.ID 
inner join AboArt on m.AboID = AboArt.ID
where a.Anrede = 'Frau' or  m.Eintritt > convert(date,'01.01.2005',104) 

--A2.6
--Suchen Sie die Abos, bei welchen die 
--Aboart „Student“ oder „Jahresabo“ ist und die Anrede „Herr“ und Ort „Zürich“ ist
select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
from Mitglied m
inner join Anrede a on m.AnredeID = a.ID 
inner join Ort on  m.OrtID = Ort.ID
inner join AboArt on m.AboID = AboArt.ID
where a.Anrede = 'Herr' and AboArt in ('Student','Jahresabo')


--A3.1
--Erstellen Sie eine Abfrage, welche die Vornamen und Nachnamen der Mitglieder kommagetrennt zusammengefügt und als eine Spalte listet.
select vorname + ',' + nachname as Fullname
	from Mitglied 
	order by 1


--A3.2
--Ändern Sie die Abfrage aus der A3.1 und zeigen Sie dabei Vorname u. Nachname in Großschrift an.
select Upper(vorname + ',' + nachname) as Fullname
	from Mitglied 
	order by 1

--A3.3
--Listen Sie alle Mitglieder mit Nachname u. Vorname 
--und ordnen Sie die Ausgabe nach der Zeichenlänge (Anzahl Zeichen) der Nachnamen absteigend.
select Vorname, Nachname
	from Mitglied
	order by Len(nachname) desc
--A3.4
--Listen Sie alle Mitglieder mit der Kurzbezeichnung 
--(Erster Buchstabe aus Nachname u. Vorname) aufsteigend.

select  left(vorname,1) + left(nachname,1)
	from Mitglied
	order by 1 asc

--A3.5
--Listen Sie alle Mitglieder mit Vorname, Nachname und dem Eintrittsjahr (z.B. 1990).
-- Sortieren Sie die Ausgabe nach dem Eintrittsjahr absteigend.
	
select Vorname, Nachname, year(Eintritt)
	from Mitglied 
	where YEAR(Eintritt) = 1990
	order by Eintritt

--A3.6
--Ermitteln Sie mit einer Abfrage die Mitglieder (Vorname, Nachname, Eintritt) welche im Jahr 2005 eingetreten sind.
select Vorname,Nachname,Eintritt
	from Mitglied
	where YEAR(Eintritt) = 2005

--	4. Abfragen mit Aggregatfunktionen
--A4.1
--Ermitteln Sie mit einer Abfrage den tiefsten, höchsten und Durchschnittspreis aller Abo Arten.
select min(gebühr), max(gebühr), avg(gebühr)
 from AboArt

-- A4.2
--Ermitteln Sie mit einer Abfrage die Anzahl der weiblichen Mitglieder.

select count(Vorname)
	from Mitglied
	inner join Anrede a on a.ID = Mitglied.AnredeID where a.Anrede = 'Frau'

--A4.3
--Ermitteln Sie mit einer Abfrage die Anzahl der Mitglieder (Vorname, Nachname, Eintritt)
-- welche im Jahr 2005 eingetreten sind.

select count(nachname)
	from Mitglied
	where year(eintritt) = 2005


--A4.4
--Ermitteln Sie mit einer Abfrage die Anzahl der welche in „Zürich“ (Ort) wohnen.
select count(nachname)
	from Mitglied
	inner join ort o on o.ID = Mitglied.OrtID where o.Ort = 'Zürich'

--A4.5
--Ermitteln Sie mit einer Abfrage die Anzahl der Mitglieder 
--pro Abo Art (d.h. für jede Abo Arten wird die Mitgliederanzahl ausgegeben).
select AboArt.AboArt, count(*) 
	from Mitglied
		inner join AboArt on AboArt.ID = Mitglied.AboID
		group by AboArt.AboArt
--A4.6
--Ermitteln Sie mit einer Abfrage das Total der Gebühren sämtlicher Mitglieder.
select SUM(aa.Gebühr)
	from Mitglied
	inner join AboArt aa on aa.ID = Mitglied.AboID

select * from Mitglied 