/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          ArztDatenbank.dez                               */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2014-12-06 15:06                                */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Select database                                                        */
/* ---------------------------------------------------------------------- */
use ArztDB;

/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */
IF OBJECT_ID (N'[Ort_Arzt]', N'F') IS NOT NULL
    ALTER TABLE [Arzt] DROP CONSTRAINT [Ort_Arzt]
GO

IF OBJECT_ID (N'[Arzt_Konsultation]', N'F') IS NOT NULL
    ALTER TABLE [Konsultation] DROP CONSTRAINT [Arzt_Konsultation]
GO


IF OBJECT_ID (N'[Patient_Konsultation]', N'F') IS NOT NULL
    ALTER TABLE [Konsultation] DROP CONSTRAINT [Patient_Konsultation]
GO

IF OBJECT_ID (N'[Diagnose_Konsultation]', N'F') IS NOT NULL
    ALTER TABLE [Konsultation] DROP CONSTRAINT [Diagnose_Konsultation]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Konsultation"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
IF OBJECT_ID (N'[PK_Konsultation]', N'PK') IS NOT NULL
    ALTER TABLE [Konsultation] DROP CONSTRAINT [PK_Konsultation]
GO


/* Drop table */
IF OBJECT_ID (N'[Konsultation]', N'U') IS NOT NULL
    DROP TABLE [Konsultation]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Diagnose"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
IF OBJECT_ID (N'[PK_Diagnose]', N'PK') IS NOT NULL
    ALTER TABLE [Diagnose] DROP CONSTRAINT [PK_Diagnose]
GO


/* Drop table */
IF OBJECT_ID (N'[Diagnose]', N'U') IS NOT NULL
    DROP TABLE [Diagnose]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Patient"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

IF OBJECT_ID (N'[PK_Patient]', N'PK') IS NOT NULL
    ALTER TABLE [Patient] DROP CONSTRAINT [PK_Patient]
GO


/* Drop table */
IF OBJECT_ID (N'[Patient]', N'U') IS NOT NULL
    DROP TABLE [Patient]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Arzt"                                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
IF OBJECT_ID (N'[PK_Arzt]', N'PK') IS NOT NULL
    ALTER TABLE [Arzt] DROP CONSTRAINT [PK_Arzt]
GO


/* Drop table */
IF OBJECT_ID (N'[Arzt]', N'U') IS NOT NULL
    DROP TABLE [Arzt]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Ort"                                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
IF OBJECT_ID (N'[PK_Ort]', N'PK') IS NOT NULL
    ALTER TABLE [Ort] DROP CONSTRAINT [PK_Ort]
GO


/* Drop table */
IF OBJECT_ID (N'[Ort]', N'U') IS NOT NULL
    DROP TABLE [Ort]
GO

