/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          Teilestruktur.dez                               */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2015-01-30 15:20                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Teile"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Teile] (
    [TNr] INTEGER NOT NULL,
    [Me] VARCHAR(10),
    [Bezeichnung] VARCHAR(50),
    [Typ] VARCHAR(50),
    [Herstellkosten] FLOAT,
    [Einkaufspreis] FLOAT,
    [Mindestbestand] INTEGER,
    [Bestand] INTEGER,
    [Lieferzeit] INTEGER,
    [Herstelldauer] INTEGER,
    [Gewicht] INTEGER,
    [Reserviert] INTEGER,
    [Verfügbar] INTEGER,
    [Zeitstempel] DATETIME CONSTRAINT [DEF_Teile_Zeitstempel] DEFAULT getdate(),
    CONSTRAINT [PK_Teile] PRIMARY KEY ([TNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Struktur"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Struktur] (
    [OTeil] INTEGER NOT NULL,
    [UTeil] INTEGER NOT NULL,
    [Position] INTEGER NOT NULL,
    [Menge] INTEGER NOT NULL,
    [Ausschuss] INTEGER,
    [Arbeitsgang] INTEGER,
    [Zeitstempel] DATETIME CONSTRAINT [DEF_Struktur_Zeitstempel] DEFAULT getdate(),
    CONSTRAINT [PK_Struktur] PRIMARY KEY ([OTeil], [UTeil], [Position])
)
GO


/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [Struktur] ADD CONSTRAINT [Teile_Struktur] 
    FOREIGN KEY ([UTeil]) REFERENCES [Teile] ([TNr])
GO


ALTER TABLE [Struktur] ADD CONSTRAINT [Teile_Struktur_OTEIL] 
    FOREIGN KEY ([OTeil]) REFERENCES [Teile] ([TNr])
GO

