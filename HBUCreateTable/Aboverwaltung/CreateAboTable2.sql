--
--Aboveraltung Create table No2
-- zuerst alle Tabellen erstellen erst dann mit "alter table" die foreign keys definieren
--
use Abo;
go

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
);
go


-- Schritt 2 foreign constrains erstellen

alter table Mitglied
	add constraint FK_Mitglied_Anrede foreign key(AnredeID) references Anrede(ID),
	constraint FK_Mitglied_AboArt foreign key (AboID) references AboArt(ID),
	constraint FK_Mitglied_Ort foreign key (OrtID) references Ort(ID);

	-- unique constriants
alter table AboArt
	add constraint  uq_AboArt unique (AboArt);

alter table Anrede
	add constraint uq_Anrede unique (Anrede);

alter table Ort 
	add constraint uq_PLZOrt unique(PLZ,Ort);


	-- default constraints vergiebt einen default Wert falls der Inhalt nicht explizit angegeben wird
alter table Aboart
	add constraint D_gebuehr default 0.0 for Gebühr;

	-- check constraints
	-- kann eingaben auf bestimmte werte oder bereichte einschrünken, geht auch mit Regex
alter table Ort
	add constraint ch_plz check (PLZ between 1000 and 9999);










