

use Abo
-- Tabelleninhalt updaten
update AboArt
	set Geb�hr =600,
	AboArt ='Student'
	where AboArt = 'Studentenabo';

	select *from AboArt