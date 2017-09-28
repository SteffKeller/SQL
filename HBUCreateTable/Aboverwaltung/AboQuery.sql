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
