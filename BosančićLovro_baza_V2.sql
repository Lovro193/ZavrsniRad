USE [master]
GO
/****** Object:  Database [Zavrsni_V2]    Script Date: 16.1.2020. 16:59:26 ******/
CREATE DATABASE [Zavrsni_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zavrsni_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Zavrsni_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zavrsni_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Zavrsni_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Zavrsni_V2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zavrsni_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zavrsni_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zavrsni_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zavrsni_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zavrsni_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zavrsni_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [Zavrsni_V2] SET  MULTI_USER 
GO
ALTER DATABASE [Zavrsni_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zavrsni_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zavrsni_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zavrsni_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zavrsni_V2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Zavrsni_V2', N'ON'
GO
ALTER DATABASE [Zavrsni_V2] SET QUERY_STORE = OFF
GO
USE [Zavrsni_V2]
GO
/****** Object:  Table [dbo].[Drzava]    Script Date: 16.1.2020. 16:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drzava](
	[IdDrzava] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDrzava] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gost]    Script Date: 16.1.2020. 16:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gost](
	[IdGost] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](50) NULL,
	[prezime] [varchar](70) NULL,
	[DatumRodenja] [datetime] NULL,
	[IdMjesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 16.1.2020. 16:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[IdHotela] [int] IDENTITY(1,1) NOT NULL,
	[NazivHotela] [varchar](50) NULL,
	[Adresa] [varchar](50) NULL,
	[IdMjesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHotela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mjesto]    Script Date: 16.1.2020. 16:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mjesto](
	[PostanskiBroj] [int] NOT NULL,
	[Naziv] [varchar](50) NULL,
	[idDrzava] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostanskiBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 16.1.2020. 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacija](
	[IdRezervacije] [int] IDENTITY(1,1) NOT NULL,
	[DatumDolaska] [datetime] NULL,
	[DatumOdlaska] [datetime] NULL,
	[IdHotela] [int] NULL,
	[IdZaposlenika] [int] NULL,
	[IdGosta] [int] NULL,
	[IdRezUsluga] [int] NULL,
	[IdSoba] [varchar](5) NULL,
 CONSTRAINT [PK__Rezervac__F8AB762169C271DD] PRIMARY KEY CLUSTERED 
(
	[IdRezervacije] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezervacijaUsluga]    Script Date: 16.1.2020. 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervacijaUsluga](
	[idRezervacija] [int] NULL,
	[idUsluga] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soba]    Script Date: 16.1.2020. 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soba](
	[idSobe] [varchar](5) NOT NULL,
	[naziv] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idSobe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usluga]    Script Date: 16.1.2020. 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usluga](
	[IdUsluga] [int] IDENTITY(1,1) NOT NULL,
	[NazivUsluge] [varchar](40) NULL,
	[CijenaUsluge] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsluga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposlenik]    Script Date: 16.1.2020. 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposlenik](
	[idZaposlenik] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](40) NULL,
	[prezime] [varchar](50) NULL,
	[korisnickoIme] [varchar](20) NULL,
	[lozinka] [varchar](10) NULL,
	[idHotel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idZaposlenik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gost]  WITH CHECK ADD  CONSTRAINT [FK_Gost_Mjesto] FOREIGN KEY([IdMjesto])
REFERENCES [dbo].[Mjesto] ([PostanskiBroj])
GO
ALTER TABLE [dbo].[Gost] CHECK CONSTRAINT [FK_Gost_Mjesto]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Mjesto] FOREIGN KEY([IdMjesto])
REFERENCES [dbo].[Mjesto] ([PostanskiBroj])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Mjesto]
GO
ALTER TABLE [dbo].[Mjesto]  WITH CHECK ADD  CONSTRAINT [FK_Mjesto_Drzava] FOREIGN KEY([idDrzava])
REFERENCES [dbo].[Drzava] ([IdDrzava])
GO
ALTER TABLE [dbo].[Mjesto] CHECK CONSTRAINT [FK_Mjesto_Drzava]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Hotel] FOREIGN KEY([IdHotela])
REFERENCES [dbo].[Hotel] ([IdHotela])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Hotel]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Soba] FOREIGN KEY([IdSoba])
REFERENCES [dbo].[Soba] ([idSobe])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Soba]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Zaposlenik] FOREIGN KEY([IdZaposlenika])
REFERENCES [dbo].[Zaposlenik] ([idZaposlenik])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Zaposlenik]
GO
ALTER TABLE [dbo].[RezervacijaUsluga]  WITH CHECK ADD  CONSTRAINT [FK_RezervacijaUsluga_Rezervacija] FOREIGN KEY([idRezervacija])
REFERENCES [dbo].[Rezervacija] ([IdRezervacije])
GO
ALTER TABLE [dbo].[RezervacijaUsluga] CHECK CONSTRAINT [FK_RezervacijaUsluga_Rezervacija]
GO
ALTER TABLE [dbo].[RezervacijaUsluga]  WITH CHECK ADD  CONSTRAINT [FK_RezervacijaUsluga_Usluga] FOREIGN KEY([idUsluga])
REFERENCES [dbo].[Usluga] ([IdUsluga])
GO
ALTER TABLE [dbo].[RezervacijaUsluga] CHECK CONSTRAINT [FK_RezervacijaUsluga_Usluga]
GO
ALTER TABLE [dbo].[Zaposlenik]  WITH CHECK ADD  CONSTRAINT [FK_Zaposlenik_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([IdHotela])
GO
ALTER TABLE [dbo].[Zaposlenik] CHECK CONSTRAINT [FK_Zaposlenik_Hotel]
GO
USE [master]
GO
ALTER DATABASE [Zavrsni_V2] SET  READ_WRITE 
GO
