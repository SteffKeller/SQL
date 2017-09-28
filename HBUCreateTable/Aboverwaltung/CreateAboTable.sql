--
-- Aboveraltung
-- Stefan Keller 21.9.17

use Abo;
go

-- create the whole table for the Aboverwaltung
-- AboArt create
create table AboArt
(
	ID int IDENTITY(1,1) NOT NULL,
	AboArt varchar(50) NOT NULL,
	Gebühr DECIMAL(7,3) NULL,
	constraint PK_AboArt primary key (ID)
);
go

--Anrede create
create table Anrede
(
	ID int IDENTITY(1,1) NOT NULL,
	Anrede varchar(20) NULL,
	constraint PK_Anrede primary key (ID),
);
go

--Ort create
create table Ort
(
	ID int IDENTITY(1,1) NOT NULL,
	PLZ int NULL,
	Ort varchar(80) NULL,
	constraint PK_Ort primary key (ID)
);
go


-- Mitglied create
create table Mitglied
(
	ID int IDENTITY(1,1) NOT NULL,
	AnredeID int NULL,
	OrtID int NULL,
	AboID int NULL,
	Nachname varchar(50) NULL,
	Vorname varchar(50) NULL,
	Eintritt date NULL,
	constraint PK_Mitglied primary key (ID),
	constraint FK_Mitglied_Anrede foreign key(AnredeID) references Anrede(ID),
	constraint FK_Mitglied_AboArt foreign key (AboID) references AboArt(ID),
	constraint FK_Mitglied_Ort foreign key (OrtID) references Ort(ID),
	-- foreigen keys müssen beim erstellen der constraint schon erstellt sein!
);
go





