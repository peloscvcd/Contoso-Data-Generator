IF EXISTS (SELECT name FROM sys.databases WHERE name = N'#DATABASE_NAME#')
    DROP DATABASE [#DATABASE_NAME#]
GO

CREATE DATABASE [#DATABASE_NAME#]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'#DATABASE_NAME#', FILENAME = N'#SQLDATA_FOLDER#\#DATABASE_NAME#.mdf' , SIZE = 5120KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'#DATABASE_NAME#_log', FILENAME = N'#SQLDATA_FOLDER#\#DATABASE_NAME#_log.ldf' , SIZE = 2048KB , FILEGROWTH = 2048KB )
GO
ALTER DATABASE [#DATABASE_NAME#] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [#DATABASE_NAME#] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET ARITHABORT OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [#DATABASE_NAME#] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [#DATABASE_NAME#] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [#DATABASE_NAME#] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET  DISABLE_BROKER 
GO
ALTER DATABASE [#DATABASE_NAME#] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [#DATABASE_NAME#] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [#DATABASE_NAME#] SET  READ_WRITE 
GO
ALTER DATABASE [#DATABASE_NAME#] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [#DATABASE_NAME#] SET  MULTI_USER 
GO
ALTER DATABASE [#DATABASE_NAME#] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [#DATABASE_NAME#] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [#DATABASE_NAME#] SET DELAYED_DURABILITY = DISABLED 
GO
USE [#DATABASE_NAME#]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [#DATABASE_NAME#]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [#DATABASE_NAME#] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
