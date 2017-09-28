-- Mein erstes SQL Script
--
-- Datum: 14.9.17
--
-- Datenbank wählen
use HBU;

Select @@version;
-- Tabelle erstellen
create table class
(
	student_id int NOT NULL,
	name varchar(16) NOT NULL,
	plz int NULL	
);
