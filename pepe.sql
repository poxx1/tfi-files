USE [master]
GO
/****** Object:  Database [tfi]    Script Date: 12/5/2023 9:53:57 PM ******/
CREATE DATABASE [tfi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tfi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tfi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tfi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tfi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tfi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tfi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tfi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tfi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tfi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tfi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tfi] SET ARITHABORT OFF 
GO
ALTER DATABASE [tfi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tfi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tfi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tfi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tfi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tfi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tfi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tfi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tfi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tfi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tfi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tfi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tfi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tfi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tfi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tfi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tfi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tfi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tfi] SET  MULTI_USER 
GO
ALTER DATABASE [tfi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tfi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tfi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tfi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tfi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tfi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tfi] SET QUERY_STORE = ON
GO
ALTER DATABASE [tfi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tfi]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Time] [nvarchar](50) NOT NULL,
	[Info] [nvarchar](50) NOT NULL,
	[Priority] [nvarchar](50) NOT NULL,
	[Activity] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Precio] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[dvv] [nvarchar](max) NOT NULL,
	[tablename] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interpretaciones]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interpretaciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[ID_user] [int] NOT NULL,
	[Aprobada] [bit] NOT NULL,
	[Fecha] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Name] [nvarchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Permission] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission_Permission]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Permission](
	[ID_Permission_Father] [int] NOT NULL,
	[ID_Permission_Child] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Permission]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Permission](
	[ID_User] [int] NOT NULL,
	[ID_Permission] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2023 9:53:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Nickname] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[dvh] [nvarchar](max) NOT NULL,
	[Language_Id] [int] NOT NULL,
	[Tries] [int] NOT NULL,
	[Blocked] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1013, N'admin', N'10/02/23', N'21:53:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1014, N'admin', N'10/02/23', N'21:54:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1015, N'admin', N'10/02/23', N'21:54:18', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1016, N'julian', N'10/02/23', N'21:57:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1017, N'julian', N'10/02/23', N'21:57:44', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1020, N'admin', N'10/02/23', N'23:23:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1021, N'admin', N'10/02/23', N'23:24:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1022, N'julian', N'10/02/23', N'23:25:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1023, N'julian', N'10/02/23', N'23:25:31', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1024, N'admin', N'10/02/23', N'23:35:05', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1025, N'admin', N'10/02/23', N'23:35:07', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1028, N'admin', N'10/02/23', N'23:49:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1030, N'admin', N'10/03/23', N'01:22:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1031, N'admin', N'10/03/23', N'01:24:13', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1032, N'admin', N'10/03/23', N'01:26:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1033, N'admin', N'10/03/23', N'01:27:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1034, N'admin', N'10/03/23', N'01:28:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1035, N'davidg', N'10/03/23', N'01:28:38', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1036, N'admin', N'10/03/23', N'01:29:07', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1038, N'admin', N'10/03/23', N'01:40:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1039, N'admin', N'10/03/23', N'01:48:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1040, N'admin', N'10/03/23', N'01:52:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1041, N'admin', N'10/03/23', N'01:52:31', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1049, N'admin', N'10/03/23', N'02:10:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1054, N'admin', N'10/03/23', N'02:18:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1058, N'admin', N'10/03/23', N'02:29:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1064, N'admin', N'10/03/23', N'02:44:06', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2013, N'admin', N'10/03/23', N'11:34:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2014, N'admin', N'10/03/23', N'11:38:08', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2015, N'admin', N'10/03/23', N'11:41:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2016, N'admin', N'10/03/23', N'11:43:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2018, N'admin', N'10/03/23', N'11:53:05', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1018, N'julian', N'10/02/23', N'23:07:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1019, N'julian', N'10/02/23', N'23:07:16', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1026, N'admin', N'10/02/23', N'23:45:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1027, N'admin', N'10/02/23', N'23:46:05', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1029, N'davidg', N'10/02/23', N'23:51:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1037, N'admin', N'10/03/23', N'01:31:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1042, N'julian', N'10/03/23', N'01:53:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1043, N'julian', N'10/03/23', N'01:53:26', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1044, N'admin', N'10/03/23', N'01:54:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1045, N'admin', N'10/03/23', N'01:55:52', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1046, N'admin', N'10/03/23', N'01:59:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1047, N'julian', N'10/03/23', N'02:01:08', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1048, N'admin', N'10/03/23', N'02:07:18', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1050, N'admin', N'10/03/23', N'02:11:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1051, N'admin', N'10/03/23', N'02:14:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1052, N'admin', N'10/03/23', N'02:15:54', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1053, N'admin', N'10/03/23', N'02:17:01', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1055, N'admin', N'10/03/23', N'02:21:12', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1056, N'admin', N'10/03/23', N'02:21:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1057, N'admin', N'10/03/23', N'02:22:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1059, N'admin', N'10/03/23', N'02:31:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1060, N'admin', N'10/03/23', N'02:34:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1061, N'admin', N'10/03/23', N'02:37:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1062, N'admin', N'10/03/23', N'02:39:38', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1063, N'admin', N'10/03/23', N'02:43:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (1065, N'admin', N'10/03/23', N'03:02:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2017, N'admin', N'10/03/23', N'11:50:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2019, N'admin', N'10/03/23', N'22:00:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2020, N'admin', N'10/03/23', N'22:34:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2021, N'admin', N'10/03/23', N'22:35:56', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2022, N'julian', N'10/03/23', N'23:05:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2023, N'admin', N'10/03/23', N'23:15:43', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2027, N'admin', N'10/03/23', N'23:50:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2028, N'admin', N'10/03/23', N'23:57:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2029, N'admin', N'10/04/23', N'00:00:13', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2030, N'admin', N'10/04/23', N'00:11:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2031, N'admin', N'10/04/23', N'00:12:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2032, N'admin', N'10/04/23', N'00:13:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2034, N'admin', N'10/04/23', N'00:56:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2035, N'admin', N'10/04/23', N'00:58:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2036, N'admin', N'10/04/23', N'00:58:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2037, N'admin', N'10/04/23', N'00:58:38', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2038, N'admin', N'10/04/23', N'00:58:38', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2040, N'admin', N'10/04/23', N'01:42:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2042, N'admin', N'10/04/23', N'01:54:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2043, N'admin', N'10/04/23', N'01:57:28', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2046, N'admin', N'10/04/23', N'03:52:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2047, N'admin', N'10/04/23', N'03:56:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2048, N'admin', N'10/04/23', N'04:01:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2049, N'admin', N'10/04/23', N'04:08:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2050, N'admin', N'10/04/23', N'04:12:52', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2052, N'admin', N'10/04/23', N'04:21:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2054, N'admin', N'10/04/23', N'04:27:25', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2055, N'admin', N'10/04/23', N'04:32:36', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2056, N'admin', N'10/04/23', N'04:34:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2057, N'admin', N'10/04/23', N'04:37:12', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2058, N'admin', N'10/04/23', N'04:38:34', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2059, N'admin', N'10/04/23', N'04:40:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2060, N'admin', N'10/04/23', N'04:42:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2061, N'admin', N'10/04/23', N'04:42:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2062, N'admin', N'10/04/23', N'05:08:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2063, N'admin', N'10/04/23', N'05:10:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2064, N'admin', N'10/04/23', N'05:13:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2065, N'davidg', N'10/04/23', N'05:15:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2066, N'davidg', N'10/04/23', N'05:20:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2083, N'admin', N'10/04/23', N'07:26:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2084, N'admin', N'10/04/23', N'07:31:04', N'El usuario  se logueo.', N'Baja', N'Login')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2085, N'admin', N'10/04/23', N'07:32:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2086, N'admin', N'10/04/23', N'07:33:20', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2087, N'admin', N'10/04/23', N'07:33:25', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2090, N'admin', N'10/04/23', N'14:47:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2091, N'admin', N'10/04/23', N'14:49:17', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2092, N'davidg', N'10/04/23', N'14:49:21', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2094, N'admin', N'10/04/23', N'15:03:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2095, N'admin', N'10/04/23', N'15:13:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2096, N'admin', N'10/04/23', N'15:14:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2101, N'admin', N'10/04/23', N'15:32:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2102, N'admin', N'10/04/23', N'15:33:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2103, N'admin', N'10/04/23', N'15:39:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2104, N'admin', N'10/04/23', N'15:39:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2105, N'admin', N'10/04/23', N'15:42:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2106, N'admin', N'10/04/23', N'15:43:06', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2107, N'admin', N'10/04/23', N'15:43:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2108, N'admin', N'10/04/23', N'15:45:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2110, N'admin', N'10/04/23', N'16:03:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2111, N'admin', N'10/04/23', N'16:05:54', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2024, N'admin', N'10/03/23', N'23:44:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2033, N'admin', N'10/04/23', N'00:38:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2039, N'admin', N'10/04/23', N'01:39:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2041, N'admin', N'10/04/23', N'01:43:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2044, N'admin', N'10/04/23', N'03:24:21', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2067, N'davidg', N'10/04/23', N'06:51:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2068, N'admin', N'10/04/23', N'07:02:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2069, N'admin', N'10/04/23', N'07:04:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2070, N'davidg', N'10/04/23', N'07:05:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2071, N'davidg', N'10/04/23', N'07:05:12', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2072, N'admin', N'10/04/23', N'07:05:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2073, N'admin', N'10/04/23', N'07:06:59', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2074, N'davidg', N'10/04/23', N'07:10:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2075, N'davidg', N'10/04/23', N'07:11:00', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2077, N'admin', N'10/04/23', N'07:22:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2078, N'admin', N'10/04/23', N'07:23:58', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2079, N'admin', N'10/04/23', N'07:24:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2080, N'admin', N'10/04/23', N'07:25:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2081, N'admin', N'10/04/23', N'07:25:28', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2082, N'davidg', N'10/04/23', N'07:25:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2088, N'admin', N'10/04/23', N'14:30:01', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2093, N'admin', N'10/04/23', N'14:55:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2112, N'admin', N'10/04/23', N'16:14:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2114, N'admin', N'10/04/23', N'18:40:34', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2115, N'admin', N'10/04/23', N'19:17:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2116, N'admin', N'10/04/23', N'19:18:34', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2117, N'admin', N'10/04/23', N'19:18:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2118, N'admin', N'10/04/23', N'19:31:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2119, N'admin', N'10/04/23', N'19:34:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2120, N'admin', N'10/04/23', N'19:36:07', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2121, N'admin', N'10/04/23', N'19:37:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2122, N'admin', N'10/04/23', N'19:39:11', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2123, N'admin', N'10/04/23', N'19:40:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2128, N'admin', N'10/04/23', N'19:51:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2129, N'admin', N'10/04/23', N'19:53:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2130, N'admin', N'10/04/23', N'19:56:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2131, N'admin', N'10/04/23', N'19:57:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2132, N'admin', N'10/04/23', N'19:58:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2135, N'admin', N'10/04/23', N'20:12:28', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2136, N'davidg', N'10/04/23', N'20:12:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2137, N'davidg', N'10/04/23', N'20:12:57', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2138, N'admin', N'10/04/23', N'20:13:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2139, N'admin', N'10/08/23', N'00:34:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2143, N'admin', N'10/08/23', N'00:53:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2144, N'admin', N'10/08/23', N'00:56:58', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2145, N'admin', N'10/08/23', N'00:58:36', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2146, N'admin', N'10/08/23', N'01:02:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2147, N'admin', N'10/08/23', N'01:11:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2148, N'admin', N'10/08/23', N'01:15:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2153, N'admin', N'10/13/23', N'00:05:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2154, N'admin', N'10/13/23', N'00:07:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2155, N'admin', N'10/13/23', N'00:20:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2156, N'admin', N'10/13/23', N'00:48:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2157, N'admin', N'10/18/23', N'19:18:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2160, N'admin', N'11/14/23', N'20:16:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2163, N'admin', N'11/14/23', N'21:32:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2167, N'admin', N'11/14/23', N'22:27:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2168, N'admin', N'11/14/23', N'22:27:43', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2173, N'admin', N'11/14/23', N'23:34:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2025, N'admin', N'10/03/23', N'23:47:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2026, N'admin', N'10/03/23', N'23:50:13', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2045, N'admin', N'10/04/23', N'03:50:07', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2051, N'admin', N'10/04/23', N'04:17:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2053, N'admin', N'10/04/23', N'04:24:58', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2076, N'admin', N'10/04/23', N'07:19:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2089, N'admin', N'10/04/23', N'14:43:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2097, N'julian', N'10/04/23', N'15:19:08', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2098, N'admin', N'10/04/23', N'15:20:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2099, N'admin', N'10/04/23', N'15:23:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2100, N'admin', N'10/04/23', N'15:29:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2109, N'admin', N'10/04/23', N'16:01:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2124, N'admin', N'10/04/23', N'19:41:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2125, N'admin', N'10/04/23', N'19:43:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2140, N'admin', N'10/08/23', N'00:39:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2141, N'admin', N'10/08/23', N'00:49:01', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2142, N'admin', N'10/08/23', N'00:49:01', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2149, N'admin', N'10/08/23', N'01:18:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2150, N'admin', N'10/08/23', N'01:23:34', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2161, N'admin', N'11/14/23', N'21:30:07', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2162, N'admin', N'11/14/23', N'21:30:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2164, N'admin', N'11/14/23', N'21:38:53', N'El usuario  se logueo.', N'Baja', N'Login')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2174, N'admin', N'11/14/23', N'23:36:16', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2175, N'admin', N'11/14/23', N'23:37:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2176, N'admin', N'11/14/23', N'23:37:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2177, N'admin', N'11/14/23', N'23:37:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2178, N'admin', N'11/14/23', N'23:39:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2179, N'admin', N'11/14/23', N'23:40:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2180, N'admin', N'11/14/23', N'23:44:12', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2181, N'admin', N'11/14/23', N'23:45:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2182, N'admin', N'11/15/23', N'00:22:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2183, N'admin', N'11/15/23', N'00:22:21', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2186, N'admin', N'11/15/23', N'00:50:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2188, N'admin', N'11/15/23', N'00:52:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2191, N'admin', N'11/15/23', N'11:07:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2192, N'admin', N'11/15/23', N'16:48:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2194, N'julian', N'11/15/23', N'17:11:27', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2195, N'julian', N'11/15/23', N'17:11:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2196, N'julian', N'11/15/23', N'17:11:42', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2197, N'julian', N'11/15/23', N'17:27:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2206, N'julian', N'11/15/23', N'19:29:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2208, N'julian', N'11/26/23', N'13:49:28', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2209, N'julian', N'11/26/23', N'13:49:34', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2210, N'julian', N'11/26/23', N'13:49:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2211, N'julian', N'11/26/23', N'13:49:45', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2212, N'julian', N'11/26/23', N'13:51:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2213, N'julian', N'11/26/23', N'13:51:48', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2214, N'julian', N'11/26/23', N'13:51:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2215, N'julian', N'11/26/23', N'13:52:12', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2216, N'julian', N'11/26/23', N'13:52:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2217, N'julian', N'11/26/23', N'13:52:33', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2219, N'admin', N'11/26/23', N'20:39:03', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2222, N'admin', N'11/26/23', N'20:46:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2223, N'admin', N'11/26/23', N'21:10:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2231, N'admin', N'11/27/23', N'00:54:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2232, N'admin', N'11/27/23', N'01:21:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2233, N'admin', N'11/27/23', N'01:26:03', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2234, N'admin', N'11/27/23', N'01:28:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2113, N'admin', N'10/04/23', N'18:35:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2126, N'admin', N'10/04/23', N'19:48:12', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2127, N'admin', N'10/04/23', N'19:49:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2133, N'admin', N'10/04/23', N'20:01:05', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2134, N'admin', N'10/04/23', N'20:03:16', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2151, N'admin', N'10/12/23', N'23:41:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2152, N'admin', N'10/13/23', N'00:02:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2158, N'admin', N'10/18/23', N'19:37:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2159, N'admin', N'10/18/23', N'19:39:43', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2169, N'admin', N'11/14/23', N'22:38:08', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2170, N'admin', N'11/14/23', N'22:38:14', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2187, N'admin', N'11/15/23', N'00:51:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2198, N'julian', N'11/15/23', N'17:29:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2220, N'admin', N'11/26/23', N'20:42:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2221, N'julian', N'11/26/23', N'20:44:52', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2226, N'admin', N'11/26/23', N'23:00:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2235, N'admin', N'11/27/23', N'01:30:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2236, N'admin', N'11/27/23', N'01:32:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2239, N'admin', N'11/27/23', N'09:32:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2241, N'admin', N'11/27/23', N'10:13:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2242, N'admin', N'11/27/23', N'10:17:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2243, N'admin', N'11/27/23', N'10:21:48', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2244, N'admin', N'11/27/23', N'10:33:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2246, N'admin', N'11/27/23', N'10:35:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2247, N'admin', N'11/27/23', N'10:38:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2249, N'admin', N'11/27/23', N'10:47:16', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2253, N'admin', N'11/27/23', N'11:02:11', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2254, N'admin', N'11/27/23', N'11:03:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2257, N'admin', N'11/27/23', N'11:10:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2258, N'admin', N'11/27/23', N'11:18:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2262, N'admin', N'11/27/23', N'11:50:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2264, N'admin', N'11/27/23', N'12:09:28', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2269, N'admin', N'11/27/23', N'12:33:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2271, N'admin', N'11/27/23', N'12:41:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2272, N'admin', N'11/27/23', N'12:43:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2273, N'admin', N'11/27/23', N'13:22:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2281, N'admin', N'11/27/23', N'13:56:22', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2284, N'admin', N'11/27/23', N'14:11:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2292, N'admin', N'11/27/23', N'14:37:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2294, N'admin', N'11/27/23', N'17:15:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2295, N'admin', N'11/27/23', N'17:21:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2296, N'admin', N'11/27/23', N'17:23:52', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2299, N'admin', N'11/27/23', N'19:20:36', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2300, N'admin', N'11/27/23', N'19:39:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2301, N'admin', N'11/27/23', N'19:46:06', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2302, N'julian', N'11/27/23', N'22:48:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2303, N'julian', N'11/27/23', N'22:49:45', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2304, N'admin', N'11/27/23', N'22:49:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2305, N'admin', N'11/27/23', N'22:50:06', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2306, N'julian', N'11/27/23', N'22:50:11', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2315, N'admin', N'11/27/23', N'23:51:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2316, N'admin', N'11/28/23', N'00:05:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2320, N'admin', N'11/28/23', N'01:21:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2322, N'admin', N'11/28/23', N'16:23:58', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2323, N'admin', N'11/28/23', N'16:29:06', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2327, N'julian', N'11/29/23', N'03:35:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2328, N'admin', N'11/29/23', N'03:38:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2331, N'admin', N'11/29/23', N'03:56:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2332, N'admin', N'11/29/23', N'03:56:37', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2165, N'admin', N'11/14/23', N'22:12:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2166, N'admin', N'11/14/23', N'22:13:15', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2171, N'admin', N'11/14/23', N'23:25:12', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2172, N'admin', N'11/14/23', N'23:31:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2184, N'admin', N'11/15/23', N'00:49:27', N'El usuario  se logueo.', N'Baja', N'Login')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2185, N'admin', N'11/15/23', N'00:49:28', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2224, N'admin', N'11/26/23', N'22:56:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2225, N'admin', N'11/26/23', N'22:57:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2227, N'admin', N'11/26/23', N'23:02:42', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2228, N'admin', N'11/26/23', N'23:09:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2240, N'admin', N'11/27/23', N'09:36:54', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2250, N'admin', N'11/27/23', N'10:54:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2251, N'admin', N'11/27/23', N'10:56:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2288, N'admin', N'11/27/23', N'14:22:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2289, N'admin', N'11/27/23', N'14:24:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2290, N'admin', N'11/27/23', N'14:30:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2329, N'admin', N'11/29/23', N'03:55:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2330, N'admin', N'11/29/23', N'03:56:27', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2333, N'julian', N'11/29/23', N'03:56:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2334, N'admin', N'11/29/23', N'04:03:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2335, N'admin', N'11/29/23', N'04:06:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2337, N'admin', N'11/29/23', N'04:12:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2338, N'admin', N'11/29/23', N'04:13:50', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2339, N'davidg', N'11/29/23', N'04:13:54', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2340, N'davidg', N'11/29/23', N'04:14:23', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2341, N'admin', N'11/29/23', N'04:14:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2342, N'admin', N'11/29/23', N'04:20:04', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2343, N'admin', N'11/29/23', N'04:37:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2347, N'admin', N'11/29/23', N'04:45:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2348, N'admin', N'11/29/23', N'04:47:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2349, N'admin', N'11/29/23', N'04:49:10', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2350, N'admin', N'11/29/23', N'05:13:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2351, N'admin', N'11/29/23', N'05:13:55', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2352, N'admin', N'11/29/23', N'05:14:01', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2353, N'admin', N'11/29/23', N'05:30:34', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2354, N'admin', N'11/29/23', N'05:32:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2355, N'admin', N'11/29/23', N'05:34:43', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2356, N'admin', N'11/29/23', N'05:35:24', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2357, N'admin', N'11/29/23', N'05:40:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2358, N'admin', N'11/29/23', N'05:47:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2359, N'admin', N'11/29/23', N'05:50:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2360, N'admin', N'11/29/23', N'05:50:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2361, N'admin', N'11/29/23', N'05:55:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2362, N'admin', N'11/29/23', N'05:56:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2363, N'admin', N'11/29/23', N'05:58:58', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2364, N'admin', N'11/29/23', N'06:04:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2365, N'admin', N'11/29/23', N'06:06:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2366, N'admin', N'11/29/23', N'06:09:13', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2367, N'admin', N'11/29/23', N'06:10:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2368, N'admin', N'11/29/23', N'06:11:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2369, N'admin', N'11/29/23', N'06:14:45', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2370, N'admin', N'11/29/23', N'06:16:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2371, N'admin', N'11/29/23', N'06:16:47', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2372, N'admin', N'11/29/23', N'06:17:44', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2374, N'admin', N'11/29/23', N'06:28:43', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2375, N'admin', N'11/29/23', N'06:32:01', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2376, N'admin', N'11/29/23', N'06:32:54', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2377, N'admin', N'11/29/23', N'06:49:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2189, N'admin', N'11/15/23', N'11:01:40', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2190, N'admin', N'11/15/23', N'11:03:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2378, N'admin', N'11/29/23', N'06:55:18', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2379, N'admin', N'11/29/23', N'06:55:33', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2380, N'admin', N'11/29/23', N'06:55:47', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2381, N'admin', N'11/29/23', N'06:58:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2382, N'admin', N'11/29/23', N'06:58:53', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2383, N'admin', N'11/29/23', N'06:59:04', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2384, N'admin', N'11/29/23', N'06:59:10', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2385, N'admin', N'11/29/23', N'07:01:52', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2388, N'admin', N'11/29/23', N'07:08:16', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2389, N'admin', N'11/29/23', N'07:08:36', N'El usuario  modifico una familia.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2390, N'admin', N'11/29/23', N'07:17:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2391, N'admin', N'11/29/23', N'07:21:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2392, N'admin', N'11/29/23', N'07:24:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2393, N'admin', N'11/29/23', N'07:26:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2394, N'admin', N'11/29/23', N'07:29:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2395, N'admin', N'11/29/23', N'07:30:26', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2396, N'admin', N'11/29/23', N'07:33:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2397, N'admin', N'11/29/23', N'07:33:30', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2398, N'admin', N'11/29/23', N'07:33:34', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2404, N'admin', N'11/29/23', N'07:38:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2405, N'admin', N'11/29/23', N'07:56:34', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2406, N'admin', N'11/29/23', N'08:04:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2407, N'admin', N'11/29/23', N'08:09:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2408, N'admin', N'11/29/23', N'08:12:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2412, N'admin', N'11/29/23', N'19:00:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2422, N'admin', N'12/05/23', N'15:19:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2423, N'admin', N'12/05/23', N'15:19:59', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2424, N'admin', N'12/05/23', N'15:27:42', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2193, N'julian', N'11/15/23', N'17:09:51', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2199, N'julian', N'11/15/23', N'17:30:15', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2200, N'admin', N'11/15/23', N'17:32:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2205, N'julian', N'11/15/23', N'19:13:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2207, N'julian', N'11/15/23', N'19:43:28', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2218, N'admin', N'11/26/23', N'14:20:41', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2255, N'admin', N'11/27/23', N'11:05:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2256, N'admin', N'11/27/23', N'11:07:37', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2263, N'admin', N'11/27/23', N'12:06:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2373, N'admin', N'11/29/23', N'06:26:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2201, N'admin', N'11/15/23', N'18:34:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2202, N'admin', N'11/15/23', N'18:35:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2203, N'admin', N'11/15/23', N'18:35:45', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2204, N'julian', N'11/15/23', N'18:35:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2230, N'admin', N'11/27/23', N'00:50:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2280, N'admin', N'11/27/23', N'13:53:13', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2297, N'admin', N'11/27/23', N'17:51:39', N'El usuario  se logueo.', N'Baja', N'Login')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2416, N'admin', N'12/05/23', N'11:18:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2421, N'admin', N'12/05/23', N'11:34:23', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2229, N'admin', N'11/27/23', N'00:47:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2248, N'admin', N'11/27/23', N'10:41:39', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2270, N'admin', N'11/27/23', N'12:34:38', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2278, N'admin', N'11/27/23', N'13:43:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2283, N'admin', N'11/27/23', N'14:08:13', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2298, N'admin', N'11/27/23', N'19:17:15', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2317, N'admin', N'11/28/23', N'00:57:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2414, N'admin', N'12/05/23', N'11:09:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2237, N'admin', N'11/27/23', N'02:39:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2238, N'admin', N'11/27/23', N'02:41:02', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2245, N'admin', N'11/27/23', N'10:35:16', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2252, N'admin', N'11/27/23', N'10:59:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2259, N'admin', N'11/27/23', N'11:29:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2260, N'admin', N'11/27/23', N'11:40:27', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2261, N'admin', N'11/27/23', N'11:43:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2265, N'admin', N'11/27/23', N'12:13:31', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2266, N'admin', N'11/27/23', N'12:15:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2267, N'admin', N'11/27/23', N'12:25:55', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2268, N'admin', N'11/27/23', N'12:27:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2274, N'admin', N'11/27/23', N'13:23:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2275, N'admin', N'11/27/23', N'13:26:57', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2276, N'admin', N'11/27/23', N'13:29:54', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2277, N'admin', N'11/27/23', N'13:32:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2279, N'admin', N'11/27/23', N'13:48:46', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2282, N'admin', N'11/27/23', N'14:00:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2285, N'admin', N'11/27/23', N'14:15:04', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2286, N'admin', N'11/27/23', N'14:18:32', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2287, N'admin', N'11/27/23', N'14:20:26', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2291, N'admin', N'11/27/23', N'14:33:30', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2293, N'admin', N'11/27/23', N'16:58:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2307, N'julian', N'11/27/23', N'22:51:05', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2308, N'admin', N'11/27/23', N'22:53:36', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2309, N'admin', N'11/27/23', N'22:55:08', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2310, N'julian', N'11/27/23', N'22:55:21', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2311, N'admin', N'11/27/23', N'23:34:49', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2312, N'admin', N'11/27/23', N'23:38:24', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2313, N'admin', N'11/27/23', N'23:41:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2314, N'julian', N'11/27/23', N'23:44:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2318, N'admin', N'11/28/23', N'01:15:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2319, N'admin', N'11/28/23', N'01:18:44', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2321, N'admin', N'11/28/23', N'14:51:33', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2324, N'julian', N'11/29/23', N'03:29:20', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2325, N'julian', N'11/29/23', N'03:31:10', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2326, N'julian', N'11/29/23', N'03:31:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2336, N'admin', N'11/29/23', N'04:07:53', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2344, N'admin', N'11/29/23', N'04:37:56', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2345, N'admin', N'11/29/23', N'04:39:17', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2346, N'admin', N'11/29/23', N'04:41:00', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2409, N'admin', N'11/29/23', N'15:40:14', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2415, N'admin', N'12/05/23', N'11:13:09', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2386, N'admin', N'11/29/23', N'07:05:07', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2387, N'admin', N'11/29/23', N'07:06:29', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2399, N'admin', N'11/29/23', N'07:35:19', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2400, N'admin', N'11/29/23', N'07:35:31', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2401, N'admin', N'11/29/23', N'07:35:34', N'El usuario  agrego un item al carrito.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2402, N'admin', N'11/29/23', N'07:35:46', N'El usuario  realizo una compra.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2403, N'admin', N'11/29/23', N'07:35:51', N'El usuario  se deslogueo.', N'Baja', N'Logout')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2410, N'admin', N'11/29/23', N'16:47:50', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2411, N'admin', N'11/29/23', N'16:53:21', N'El usuario  realizo un backup.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2413, N'admin', N'12/05/23', N'11:00:35', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2417, N'admin', N'12/05/23', N'11:31:05', N'El usuario  se logueo.', N'Baja', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2418, N'admin', N'12/05/23', N'11:32:06', N'El usuario  listo el XML.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2419, N'admin', N'12/05/23', N'11:32:09', N'El usuario  listo el XML.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2420, N'admin', N'12/05/23', N'11:32:11', N'El usuario  listo el XML.', N'Media', N'Login')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity]) VALUES (2425, N'admin', N'12/05/23', N'15:38:53', N'El usuario  se logueo.', N'Baja', N'Login')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (1, N'Curso de emprendedurismo', N'Curso introductorio ', N'3500      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (3, N'Curso de  Lenguaje de senias', N'Curso introductorio', N'7000      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (4, N'Curso de Interpretacion en vivo', N'Curso Avanzado ', N'12000     ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (5, N'Curso de marketing', N'Curso Intermedio', N'5000      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (6, N'Curso de marketing visual', N'Curso Avanzado', N'8000      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (7, N'Curso de mercadotecnia', N'Curso Intermedio', N'4000      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (8, N'Curso de lenguaje de marcado', N'Curso completo', N'3200      ')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio]) VALUES (9, N'Curso test2', N'Detalles del curso 2', N'2138      ')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
INSERT [dbo].[dvv] ([dvv], [tablename]) VALUES (N'1ad7233e1a908cb5cd6ba44fe5b675649af6cf9ce71cdb066823005a14386250', N'Users')
GO
SET IDENTITY_INSERT [dbo].[Interpretaciones] ON 

INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (1, N'A', N'Letra A', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (2, N'B', N'Letra B', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (3, N'C', N'Letra C', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (4, N'D', N'Letra D', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (5, N'Hola', N'Palabra hola', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (6, N'Adios', N'Palabra adios', 6, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (7, N'Lunes', N'Palabra lunes', 6, 0, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (8, N'Pepito', N'Palabra pepito', 6, 0, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (9, N'River', N'River palabra', 6, 0, N'11/26/2023 2:21:12 PM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (10, N'Plate', N'El mas grande', 6, 0, N'11/27/2023 11:42:15 PM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (11, N'Racing', N'Racing club de Avellaneda', 6, 0, N'11/27/2023 11:42:32 PM')
SET IDENTITY_INSERT [dbo].[Interpretaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Admin', 3, NULL, NULL)
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'AdminCompras', 17, N'AdminCompras', N'Menu de compras como administrador')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'AdminSolicitudes', 14, N'AdminSolicitudes', N'Menu de solicitudes como Admin')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Backup', 11, N'Backup', N'Menu de backup/restore')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Bitacora', 1, N'Bitacora', N'Vista de la bitacora')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Cliente', 4, NULL, NULL)
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Compras', 16, N'Compras', N'Realizar compras')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Default', 6, N'Default', N'Default')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'FamiliaTest1', 20, NULL, NULL)
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Los simpsons', 18, NULL, NULL)
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Patentes', 5, N'Patentes', N'Menu de familias y componentes')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Solicitud', 15, N'Solicitud', N'Realizar una solicitud')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'Usuarios', 2, N'Usuarios', N'Menu de usuarios')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'WebMaster', 10, NULL, NULL)
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'WebService', 12, N'WebService', N'Menu de Webservices')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description]) VALUES (N'XML', 13, N'XML', N'Menu de salidas XML')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 1)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 2)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 5)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (18, 1)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 16)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 15)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 12)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 13)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (3, 14)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (4, 16)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (4, 15)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (10, 11)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (10, 1)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (10, 12)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (10, 13)
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child]) VALUES (20, 17)
GO
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (6, 3)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (4, 1)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (7, 3)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (5, 4)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (8, 4)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (6, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (7, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (5, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (8, 6)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (6, N'39430861', N'Julian', N'Lastra', N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'julianlastra.kz@gmail.com', N'1159363830', N'Posadas 289', N'5b44e9aa3d2bd3c70979f21dbca88209b22af67f1b6749cd4a3e8bdd1190e179', 1, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (7, N'39430862', N'Julian', N'lastra', N'julian', N'ce0fee7e61f9c74f1110f0e5940a80b4f059f189217d0c3d26bb41960d4bf597', N'julianlastra.kz@gmail.com', N'12293392', N'Posadas 289', N'62f495d05cd7b17cba74daf50189841f2e83d26dc689e6c0cc60d6849d892459', 2, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (8, N'23231315', N'Luis Alberto', N'Spinetta', N'spinetta', N'ce0fee7e61f9c74f1110f0e5940a80b4f059f189217d0c3d26bb41960d4bf597', N'luis@spinetta.com', N'2229942', N'Av Livertador', N'2a94370674c42c6436e86b82f24889fb9c2cfc6f49e9efcbfe22d1b27973175e', 1, 1, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (4, N'321321', N'David', N'Guilmoure', N'davidg', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'd@gmail.com', N'1234', N'Lodnres 14', N'69a800b8b8463c1ecb3964c38dae08cd5c8d2374eddb3ba3ccbed0457f38b5be', 1, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (5, N'32131', N'Pepe', N'pepe', N'pepe', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'racingcampeon', N'123', N'pepe ', N'7ff4997aca75a1623f959c23b23acdb6301c64c73f6b2d3d68b02c4b5b6d7074', 1, 7, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [tfi] SET  READ_WRITE 
GO
