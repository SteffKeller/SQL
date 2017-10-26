/*    ==Skriptparameter==

    Quellserverversion : SQL Server 2016 (13.0.4001)
    Edition des Quelldatenbankmoduls : Microsoft SQL Server Express Edition
    Typ des Quelldatenbankmoduls : Eigenständige SQL Server-Instanz

    Zielserverversion : SQL Server 2016
    Edition des Zieldatenbankmoduls : Microsoft SQL Server Express Edition
    Typ des Zieldatenbankmoduls : Eigenständige SQL Server-Instanz
*/

USE [Abo]
GO

/****** Object:  User [AboAdmin]    Script Date: 26.10.2017 20:20:24 ******/
CREATE USER [AboAdmin] FOR LOGIN [AboAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE LOGIN [AboAdmin] WITH PASSWORD=N'QEcqRrvD4YhARaJoI4T4O1IctTlLWHGDu4mzD/v8Z8Q=', DEFAULT_DATABASE=[Abo], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [AboAdmin] DISABLE
GO

