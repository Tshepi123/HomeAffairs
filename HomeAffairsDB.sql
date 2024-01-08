Use master

	IF EXISTS(SELECT name FROM master.dbo.sysdatabases
			  WHERE name = 'HomeAffairs_DB')
	BEGIN
		DROP DATABASE HomeAffairs_DB
		PRINT 'The database has been deleted'
	END

	CREATE DATABASE HomeAffairs_DB
	ON Primary
		(NAME = 'HomeAffairs_DB_Data',
		 FILENAME = 'C:\homeAff\HomeAffairs_DB_data.mdf',
		 SIZE = 5MB,
		 FILEGROWTH = 10%)

	LOG ON
		(NAME = 'HomeAffairs_DB_Log',
		 FILENAME = 'C:\homeAff\HomeAffairs_DB_Log.ldf',
		 SIZE = 5MB,
		 FILEGROWTH = 10%)
GO

USE HomeAffairs_DB
GO

CREATE TABLE registration (
	id INT IDENTITY(1, 1) NOT NULL,
	name VARCHAR(50),
	surname VARCHAR(50),							
	middleName VARCHAR(50),	
	birthDate VARCHAR(50),	
	tel VARCHAR(50),	
	address VARCHAR(50),	
	email VARCHAR(50),	
	ethnicity VARCHAR(50),	
	gender VARCHAR(50),	
	idPhoto VARCHAR(50),		
	PRIMARY KEY(id), 
) 
GO

PRINT 'The registration table has been created'
GO


