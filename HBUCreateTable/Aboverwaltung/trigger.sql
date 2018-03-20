use Abo
GO

create trigger triggeronUpdateInsertDelete 
on Ort
after Insert, Update, delete
as
	set nocount on
	print('Trigger ausgeführt')

	select * from inserted
	select * from deleted
	GO




--create testTable for safety trigger
create table testTable
(
	ID int IDENTITY(1,1) NOT NULL
)
GO

-- create safety trigger on DDL
CREATE TRIGGER safety 
ON  DATABASE
FOR DROP_TABLE, ALTER_TABLE 
AS 
	DECLARE @Data XML 
	SET @Data = EventData()  
   PRINT 'You must disable Trigger "safety" to drop or alter tables!' 
	select @Data.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(100)')
	select @Data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(2000)')
ROLLBACK; 
GO
-- fire trigger 
drop table if exists testTable;

-- drop trigger
drop trigger safety on DATABASE;

--disable trigger
disable trigger safety on DATABASE;

--enable trigger
enable trigger safety on DATABASE;