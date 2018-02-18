--- SQL Abfragen
use Abo


select	ID as [Mitarbeier-Nr],
		Vorname as VName, 
		Nachname as NName
	from Mitglied
--[] f�r strings mit sonderzeichen, Leerzeichen, oder f�r reservierte Namen von SQL

---distinct -> unterschiedlich
select distinct Nachname from Mitglied
--es kommen nur unterschiedliche Datens�tze -> distinct wird auf die resultierende Tabelle angewendet

--and verkn�fpung
select * from Ort where Ort = 'Z�rich' and PLZ between 8000 and 8022
-- or verkn�pfung
select * from Ort where Ort = 'Z�rich' or PLZ between 3000 and 8022
-- in abfrage auf einzelne Werte in der Bedingung
select * from Ort where PLZ IN (8000,8021)

--- like suche teile einer Eigenschaft  % Jokerzeichen,  _ Platzhalter f�r genau 1 Zeichen

--- suche nach Tausender PLZ
select * from Ort  where PLZ like ('%000')
--- suche nach Nachname mit 'a' an zweiter Stelle
select * from Mitglied where Nachname like ('_a%')
select * from AboArt where Geb�hr between 150 and 600

--- sortieren
select * from Aboart order by Geb�hr
--- asc = aufsteigend, desc = absteigend
select * from Ort order by ort asc , PLZ desc
--- 
select * from Mitglied order by Eintritt

--- Tabelle so ausgeben wie �rspr�nglich for der Normalisierung dargestellt
select 
	Mitglied.ID,
	Anrede.Anrede, 
	Mitglied.Nachname, 
	Mitglied.Vorname,
	Ort.PLZ,
	Ort.Ort,
	Mitglied.Eintritt,
	AboArt.AboArt,
	AboArt.Geb�hr
	from Mitglied, Anrede, Ort, AboArt 
	where Mitglied.AnredeID = Anrede.ID 
		and Ort.ID = Mitglied.OrtID
		and AboArt.ID = Mitglied.AboID 
	order by Mitglied.ID asc

-- 24.1017 Aggregatfunktionen
select count(*) as Anzahl from AboArt
select min(Geb�hr) as MinGeb�hr from AboArt
select avg(Geb�hr) as AvgGeb�hr from AboArt
select sum (Geb�hr) as Summe from AboArt

select count(*) as Anzahl,
	min(Geb�hr) as MinGeb�hr,
	max(Geb�hr) as MaxGeb�hr,
	avg(geb�hr) as AvgGeb�hr,
	sum(Geb�hr) as SumGeb�hr from AboArt


select AnredeID from Mitglied 
group by AnredeID
order by AnredeID

-- Anzahl M�nner und Frauen der Mitglieder
select AnredeID, count(*)  as Anzahl from Mitglied 
group by AnredeID
order by AnredeID

