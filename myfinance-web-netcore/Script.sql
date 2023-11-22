USE [master]
GO
/****** Object:  Database [myfinanceweb]    Script Date: 21/11/2023 21:27:50 ******/
CREATE DATABASE [myfinanceweb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myfinanceweb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\myfinanceweb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myfinanceweb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\myfinanceweb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [myfinanceweb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myfinanceweb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myfinanceweb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myfinanceweb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myfinanceweb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myfinanceweb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myfinanceweb] SET ARITHABORT OFF 
GO
ALTER DATABASE [myfinanceweb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [myfinanceweb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myfinanceweb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myfinanceweb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myfinanceweb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myfinanceweb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myfinanceweb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myfinanceweb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myfinanceweb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myfinanceweb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [myfinanceweb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myfinanceweb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myfinanceweb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myfinanceweb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myfinanceweb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myfinanceweb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myfinanceweb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myfinanceweb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [myfinanceweb] SET  MULTI_USER 
GO
ALTER DATABASE [myfinanceweb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myfinanceweb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myfinanceweb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myfinanceweb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myfinanceweb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [myfinanceweb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [myfinanceweb] SET QUERY_STORE = ON
GO
ALTER DATABASE [myfinanceweb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [myfinanceweb]
GO
/****** Object:  Table [dbo].[planoconta]    Script Date: 21/11/2023 21:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planoconta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[tipo] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transacao]    Script Date: 21/11/2023 21:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historico] [varchar](50) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[valor] [decimal](9, 2) NOT NULL,
	[planocontaid] [int] NOT NULL,
	[data] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[transacao]  WITH CHECK ADD FOREIGN KEY([planocontaid])
REFERENCES [dbo].[planoconta] ([id])
GO
USE [master]
GO
ALTER DATABASE [myfinanceweb] SET  READ_WRITE 
GO
