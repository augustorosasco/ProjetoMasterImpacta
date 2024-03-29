--Emilio Celso de Souza
use master;
go

--IF EXISTS(SELECT * FROM sys.databases WHERE NAME='DB_EVENTOS') DROP DATABASE DB_EVENTOS
--GO

IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME='DB_EVENTOS')
BEGIN
CREATE DATABASE DB_EVENTOS
ON
(
	NAME = DB_EVENTOS_DAT,
	FILENAME= N'C:\Users\emilio\Documents\Sinqia_AspNet\Data\DbEventos.mdf',
	SIZE = 5000KB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=1000KB
)
LOG ON 
(
	NAME = DB_EVENTOS_LOG,
	FILENAME= N'C:\Users\emilio\Documents\Sinqia_AspNet\Data\DbEventos_log.ldf',
	SIZE = 2000KB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=1000KB
);

END;
GO