--
--Aboveraltung Create table No2
-- zuerst alle Tabellen erstellen erst dann mit "alter table" die foreign keys definieren
--
USE Abo;
GO

-- AboArt create
CREATE TABLE AboArt
(ID     INT IDENTITY(1, 1) NOT NULL,
 AboArt VARCHAR(50) NOT NULL,
 Gebühr DECIMAL(7, 3) NULL,
 CONSTRAINT PK_AboArt PRIMARY KEY(ID)
);
GO

--Anrede create
CREATE TABLE Anrede
(ID     INT IDENTITY(1, 1) NOT NULL,
 Anrede VARCHAR(20) NULL,
 CONSTRAINT PK_Anrede PRIMARY KEY(ID),
);
GO

--Ort create
CREATE TABLE Ort
(ID  INT IDENTITY(1, 1) NOT NULL,
 PLZ INT NULL,
 Ort VARCHAR(80) NULL,
 CONSTRAINT PK_Ort PRIMARY KEY(ID)
);
GO



-- Mitglied create
CREATE TABLE Mitglied
(ID       INT IDENTITY(1, 1) NOT NULL,
 AnredeID INT NULL,
 OrtID    INT NULL,
 AboID    INT NULL,
 Nachname VARCHAR(50) NULL,
 Vorname  VARCHAR(50) NULL,
 Eintritt DATE NULL,
 CONSTRAINT PK_Mitglied PRIMARY KEY(ID),
);
GO


-- Schritt 2 foreign constrains erstellen

ALTER TABLE Mitglied
ADD CONSTRAINT FK_Mitglied_Anrede FOREIGN KEY(AnredeID) REFERENCES Anrede(ID),
    CONSTRAINT FK_Mitglied_AboArt FOREIGN KEY(AboID) REFERENCES AboArt(ID),
    CONSTRAINT FK_Mitglied_Ort FOREIGN KEY(OrtID) REFERENCES Ort(ID);

	-- unique constriants
ALTER TABLE AboArt
ADD CONSTRAINT uq_AboArt UNIQUE(AboArt);
ALTER TABLE Anrede
ADD CONSTRAINT uq_Anrede UNIQUE(Anrede);
ALTER TABLE Ort
ADD CONSTRAINT uq_PLZOrt UNIQUE(PLZ, Ort);


	-- default constraints vergiebt einen default Wert falls der Inhalt nicht explizit angegeben wird
ALTER TABLE Aboart
ADD CONSTRAINT D_gebuehr DEFAULT 0.0 FOR Gebühr;

	-- check constraints
	-- kann eingaben auf bestimmte werte oder bereichte einschrünken, geht auch mit Regex
ALTER TABLE Ort
ADD CONSTRAINT ch_plz CHECK(PLZ BETWEEN 1000 AND 9999);










