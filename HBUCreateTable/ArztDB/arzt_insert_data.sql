/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          ArztDatenbank.dez                               */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2014-12-06 15:06                                */
/* ---------------------------------------------------------------------- */

-- Tabelle Ort
insert into [Ort] ([PLZ], [ORT])
	values  (8032, 'Zürich'),
	        (3003, 'Bern'),
	        (8000, 'Zürich'),
	        (1000, 'Lausanne');

-- Tabelle [Arzt]
insert into [Arzt] ([ArztNr], [ArztName], [OrtNr])
	values  (50001, 'Hans', 1),
            (38494, 'Otto', 2),
            (22978, 'Hyde', 3),
            (61123, 'Hektor', 4);


-- Tabelle Patient
insert into [Patient] ([PatientNr], [PatientName])
	values  (1234, 'Monika'),
	        (0815, 'Anatol'),
            (1112, 'Fabian'),
            (4711, 'Bruno'),
            (0007, 'James');

-- Tabelle Patient
insert into [Diagnose] ([DiagnoseName])
	values  ('Röteln'),
	        ('Masern'),
	        ('Angina'),
	        ('Beinbruch'),
	        ('Grippe'),
	        ('Alzheimer');

-- Tabelle [Konsultation]
insert into [Konsultation] ([PatientNr], [ArztNr], [DiagnoseNr], [Datum])
	values  (1234, 50001, 1, convert(datetime, '1997.04.15', 102)),
            (0815, 50001, 2, convert(datetime, '1997.04.17', 102)),
            (1112, 50001, 3, convert(datetime, '1997.04.19', 102)),
            (4711, 38494, 4, convert(datetime, '1997.04.22', 102)),
            (0815, 38494, 5, convert(datetime, '1997.08.30', 102)),
            (1234, 22978, 1, convert(datetime, '1997.05.21', 102)),
            (0007, 22978, 6, convert(datetime, '1997.06.05', 102)),
            (0007, 61123, 6, convert(datetime, '1997.07.02', 102)),
            (1234, 61123, 3, convert(datetime, '1997.09.30', 102));
					