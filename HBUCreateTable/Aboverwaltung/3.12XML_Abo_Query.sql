use Abo


------- 3.12  A1.1
--Schreiben Sie eine SQL Abfrage, die ID, Nachname, Vorname und Eintritt
-- aus der Tabelle Mitglied ausliest und alles in einem XML-Dokument mit dem Wurzelelement MitarbeiterList ausgibt.
select Mitglied.ID,
		Mitglied.Vorname,
		Mitglied.Nachname,
		Mitglied.Eintritt from Mitglied 
		for XML PATH, ROOT('MitarbeiterList')
		
------- 3.12  A1.2----------------
--Schreiben Sie eine SQL Abfrage, die pro Anrede (Herr, Frau) die Mitglieder im XML Format mit Wurzelelement MitarbeiterList ausliest. Beachten Sie, dass die XML Spalte für die Hyperlinks Anzeige
--mit der Convert Funktion (convert(xml, spalte)) konvertiert werden muss.
select Anrede.ID,
convert(xml,(select ID, Vorname, Nachname, Eintritt from Mitglied
		where Mitglied.AnredeID = Anrede.ID for xml auto))
from Anrede

select Anrede.ID,
(select ID, Vorname, Nachname, Eintritt from Mitglied
		where Mitglied.AnredeID = Anrede.ID for xml auto)
from Anrede

-------------	3.12  A1.3
--Schreiben Sie eine SQL Abfrage, die ID, Nachname, Vorname und Eintritt aus der Tabelle Mitglied ausliest und alles in einem JSON-Dokument mit dem Wurzelelement MitarbeiterList ausgibt
select Mitglied.ID,
		Mitglied.Vorname,
		Mitglied.Nachname,
		Mitglied.Eintritt from Mitglied 
		for JSON AUTO,ROOT('MitarbeiterList')

-------------	3.12  A1.4
--Schreiben Sie eine SQL Abfrage, die pro Aboart (Student, Jahresabo etc.) die Mitglieder als JSON Dokument mit Wurzelelement MitarbeiterListJ ausliest.
select AboArt.AboArt, 
	(select Mitglied.ID,
		Mitglied.Vorname,
		Mitglied.Nachname
		from Mitglied
		where Mitglied.AboID = AboArt.ID for json auto, root('MitarbeiterList'))
		from AboArt
		-- JSON als convert datentyp erst ab SQL 18 vorhanden