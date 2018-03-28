use ArztDB
go

drop PROCEDURE scores
GO
CREATE PROCEDURE scores
@score1 smallint,
@score2 smallint,
@score3 smallint,
@score4 smallint,
@score5 smallint,
@mySum smallint OUTPUT
AS
BEGIN
SELECT @mySum = (@score1 + @score2 + @score3 + @score4 + @score5)
END
-- Aufruf
use Abo
go
DECLARE @SumScore smallint
EXEC scores 10, 9, 8, 8, 10, @SumScore OUTPUT
SELECT 'Die Summe ist: ', @SumScore
select * from Ar

go
CREATE PROCEDURE ArztListe
AS
Select * from Arzt
go
exec ArztListe
go
CREATE PROCEDURE InsertOrt @PLZ int, @Ort nvarchar(50)
AS
Insert into Ort (PLZ, ORT )
Values( @PLZ, @Ort )
go
exec InsertOrt 3000, 'Bern'