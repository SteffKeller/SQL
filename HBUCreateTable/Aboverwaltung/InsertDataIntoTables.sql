--
--Aboveraltung
--


-- insert the data to the tables

USE Abo;

INSERT INTO Anrede( Anrede )
VALUES( 'Herr' ), ( 'Frau' );

SELECT *
FROM Anrede;

SELECT Anrede
FROM Anrede;
GO 

-- reset ID 

DBCC CHECKIDENT('[Ort]', RESEED, 0);
-- insert Ort values

INSERT INTO Ort( PLZ, Ort )
VALUES( 8000, 'Zürich' ), ( 8021, 'Zürich' ), ( 8048, 'Zürich' ), ( 3000, 'Bern' ), ( 4000, 'Basel' );

SELECT *
FROM Ort;

DELETE FROM Ort;
GO
-- insert AboArt values

INSERT INTO AboArt( AboArt, Gebühr )
VALUES( 'Student', 500.00 ), ( 'Jahresabo', 1000.00 ), ( 'Monatsabo', 150.00 );

SELECT *
FROM AboArt;
GO

--identity selber bestimmen

SET IDENTITY_INSERT MItglied ON;
-- insert into

-- Switch off 
-- set identity_insert Ort OFF


SET IDENTITY_INSERT Mitglied ON;
-- insert mitglieder

INSERT INTO Mitglied( ID, AnredeID, AboID, OrtID, Nachname, Vorname, Eintritt )
VALUES( 33,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Herr'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Student'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '8000'
), 'Balmelli', 'Marco', CONVERT(date, '01.01.1990', 104) ), ( 44,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Frau'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Jahresabo'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '8021'
), 'Bürgin', 'Sandra', CONVERT(date, '01.05.1989', 104) ), ( 55,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Herr'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Monatsabo'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '8048'
), 'Emmenegger', 'Reto', CONVERT(date, '01.10.1994', 104) ), ( 66,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Herr'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Jahresabo'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '8021'
), 'Keller', 'Georg', CONVERT(date, '30.11.1996', 104) ), ( 77,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Frau'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Jahresabo'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '3000'
), 'Müller', 'Karina', CONVERT(date, '30.08.2005', 104) ), ( 88,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Herr'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Student'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '4000'
), 'Groz', 'Thomas', CONVERT(date, '15.07.2005', 104) ), ( 99,
(
	SELECT id
	FROM Anrede
	WHERE Anrede = 'Frau'
),
(
	SELECT id
	FROM AboArt
	WHERE AboArt = 'Monatsabo'
),
(
	SELECT id
	FROM Ort
	WHERE PLZ = '3000'
), 'Pozzi', 'Isabelle', CONVERT(date, '15.07.2005', 104) );

PRINT 'Mitglieder einfügen';

SELECT *
FROM Mitglied;
GO 
-- tabelleninhalt lüschen

DELETE FROM Mitglied;


--- alle eintrüge in der Tabelle lüschen

DELETE FROM Ort;