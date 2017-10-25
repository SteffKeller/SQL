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
inner join Anrede a on m.AnredeID = a.ID
inner join AboArt aa on m.AboID = aa.ID
where a.Anrede = 'Frau' and aa.Gebühr <= 500
order by Nachname asc, Vorname asc

----A2.2
--Selektieren Sie alle Abos, bei welchen die Anrede „Herr“ 
--ist und der Ort „Bern“ und die Aboart „Student“ ist.
select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
from Mitglied m
inner join Anrede a on m.AnredeID = a.ID 
inner join Ort on  m.OrtID = Ort.ID
inner join AboArt on m.AboID = AboArt.ID
where a.Anrede = 'Herr' and Ort.Ort = 'Bern' and AboArt.AboArt = 'Student'

select * from Mitglied

--2.3 Listen Sie alle Abos, bei welchen die 
--Anrede „Herr“ ist und der Ort „Zürich“ oder „Bern“ ist.
select a.Anrede, m.Vorname, m.Nachname, Ort.Ort, AboArt.AboArt
from Mitglied m
inner join Anrede a on m.AnredeID = a.ID 
inner join Ort on  m.OrtID = Ort.ID
inner join AboArt on m.AboID = AboArt.ID
where a.Anrede = 'Herr' and Ort.Ort in ( 'Bern','Zürich')


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



