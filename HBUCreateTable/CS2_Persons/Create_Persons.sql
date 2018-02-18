CREATE TABLE Adresse (
  idAdresse INTEGER  NOT NULL   IDENTITY ,
  PLZ INTEGER    ,
  Ort VARCHAR(20)      ,
PRIMARY KEY(idAdresse));
GO




CREATE TABLE Persons (
  idPerson INTEGER  NOT NULL   IDENTITY ,
  Adresse_idAdresse INTEGER  NOT NULL  ,
  Name VARCHAR(20)    ,
  Vorname VARCHAR(20)    ,
  Strasse VARCHAR(50)    ,
  Telefon VARCHAR(20)      ,
PRIMARY KEY(idPerson),
  FOREIGN KEY(Adresse_idAdresse)
    REFERENCES Adresse(idAdresse));
GO


CREATE INDEX IFK_Rel_01 ON Persons (Adresse_idAdresse);
GO



