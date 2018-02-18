--INDEX ---------------------------------------------------------------	

--Anrede, Name , Vorname
select ad.Anrede,
		 Vorname, 
		 Nachname, 
		 ar.AboArt,
		Ort.PLZ,
		Ort.Ort,
		ar.AboArt,
		ar.Gebühr

		 from Mitglied m
		inner join AboArt ar 
			on m.AboID = ar.ID
		inner join Anrede ad 
			on m.AnredeID = ad.ID
		inner join Ort 
			on Ort.ID = m.OrtID


select m.Vorname, m.Nachname
from Mitglied m where m.Nachname = 'Balmelli'
and Vorname = 'Marco'

select * from Mitglied
select m.Vorname, m.Nachname from Mitglied m;

create index IX_Mitlgied_Nach_Vorname on Mitglied(Nachname,Vorname);
create index IX_Mitglied_Nachname on Mitglied(Nachname);
create index IX_Mitglied_Vorname on Mitglied(Vorname);
create index IX_Mitglied_ORTID on Mitglied(OrtID);
create index IX_Mitglied_Abo on Mitglied([AboID]);
create index IX_Mitglied_Anrede on Mitglied([AnredeID]);

alter index All on Mitglied rebuild

drop index IX_Mitglied_Nachname on Mitglied

------------------------Transaction------------------------------------
--start
begin transaction
-- SQL befehle
delete from Mitglied
select * from Mitglied

---Transaktion beendet
rollback