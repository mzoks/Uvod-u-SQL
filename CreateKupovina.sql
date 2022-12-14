-- Kreiranje baze
USE master
GO
CREATE DATABASE KupovinaT ON  PRIMARY 
( NAME = N'KupovinaT', FILENAME = N'C:\Baze\Privremene\KupovinaT\KupovinaT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KupovinaT_log', FILENAME = N'C:\Baze\Privremene\KupovinaT\KupovinaT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Serbian_Latin_100_CI_AS
GO
USE KupovinaT
GO

-- Kreiranje tabele JedinicaMjere
CREATE TABLE JedinicaMjere(
	JM nvarchar(10) COLLATE Serbian_Latin_100_CI_AS NOT NULL,
	Naziv nvarchar(200) COLLATE Serbian_Latin_100_CI_AS NOT NULL,
 CONSTRAINT PK_JedinicaMjere PRIMARY KEY CLUSTERED 
(
	JM ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Kreiranje tabele Spisak

CREATE TABLE Spisak(
	RedniBroj int IDENTITY(1,1) NOT NULL,
	Naziv nvarchar(50) COLLATE Serbian_Latin_100_CI_AS NOT NULL,
	JM nvarchar(10) COLLATE Serbian_Latin_100_CI_AS NOT NULL,
	Kolicina numeric(18, 2) NOT NULL,
	Napomena nvarchar(200) COLLATE Serbian_Latin_100_CI_AS NULL,
 CONSTRAINT PK_Spisak PRIMARY KEY CLUSTERED 
(
	RedniBroj ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Punjenje tablele JedinicaMjere
INSERT JedinicaMjere (JM, Naziv) VALUES (N'g', N'gram')
INSERT JedinicaMjere (JM, Naziv) VALUES (N'Kom', N'Komad')
GO

-- Punjenje tablele Spisak
SET IDENTITY_INSERT Spisak ON 

INSERT Spisak (RedniBroj, Naziv, JM, Kolicina, Napomena) VALUES (1, N'Kifla', N'Kom', CAST(1.00 AS Numeric(18, 2)), NULL)
INSERT Spisak (RedniBroj, Naziv, JM, Kolicina, Napomena) VALUES (2, N'Pileći batak', N'Kom', CAST(1.00 AS Numeric(18, 2)), N'Pečen')
INSERT Spisak (RedniBroj, Naziv, JM, Kolicina, Napomena) VALUES (3, N'Riža', N'g', CAST(250.00 AS Numeric(18, 2)), N'Sa povrćem')
INSERT Spisak (RedniBroj, Naziv, JM, Kolicina, Napomena) VALUES (4, N'Jabuka', N'Kom', CAST(1.00 AS Numeric(18, 2)), N'Srednje')
SET IDENTITY_INSERT Spisak OFF
GO
ALTER TABLE Spisak  WITH CHECK ADD  CONSTRAINT FK_Spisak_JedinicaMjere FOREIGN KEY(JM)
REFERENCES JedinicaMjere (JM)
GO
ALTER TABLE Spisak CHECK CONSTRAINT FK_Spisak_JedinicaMjere
GO

