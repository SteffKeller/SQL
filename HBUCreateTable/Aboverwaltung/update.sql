

use Abo
-- Tabelleninhalt updaten
update AboArt
	set Gebühr =600,
	AboArt ='Student'
	where AboArt = 'Studentenabo';

	select *from AboArt