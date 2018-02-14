use DB2_Person
go

--c) Erstellen Sie für folgende Abfragen die SELECT Anweisung
--a. Welche Bestandteile hat der Artikel mit der Teile Nr. (TNr) = 60

select Struktur.*, Teile.Bezeichnung, Teile.TNr, Teile.Typ  from Struktur
inner join Teile 
			on Teile.TNr = Struktur.UTeil
			where Struktur.OTeil = 60

--b. Die in der Baugruppe enthaltenen Teile werden aufgelöst (2 stufig)

	

--c. Die in der Baugruppe enthaltenen Teile werden aufgelöst (3 stufig)


--Lösung
-- Welche Bestandteile hat der Artikel mit der Teile Nr. (TNr) = 60
select t.tnr, s.uteil
    from teile t inner join struktur s
        on t.tnr = s.oteil
    where t.tnr = 60


-- Die in der Baugruppe enthaltenen Teile werden aufgel?st (2 stufig)
select t.tnr, s1.uteil, s2.uteil
from teile t inner join struktur s1
    on t.tnr = s1.oteil
    inner join struktur s2
    on s1.uteil = s2.oteil
    where t.tnr = 60


-- Die in der Baugruppe enthaltenen Teile werden aufgel?st (3 stufig)
select t.tnr, s1.uteil, s2.uteil, s3.uteil
from teile t inner join struktur s1
    on t.tnr = s1.oteil
    inner join struktur s2
    on s1.uteil = s2.oteil
    inner join struktur s3
    on s2.uteil = s3.oteil
    where t.tnr = 60
