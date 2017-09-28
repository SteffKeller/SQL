--Drop table
use Abo;


--- constraints l�schen
alter table Mitglied 
	drop constraint if exists FK_Mitglied_Anrede,
	constraint if exists FK_MItglied_Ort,
	constraint if exists FK_Mitglied_AboArt;

go

-- tables l�schen
-- mitglied wird zuerst gel�scht, somit sind auch alle constraints gel�scht, drop constraint 
-- m�ssten als nicht zuerst gel�scht werden
drop table if exists Mitglied;
drop table if exists AboArt;
drop table if exists Anrede;
drop table if exists Ort;

go