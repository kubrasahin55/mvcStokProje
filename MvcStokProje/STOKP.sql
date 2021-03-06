USE [master]
GO
/****** Object:  Database [Stok]    Script Date: 16.03.2022 14:46:52 ******/
CREATE DATABASE [Stok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stok', FILENAME = N'C:\Users\Kübra\Desktop\MSSQL15.MSSQLSERVER\MSSQL\DATA\Stok.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Stok_log', FILENAME = N'C:\Users\Kübra\Desktop\MSSQL15.MSSQLSERVER\MSSQL\DATA\Stok_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Stok] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stok] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stok] SET RECOVERY FULL 
GO
ALTER DATABASE [Stok] SET  MULTI_USER 
GO
ALTER DATABASE [Stok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stok] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Stok] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Stok] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Stok', N'ON'
GO
ALTER DATABASE [Stok] SET QUERY_STORE = OFF
GO
USE [Stok]
GO
/****** Object:  Table [dbo].[TKategoriler]    Script Date: 16.03.2022 14:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](50) NULL,
 CONSTRAINT [PK_TKategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMusteriler]    Script Date: 16.03.2022 14:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMusteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAd] [varchar](50) NULL,
	[MusteriSoyad] [varchar](50) NULL,
 CONSTRAINT [PK_TMusteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TSatislar]    Script Date: 16.03.2022 14:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TSatislar](
	[SatısId] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [int] NULL,
	[Fiyat] [decimal](18, 0) NULL,
 CONSTRAINT [PK_TSatislar] PRIMARY KEY CLUSTERED 
(
	[SatısId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUrunler]    Script Date: 16.03.2022 14:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUrunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](50) NULL,
	[Marka] [varchar](50) NULL,
	[UrunKategori] [int] NULL,
	[Fiyat] [decimal](18, 0) NULL,
	[Stok] [int] NULL,
 CONSTRAINT [PK_TUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TKategoriler] ON 

INSERT [dbo].[TKategoriler] ([KategoriId], [KategoriAd]) VALUES (1, N'Beyaz Eşya')
INSERT [dbo].[TKategoriler] ([KategoriId], [KategoriAd]) VALUES (2, N'Küçük Ev Aletleri')
INSERT [dbo].[TKategoriler] ([KategoriId], [KategoriAd]) VALUES (3, N'Bilgisayar')
INSERT [dbo].[TKategoriler] ([KategoriId], [KategoriAd]) VALUES (4, N'Televizyon')
INSERT [dbo].[TKategoriler] ([KategoriId], [KategoriAd]) VALUES (5, N'Telefon')
SET IDENTITY_INSERT [dbo].[TKategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[TMusteriler] ON 

INSERT [dbo].[TMusteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (1, N'Emel ', N'Çınar')
INSERT [dbo].[TMusteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (2, N'Ali', N'Yücel')
INSERT [dbo].[TMusteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (3, N'Kübra', N'Şahin')
INSERT [dbo].[TMusteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (4, N'Hatice', N'Yıldız')
INSERT [dbo].[TMusteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (5, N'ayşe', N'uguz')
SET IDENTITY_INSERT [dbo].[TMusteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[TSatislar] ON 

INSERT [dbo].[TSatislar] ([SatısId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (1, 1, 1, 5, CAST(60 AS Decimal(18, 0)))
INSERT [dbo].[TSatislar] ([SatısId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (2, 2, 1, 6, CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[TSatislar] ([SatısId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (3, 3, 4, 60, CAST(8000 AS Decimal(18, 0)))
INSERT [dbo].[TSatislar] ([SatısId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (4, 1, 1, 55, CAST(66 AS Decimal(18, 0)))
INSERT [dbo].[TSatislar] ([SatısId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (5, 1, 1, 1, CAST(1 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[TSatislar] OFF
GO
SET IDENTITY_INSERT [dbo].[TUrunler] ON 

INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (1, N'Çamaşır Makinesi', N'Arçelik', 1, CAST(500 AS Decimal(18, 0)), 15)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (2, N'Telefon', N'Samsung', 5, CAST(6000 AS Decimal(18, 0)), 10)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (3, N'Su Isıtıcı', N'Vestel', 2, CAST(400 AS Decimal(18, 0)), 5)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (4, N'Ütü', N'Tefal', 2, CAST(6000 AS Decimal(18, 0)), 4)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (5, N'Buzdolabı', N'Regal', 1, CAST(600 AS Decimal(18, 0)), 5)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (6, N'HDD', N'Toshiba', 4, CAST(408 AS Decimal(18, 0)), 60)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (7, N'Bilgisayar', N'Asus', 3, CAST(8000 AS Decimal(18, 0)), 90)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (8, N'Klavye', N'Asus', 2, CAST(500 AS Decimal(18, 0)), 65)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (9, N'kulaklık', N'Asus', 1, CAST(52 AS Decimal(18, 0)), 33)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (10, N'Klavye', N'Asus', 3, CAST(500 AS Decimal(18, 0)), 65)
INSERT [dbo].[TUrunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (11, N'kulaklık', N'Asus', 2, CAST(500 AS Decimal(18, 0)), 65)
SET IDENTITY_INSERT [dbo].[TUrunler] OFF
GO
ALTER TABLE [dbo].[TSatislar]  WITH CHECK ADD  CONSTRAINT [FK_TSatislar_TMusteriler] FOREIGN KEY([Musteri])
REFERENCES [dbo].[TMusteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[TSatislar] CHECK CONSTRAINT [FK_TSatislar_TMusteriler]
GO
ALTER TABLE [dbo].[TSatislar]  WITH CHECK ADD  CONSTRAINT [FK_TSatislar_TUrunler] FOREIGN KEY([Urun])
REFERENCES [dbo].[TUrunler] ([UrunId])
GO
ALTER TABLE [dbo].[TSatislar] CHECK CONSTRAINT [FK_TSatislar_TUrunler]
GO
ALTER TABLE [dbo].[TUrunler]  WITH CHECK ADD  CONSTRAINT [FK_TUrunler_TKategoriler] FOREIGN KEY([UrunKategori])
REFERENCES [dbo].[TKategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[TUrunler] CHECK CONSTRAINT [FK_TUrunler_TKategoriler]
GO
USE [master]
GO
ALTER DATABASE [Stok] SET  READ_WRITE 
GO
