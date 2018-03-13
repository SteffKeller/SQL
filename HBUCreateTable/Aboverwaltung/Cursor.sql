Declare @VName varchar(50)
Declare @NName varchar(50)

-- cursor deklarieren
Declare cursorExample cursor for select m.Vorname, m.Nachname from Mitglied m
-- und offen
open CursorExample

-- cursor ausführen
fetch CursorExample into @Vname, @NName
while (@@FETCH_STATUS = 0)
Begin
	print 'Selektiert: ' + @Vname +' ' + @Nname; 
	fetch CursorExample into @Vname, @NName
end
-- und schliessen
close CursorExample
deallocate  CursorExample