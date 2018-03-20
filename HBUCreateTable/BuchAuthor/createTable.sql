use buch
GO

CREATE TABLE buch.tblBank (
BLZ char(8)CONSTRAINT pkBLZ PRIMARY KEY, Bank varchar(50) NOT NULL
); GO
CREATE TABLE buch.tblAutor (
ID smallint IDENTITY(1,1)CONSTRAINT pkID PRIMARY KEY, Vorname varchar(20) NOT NULL, Nachname varchar(50) NOT NULL, KontoNr char(10) NULL CONSTRAINT ckKontoNr CHECK (KontoNr LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), BLZ char(8) NULL CONSTRAINT fkBLZ REFERENCES buch.tblBank(BLZ)
); GO
CREATE TABLE buch.tblBuch (
ISBN char(13) CONSTRAINT pkISBN PRIMARY KEY, Titel varchar (300) NOT NULL, Preis money CONSTRAINT dePreis DEFAULT 0
); GO
CREATE TABLE buch.tblAutorBuch (
ID smallint NOT NULL CONSTRAINT fkID REFERENCES buch.tblAutor(ID), ISBN char(13) NOT NULL CONSTRAINT fkISBN REFERENCES buch.tblBuch(ISBN) ON UPDATE CASCADE, Anteil decimal(5,2) CONSTRAINT ckAnteil CHECK (Anteil <= 100.00), CONSTRAINT pkIDISBN PRIMARY KEY(ID, ISBN)
);
GO