/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          ArztDatenbank.dez                               */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2014-12-06 15:06                                */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Select database                                                        */
/* ---------------------------------------------------------------------- */
use ArztDB;

/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Ort"                                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Ort] (
    [OrtNr] INTEGER IDENTITY(1,1) NOT NULL,
    [PLZ] INTEGER,
    [Ort] VARCHAR(60),
    CONSTRAINT [PK_Ort] PRIMARY KEY ([OrtNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Arzt"                                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Arzt] (
    [ArztNr] INTEGER NOT NULL,
    [ArztName] VARCHAR(60),
    [OrtNr] INTEGER NOT NULL,
    CONSTRAINT [PK_Arzt] PRIMARY KEY ([ArztNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Patient"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Patient] (
    [PatientNr] INTEGER NOT NULL,
    [PatientName] VARCHAR(40),
    CONSTRAINT [PK_Patient] PRIMARY KEY ([PatientNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Diagnose"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Diagnose] (
    [DiagnoseNr] INTEGER    IDENTITY(1,1) NOT NULL,
    [DiagnoseName] VARCHAR(60),
    CONSTRAINT [PK_Diagnose] PRIMARY KEY ([DiagnoseNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Konsultation"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Konsultation] (
    [KonsultationNr] INTEGER IDENTITY(1,1)  NOT NULL,
    [ArztNr] INTEGER NOT NULL,
    [PatientNr] INTEGER NOT NULL,
    [DiagnoseNr] INTEGER NOT NULL,
    [Datum] DATE,
    CONSTRAINT [PK_Konsultation] PRIMARY KEY ([KonsultationNr])
)
GO


/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [Arzt] ADD CONSTRAINT [Ort_Arzt] 
    FOREIGN KEY ([OrtNr]) REFERENCES [Ort] ([OrtNr])
GO

ALTER TABLE [Konsultation] ADD CONSTRAINT [Arzt_Konsultation] 
    FOREIGN KEY ([ArztNr]) REFERENCES [Arzt] ([ArztNr])
GO

ALTER TABLE [Konsultation] ADD CONSTRAINT [Patient_Konsultation] 
    FOREIGN KEY ([PatientNr]) REFERENCES [Patient] ([PatientNr])
GO

ALTER TABLE [Konsultation] ADD CONSTRAINT [Diagnose_Konsultation] 
    FOREIGN KEY ([DiagnoseNr]) REFERENCES [Diagnose] ([DiagnoseNr])
GO

