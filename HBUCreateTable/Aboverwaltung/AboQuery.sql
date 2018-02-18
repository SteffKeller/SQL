--- SQL Abfragen
use Abo


select	ID as [Mitarbeier-Nr],
		Vorname as VName, 
		Nachname as NName
	from Mitglied
--[] für strings mit sonderzeichen, Leerzeichen, oder für reservierte Namen von SQL

---distinct -> unterschiedlich
select distinct Nachname from Mitglied
--es kommen nur unterschiedliche Datensätze -> distinct wird auf die resultierende Tabelle angewendet

--and verknüfpung
select * from Ort where Ort = 'Zürich' and PLZ between 8000 and 8022
-- or verknüpfung
select * from Ort where Ort = 'Zürich' or PLZ between 3000 and 8022
-- in abfrage auf einzelne Werte in der Bedingung
select * from Ort where PLZ IN (8000,8021)

--- like suche teile einer Eigenschaft  % Jokerzeichen,  _ Platzhalter für genau 1 Zeichen

--- suche nach Tausender PLZ
select * from Ort  where PLZ like ('%000')
--- suche nach Nachname mit 'a' an zweiter Stelle
select * from Mitglied where Nachname like ('_a%')
select * from AboArt where Gebühr between 150 and 600

--- sortieren
select * from Aboart order by Gebühr
--- asc = aufsteigend, desc = absteigend
select * from Ort order by ort asc , PLZ desc
--- 
select * from Mitglied order by Eintritt

--- Tabelle so ausgeben wie ürsprünglich for der Normalisierung dargestellt
select 
	Mitglied.ID,
	Anrede.Anrede, 
	Mitglied.Nachname, 
	Mitglied.Vorname,
	Ort.PLZ,
	Ort.Ort,
	Mitglied.Eintritt,
	AboArt.AboArt,
	AboArt.Gebühr
	from Mitglied, Anrede, Ort, AboArt 
	where Mitglied.AnredeID = Anrede.ID 
		and Ort.ID = Mitglied.OrtID
		and AboArt.ID = Mitglied.AboID 
	order by Mitglied.ID asc

-- 24.1017 Aggregatfunktionen
select count(*) as Anzahl from AboArt
select min(Gebühr) as MinGebühr from AboArt
select avg(Gebühr) as AvgGebühr from AboArt
select sum (Gebühr) as Summe from AboArt

select count(*) as Anzahl,
	min(Gebühr) as MinGebühr,
	max(Gebühr) as MaxGebühr,
	avg(gebühr) as AvgGebühr,
	sum(Gebühr) as SumGebühr from AboArt


select AnredeID from Mitglied 
group by AnredeID
order by AnredeID

-- Anzahl Männer und Frauen der Mitglieder
select AnredeID, count(*)  as Anzahl from Mitglied 
group by AnredeID
order by AnredeID

