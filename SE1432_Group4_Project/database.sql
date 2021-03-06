USE [master]
GO
/****** Object:  Database [TheReviewty]    Script Date: 7/25/2021 11:20:07 PM ******/
CREATE DATABASE [TheReviewty]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheReviewty', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TheReviewty.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheReviewty_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TheReviewty_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TheReviewty] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheReviewty].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheReviewty] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheReviewty] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheReviewty] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheReviewty] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheReviewty] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheReviewty] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheReviewty] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheReviewty] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheReviewty] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheReviewty] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheReviewty] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheReviewty] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheReviewty] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheReviewty] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheReviewty] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TheReviewty] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheReviewty] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheReviewty] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheReviewty] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheReviewty] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheReviewty] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheReviewty] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheReviewty] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheReviewty] SET  MULTI_USER 
GO
ALTER DATABASE [TheReviewty] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheReviewty] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheReviewty] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheReviewty] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheReviewty] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheReviewty] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TheReviewty] SET QUERY_STORE = OFF
GO
USE [TheReviewty]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/25/2021 11:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/25/2021 11:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cate_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 7/25/2021 11:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluate](
	[Account] [nvarchar](50) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Vote] [int] NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 7/25/2021 11:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Product_Id] [int] NOT NULL,
	[Image_url] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/25/2021 11:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Category] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Link] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'cogiaominhthu', N'cogiaominhthu')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'khanhpdhe141226', N'khanhpdhe141226')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'mlinh', N'mlinh')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'ngocanh2k3', N'ngocanh2k3')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'Ninhtb', N'Ninhtb')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'Suboi_67', N'suboi67')
INSERT [dbo].[Account] ([Username], [Password]) VALUES (N'user', N'user')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Cate_Name]) VALUES (1, N'Fashion')
INSERT [dbo].[Category] ([Id], [Cate_Name]) VALUES (2, N'Food and Drinks')
INSERT [dbo].[Category] ([Id], [Cate_Name]) VALUES (3, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [Cate_Name]) VALUES (4, N'Technology')
INSERT [dbo].[Category] ([Id], [Cate_Name]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'khanhpdhe141226', 1, 8, N'Nice!', CAST(N'2020-02-22' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'khanhpdhe141226', 6, 9, N'Recommend!', CAST(N'2020-03-21' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Suboi_67', 3, 6, N'Pretty good!', CAST(N'2020-07-06' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Ninhtb', 3, 5, N'Not ok', CAST(N'2021-01-11' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'ngocanh2k3', 1, 6, N'beef is a bit tough', CAST(N'2021-01-11' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'cogiaominhthu', 6, 9, N'oke nhé', CAST(N'2021-07-24' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Suboi_67', 1, 8, N'Good Services', CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'ngocanh2k3', 4, 9, N'Great View', CAST(N'2020-09-19' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Ninhtb', 4, 10, N'Beautiful!', CAST(N'2021-02-01' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'khanhpdhe141226', 4, 9, N'Lovely', CAST(N'2021-01-29' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'mlinh', 5, 9, N'100', CAST(N'2020-10-08' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'mlinh', 3, 9, N'I think it nice for me', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'khanhpdhe141226', 3, 8, N'Nice sweatshirt', CAST(N'2021-05-23' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Ninhtb', 6, 8, N'Áo đẹp', CAST(N'2021-04-25' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'Ninhtb', 5, 10, N'Mới mua cho ng iu khá oke nha', CAST(N'2021-03-07' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'khanhpdhe141226', 5, 5, N'My girl friend doesn''s like it', CAST(N'2021-07-24' AS Date))
INSERT [dbo].[Evaluate] ([Account], [Product_Id], [Vote], [Comment], [Date]) VALUES (N'user', 4, 10, N'good', CAST(N'2021-01-18' AS Date))
GO
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (1, N'../images/Kingbbq1.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (1, N'../images/Kingbbq2.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (1, N'../images/Kingbbq3.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (3, N'../images/DirtyCoins1.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (3, N'../images/DirtyCoins2.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (3, N'../images/DirtyCoins3.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (4, N'../images/sam1.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (4, N'../images/sam2.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (4, N'../images/sam3.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (4, N'../images/sam4.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (4, N'../images/sam5.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand1.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand2.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand3.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand4.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand5.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (5, N'../images/romand6.png')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (6, N'../images/cest.vintage1.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (6, N'../images/cest.vintage2.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (6, N'../images/cest.vintage3.jpg')
INSERT [dbo].[Image] ([Product_Id], [Image_url]) VALUES (6, N'../images/cest.vintage4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Name], [Author], [Category], [Description], [Price], [Address], [Link]) VALUES (1, N'GoGi House Phạm Ngọc Thạch', N'khanhpdhe141226', 2, N'The food here is quite good and tasty. Good price. Fast food, polite service staff', N'About 100.000đ-300.000đ', N'Tầng 1 ,tòa nhà B4, Phạm Ngọc Thạch, Đống Đa, Hà Nội', N'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14898.250556572919!2d105.8363524!3d21.0101619!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa1864c962fe7d8aa!2sGoGi%20House!5e0!3m2!1sen!2s!4v1626580173574!5m2!1sen!2s')
INSERT [dbo].[Post] ([Id], [Name], [Author], [Category], [Description], [Price], [Address], [Link]) VALUES (3, N'DirtyCoins Logo Sweatshirt', N'Suboi_67', 1, N'The shirt design is quite nice. The quality of DirtyCoins'' items is beyond discussion. The price can be a bit expensive for some people. The shirt is light in color, so it''s easy to get dirty', N'450.000đ', N'DirtyCoins''s Online Store ', N'https://dirtycoins.vn/dirtycoins-logo-sweatshirt')
INSERT [dbo].[Post] ([Id], [Name], [Author], [Category], [Description], [Price], [Address], [Link]) VALUES (4, N'SAM RoofTop Cafe', N'ngocanh2k3', 2, N'Drinks are reasonably priced and quite tasty. The main selling point of the cafe is the cool roof view with the typical classic bus', N'30.000đ-60.000đ', N'189 Tue Tinh - TP.Hai Duong', N'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14905.124454013298!2d106.3202667!3d20.9412231!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdc2bad3a76ce2046!2zU2FtIFJvb2Z0b3AgQ29mZmVlIC0gMTg5IFR14buHIFTEqW5oIE3hu5tp!5e0!3m2!1sen!2s!4v1626805056822!5m2!1sen!2s')
INSERT [dbo].[Post] ([Id], [Name], [Author], [Category], [Description], [Price], [Address], [Link]) VALUES (5, N'Romand Cosmetic', N'mlinh', 3, N'Cosmetics company from Korea. The color is pretty good, long lasting. The price is suitable for students', N'150.000đ-250.000đ', N'Online shopee', N'https://shopee.vn/romandoffical?categoryId=100630&itemId=6563025183')
INSERT [dbo].[Post] ([Id], [Name], [Author], [Category], [Description], [Price], [Address], [Link]) VALUES (6, N'Cest.Vintage', N'khanhpdhe141226', 1, N'The secondhand shirt here has a variety of designs and beautiful materials. Although it is an old shirt, it is still quite new and has a long time of use. Extremely cheap price. Packing is also very neat', N'60.000đ-120.000đ', N'Online Instagram', N'https://www.instagram.com/cest.vintage_/')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([Account])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([Author])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [TheReviewty] SET  READ_WRITE 
GO
