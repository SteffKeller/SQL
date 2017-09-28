-- Mein erstes SQL Script
--
-- Datum: 14.9.17
--
-- Datenbank wählen
use HBU;
-- Version abfragen
go
Select @@version;
go
-- Tabelle erstellen
create table class
(
	student_id int IDENTITY(1,1)  NOT NULL,
	name varchar(16) NOT NULL,
	plz int NULL,
	constraint pk_class primary key (student_id)
);
go
-- Tabelle löschen
drop table class;
