USE master;
GO
---CREATE DATABASE WITH DEFAULT FILEGROUPS AND PATHS------------
CREATE DATABASE V_Pereviazko_module_2
GO

---OR CREATE DATABASE WITH PARTIAL SETTINGS AND LOG FILE-----------
CREATE DATABASE V_Pereviazko_module_2
ON PRIMARY
  ( NAME='V_Pereviazko_module_2_Primary',
    FILENAME=
       'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\data\V_Pereviazko_module_2_Prm.mdf',
    SIZE=6MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
FILEGROUP V_Pereviazko_module_2_FG1
  ( NAME = 'V_Pereviazko_module_2_FG1_Dat1',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\data\V_Pereviazko_module_2_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'V_Pereviazko_module_2_FG1_Dat2',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\data\V_Pereviazko_module_2_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
LOG ON
  ( NAME = 'V_Pereviazko_module_2_log',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\data\V_Pereviazko_module_2.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB);
	GO
	
