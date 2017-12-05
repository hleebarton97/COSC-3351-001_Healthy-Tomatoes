/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [MovieDB]    Script Date: 12/5/2017 3:58:23 PM ******/
CREATE DATABASE [MovieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\MovieDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\MovieDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieDB] SET QUERY_STORE = OFF
GO
USE [MovieDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MovieDB]
GO
/****** Object:  Table [dbo].[ACTOR]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTOR](
	[actor_id] [int] IDENTITY(1,1) NOT NULL,
	[actor_fname] [varchar](50) NOT NULL,
	[actor_lname] [varchar](50) NOT NULL,
 CONSTRAINT [actor_pk] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADMINS]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINS](
	[admin_code] [int] IDENTITY(1,1) NOT NULL,
	[admin_username] [varchar](50) NOT NULL,
	[admin_password] [varchar](50) NOT NULL,
	[admin_fname] [varchar](50) NOT NULL,
	[admin_lname] [varchar](50) NOT NULL,
	[admin_email] [varchar](75) NOT NULL,
 CONSTRAINT [admins_pk] PRIMARY KEY CLUSTERED 
(
	[admin_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[mov_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [categories_pk] PRIMARY KEY CLUSTERED 
(
	[mov_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARACTERS]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARACTERS](
	[act_id] [int] NOT NULL,
	[mov_id] [int] NOT NULL,
	[charcter_played] [varchar](75) NULL,
 CONSTRAINT [characters_pk] PRIMARY KEY CLUSTERED 
(
	[act_id] ASC,
	[mov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRECTOR]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRECTOR](
	[dir_id] [int] IDENTITY(1,1) NOT NULL,
	[dir_fname] [varchar](50) NULL,
	[dir_lname] [varchar](50) NULL,
 CONSTRAINT [dir_pk] PRIMARY KEY CLUSTERED 
(
	[dir_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GENRE]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENRE](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_type] [varchar](25) NOT NULL,
 CONSTRAINT [genre_pk] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIE]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIE](
	[movie_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_title] [varchar](75) NOT NULL,
	[movie_runlength] [int] NOT NULL,
	[movie_releaseYear] [date] NOT NULL,
	[movie_dir_id] [int] NOT NULL,
	[movie_rating] [varchar](5) NULL,
 CONSTRAINT [movie_pk] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCER]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCER](
	[producer_id] [int] IDENTITY(1,1) NOT NULL,
	[producer_fname] [varchar](50) NOT NULL,
	[producer_lname] [varchar](50) NOT NULL,
 CONSTRAINT [producer_pk] PRIMARY KEY CLUSTERED 
(
	[producer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCES]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCES](
	[mov_id] [int] NOT NULL,
	[prod_id] [int] NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [produces_pk] PRIMARY KEY CLUSTERED 
(
	[mov_id] ASC,
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATINGS]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATINGS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[u_id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[rating] [smallint] NULL,
 CONSTRAINT [rating_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 12/5/2017 3:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[user_code] [int] IDENTITY(1,1) NOT NULL,
	[user_username] [varchar](50) NOT NULL,
	[user_password] [varchar](50) NOT NULL,
	[user_fname] [varchar](50) NOT NULL,
	[user_lname] [varchar](50) NOT NULL,
	[user_email] [varchar](75) NOT NULL,
	[user_DOB] [date] NOT NULL,
 CONSTRAINT [users_pk] PRIMARY KEY CLUSTERED 
(
	[user_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACTOR] ON 
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (1, N'Harrison', N'Ford')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (2, N'Rutger', N'Hauer')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (3, N'Sean', N'Young')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (4, N'Edward James', N'Olmos')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (5, N'M. Emmet', N'Walsh')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (6, N'Russel', N'Crowe')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (7, N'Joaquin', N'Phoenix')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (8, N'Connie', N'Nielsen')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (9, N'Oliver', N'Reed')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (10, N'Richard', N'Harris')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (11, N'Djimon', N'Hounsou')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (12, N'Josh', N'Hartnett')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (13, N'Ewan', N'McGregor')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (14, N'Tom', N'Sizemore')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (15, N'Eric', N'Bana')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (16, N'Tom', N'Hardy')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (17, N'William', N'Fichtner')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (18, N'Tom', N'Skerritt')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (19, N'Sigourney', N'Weaver')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (20, N'Veronica', N'Cartwright')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (21, N'Harry Dean', N'Stanton')
GO
INSERT [dbo].[ACTOR] ([actor_id], [actor_fname], [actor_lname]) VALUES (22, N'John', N'Hurt')
GO
SET IDENTITY_INSERT [dbo].[ACTOR] OFF
GO
SET IDENTITY_INSERT [dbo].[ADMINS] ON 
GO
INSERT [dbo].[ADMINS] ([admin_code], [admin_username], [admin_password], [admin_fname], [admin_lname], [admin_email]) VALUES (1, N'V-GINY', N'DeathSphere12', N'Matt', N'Groening', N'easteregg@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[ADMINS] OFF
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (1, 1)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (1, 6)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (2, 2)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (2, 5)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (2, 7)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (3, 2)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (3, 3)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (3, 8)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (4, 1)
GO
INSERT [dbo].[CATEGORIES] ([mov_id], [genre_id]) VALUES (4, 4)
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (1, 1, N'Rick Deckard')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (2, 1, N'Roy Batty')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (3, 1, N'Rachel')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (4, 1, N'Gaf')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (5, 1, N'Bryant')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (6, 2, N'Maximus')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (7, 2, N'Commodus')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (8, 2, N'Lucilla')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (9, 2, N'Proximo')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (10, 2, N'Marcus Aurelius')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (11, 2, N'Juba')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (12, 3, N'Eversmann')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (13, 3, N'Grimes')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (14, 3, N'McKnight')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (15, 3, N'Hoot')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (16, 3, N'Twombly')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (17, 3, N'Sanderson')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (18, 4, N'Dallas')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (19, 4, N'Ripley')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (20, 4, N'Lambert')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (21, 4, N'Brett')
GO
INSERT [dbo].[CHARACTERS] ([act_id], [mov_id], [charcter_played]) VALUES (22, 4, N'Kane')
GO
SET IDENTITY_INSERT [dbo].[DIRECTOR] ON 
GO
INSERT [dbo].[DIRECTOR] ([dir_id], [dir_fname], [dir_lname]) VALUES (1, N'Ridley', N'Scott')
GO
SET IDENTITY_INSERT [dbo].[DIRECTOR] OFF
GO
SET IDENTITY_INSERT [dbo].[GENRE] ON 
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (1, N'SCI-FI')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (2, N'DRAMA')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (3, N'WAR')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (4, N'HORROR')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (5, N'ACTION')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (6, N'THILLER')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (7, N'ADVENTURE')
GO
INSERT [dbo].[GENRE] ([genre_id], [genre_type]) VALUES (8, N'HISTORY')
GO
SET IDENTITY_INSERT [dbo].[GENRE] OFF
GO
SET IDENTITY_INSERT [dbo].[MOVIE] ON 
GO
INSERT [dbo].[MOVIE] ([movie_id], [movie_title], [movie_runlength], [movie_releaseYear], [movie_dir_id], [movie_rating]) VALUES (1, N'Blade Runner', 117, CAST(N'1982-06-25' AS Date), 1, N'R')
GO
INSERT [dbo].[MOVIE] ([movie_id], [movie_title], [movie_runlength], [movie_releaseYear], [movie_dir_id], [movie_rating]) VALUES (2, N'Gladiator', 155, CAST(N'2000-05-05' AS Date), 1, N'R')
GO
INSERT [dbo].[MOVIE] ([movie_id], [movie_title], [movie_runlength], [movie_releaseYear], [movie_dir_id], [movie_rating]) VALUES (3, N'Black Hawk Down', 144, CAST(N'2002-01-18' AS Date), 1, N'R')
GO
INSERT [dbo].[MOVIE] ([movie_id], [movie_title], [movie_runlength], [movie_releaseYear], [movie_dir_id], [movie_rating]) VALUES (4, N'Alien', 117, CAST(N'1979-06-22' AS Date), 1, N'R')
GO
SET IDENTITY_INSERT [dbo].[MOVIE] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCER] ON 
GO
INSERT [dbo].[PRODUCER] ([producer_id], [producer_fname], [producer_lname]) VALUES (1, N'Ridley', N'Scott')
GO
SET IDENTITY_INSERT [dbo].[PRODUCER] OFF
GO
INSERT [dbo].[PRODUCES] ([mov_id], [prod_id], [title]) VALUES (1, 1, N'coproducer - uncredited')
GO
INSERT [dbo].[PRODUCES] ([mov_id], [prod_id], [title]) VALUES (2, 1, N'executive producer - uncredited')
GO
INSERT [dbo].[PRODUCES] ([mov_id], [prod_id], [title]) VALUES (3, 1, N'producer')
GO
SET IDENTITY_INSERT [dbo].[RATINGS] ON 
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (1, 1, 1, 4)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (2, 1, 2, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (3, 1, 3, 2)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (4, 1, 4, 1)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (5, 2, 1, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (6, 2, 2, 4)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (7, 2, 3, 2)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (8, 2, 4, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (9, 3, 1, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (10, 3, 2, 4)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (11, 3, 3, 1)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (12, 3, 4, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (13, 5, 1, 4)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (14, 5, 2, 3)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (15, 5, 3, 1)
GO
INSERT [dbo].[RATINGS] ([Id], [u_id], [m_id], [rating]) VALUES (16, 6, 4, 4)
GO
SET IDENTITY_INSERT [dbo].[RATINGS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (1, N'hoppyr123', N'fir3w00dS', N'Robert', N'Hopkins', N'rhopkins070@gmail.com', CAST(N'1981-08-25' AS Date))
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (2, N'caboose4', N'IhateBabies3', N'Michael', N'Caboose', N'dumbASrocks@yahoo.com', CAST(N'1999-06-28' AS Date))
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (3, N'spookyGhost', N'IsayBoo9', N'Casper', N'theFriendlvGhost', N'randomEmail@aol.com', CAST(N'1995-04-17' AS Date))
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (4, N'murderTh3gods', N'Ghost0fSparta', N'Kratos', N'GodofWar', N'spartanRage@hotmail.com', CAST(N'1971-01-24' AS Date))
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (5, N'Planck1918', N'blackBodyRad12', N'Max', N'Planck', N'myConstant@tamucc.edu', CAST(N'1858-04-23' AS Date))
GO
INSERT [dbo].[USERS] ([user_code], [user_username], [user_password], [user_fname], [user_lname], [user_email], [user_DOB]) VALUES (6, N'TheCaptain', N'WhiteWhale5', N'Ahab', N'Hook', N'obsession@delmar.edu', CAST(N'1851-12-18' AS Date))
GO
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ADMINS__0CEDD55F283342E3]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[ADMINS] ADD UNIQUE NONCLUSTERED 
(
	[admin_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ADMINS__1550A2DCBC02C3F4]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[ADMINS] ADD UNIQUE NONCLUSTERED 
(
	[admin_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__DIRECTOR__D886CF4DB8EF02EB]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[DIRECTOR] ADD UNIQUE NONCLUSTERED 
(
	[dir_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__GENRE__18428D439C7F4DF7]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[GENRE] ADD UNIQUE NONCLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MOVIE__83CDF7489110BEA4]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[MOVIE] ADD UNIQUE NONCLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__USERS__EDC4140F34D7006B]    Script Date: 12/5/2017 3:58:23 PM ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[user_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORIES]  WITH CHECK ADD  CONSTRAINT [cat_genre_fk] FOREIGN KEY([genre_id])
REFERENCES [dbo].[GENRE] ([genre_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CATEGORIES] CHECK CONSTRAINT [cat_genre_fk]
GO
ALTER TABLE [dbo].[CATEGORIES]  WITH CHECK ADD  CONSTRAINT [cat_mov_fk] FOREIGN KEY([mov_id])
REFERENCES [dbo].[MOVIE] ([movie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CATEGORIES] CHECK CONSTRAINT [cat_mov_fk]
GO
ALTER TABLE [dbo].[CHARACTERS]  WITH CHECK ADD  CONSTRAINT [act_id_fk] FOREIGN KEY([act_id])
REFERENCES [dbo].[ACTOR] ([actor_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHARACTERS] CHECK CONSTRAINT [act_id_fk]
GO
ALTER TABLE [dbo].[CHARACTERS]  WITH CHECK ADD  CONSTRAINT [mov_id_fk] FOREIGN KEY([mov_id])
REFERENCES [dbo].[MOVIE] ([movie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHARACTERS] CHECK CONSTRAINT [mov_id_fk]
GO
ALTER TABLE [dbo].[MOVIE]  WITH CHECK ADD  CONSTRAINT [movie_fk] FOREIGN KEY([movie_dir_id])
REFERENCES [dbo].[DIRECTOR] ([dir_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MOVIE] CHECK CONSTRAINT [movie_fk]
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD  CONSTRAINT [pro_mov_fk] FOREIGN KEY([mov_id])
REFERENCES [dbo].[MOVIE] ([movie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCES] CHECK CONSTRAINT [pro_mov_fk]
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD  CONSTRAINT [prod_fk] FOREIGN KEY([prod_id])
REFERENCES [dbo].[PRODUCER] ([producer_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCES] CHECK CONSTRAINT [prod_fk]
GO
ALTER TABLE [dbo].[RATINGS]  WITH CHECK ADD  CONSTRAINT [ratings_movie_id_fk] FOREIGN KEY([m_id])
REFERENCES [dbo].[MOVIE] ([movie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RATINGS] CHECK CONSTRAINT [ratings_movie_id_fk]
GO
ALTER TABLE [dbo].[RATINGS]  WITH CHECK ADD  CONSTRAINT [ratings_user_id_fk] FOREIGN KEY([u_id])
REFERENCES [dbo].[USERS] ([user_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RATINGS] CHECK CONSTRAINT [ratings_user_id_fk]
GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
