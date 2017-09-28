--Drop table
use Abo;


--- constraints löschen
alter table Mitglied 
	drop constraint if exists FK_Mitglied_Anrede,
	constraint if exists FK_MItglied_Ort,
	constraint if exists FK_Mitglied_AboArt;

go

-- tables löschen
-- mitglied wird zuerst gelöscht, somit sind auch alle constraints gelöscht, drop constraint 
-- müssten als nicht zuerst gelöscht werden
drop table if exists Mitglied;
drop table if exists AboArt;
drop table if exists Anrede;
drop table if exists Ort;

go