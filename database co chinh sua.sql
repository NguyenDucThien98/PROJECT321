USE [master]
GO
/****** Object:  Database [BanHang]    Script Date: 10/30/2018 18:47:12 ******/
CREATE DATABASE [BanHang] ON  PRIMARY 
( NAME = N'BanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BanHang.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BanHang_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanHang] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHang] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BanHang] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BanHang] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BanHang] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BanHang] SET ARITHABORT OFF
GO
ALTER DATABASE [BanHang] SET AUTO_CLOSE ON
GO
ALTER DATABASE [BanHang] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BanHang] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BanHang] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BanHang] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BanHang] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BanHang] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BanHang] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BanHang] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BanHang] SET  ENABLE_BROKER
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BanHang] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BanHang] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BanHang] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BanHang] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BanHang] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BanHang] SET  READ_WRITE
GO
ALTER DATABASE [BanHang] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BanHang] SET  MULTI_USER
GO
ALTER DATABASE [BanHang] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BanHang] SET DB_CHAINING OFF
GO
USE [BanHang]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON
INSERT [dbo].[KhachHang] ([cid], [cname], [address], [phone], [username], [password], [status]) VALUES (1, N'thienndhaha', N'Hanoi', N'0566662225', N'thiennd', N'thiennd', 1)
INSERT [dbo].[KhachHang] ([cid], [cname], [address], [phone], [username], [password], [status]) VALUES (2, N'thanhhaha', N'SonLa', N'1231465445', N'thanhhaha', N'thanhhaha', 1)
INSERT [dbo].[KhachHang] ([cid], [cname], [address], [phone], [username], [password], [status]) VALUES (3, N'namkna', N'Thá» NGu', N'012345679', N'nam123', N'nam123', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[hid] [int] IDENTITY(1,1) NOT NULL,
	[hname] [nvarchar](30) NULL,
	[website] [varchar](100) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[hid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON
INSERT [dbo].[HangSanXuat] ([hid], [hname], [website], [status]) VALUES (1, N'Apple', N'apple.com', 1)
INSERT [dbo].[HangSanXuat] ([hid], [hname], [website], [status]) VALUES (2, N'Sam sung', N'samsung.com', 1)
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](32) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([username], [password], [status]) VALUES (N'admin', N'admin', 1)
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[hdid] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[cid] [int] NULL,
	[Rcname] [nvarchar](50) NULL,
	[Raddress] [nvarchar](50) NULL,
	[Rphone] [varchar](20) NULL,
	[total] [money] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hdid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (1, CAST(0x0000A9800112CBC3 AS DateTime), 1, N'thiennd', N'Hanoi', N'0566662225', 500.0000, 5)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (2, CAST(0x0000A98001137BC9 AS DateTime), 3, N'namkna', N'Son la', N'012345679', 4200.0000, 2)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (3, CAST(0x0000A98201359719 AS DateTime), 1, N'thiennd', N'Hanoi', N'0566662225', 1500.0000, 5)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (4, CAST(0x0000A98201362929 AS DateTime), 2, N'thanhhaha', N'SonLa', N'1231465445', 6200.0000, 4)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (5, CAST(0x0000A98201374C9B AS DateTime), 2, N'thanhhaha', N'SonLa', N'1231465445', 2000.0000, 1)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (6, CAST(0x0000A988016D6342 AS DateTime), 1, N'thiennd', N'Hanoi', N'0566662225', 5000.0000, 2)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (7, CAST(0x0000A98801829640 AS DateTime), 1, N'thiennd', N'Hanoi', N'0566662225', 5000.0000, 4)
INSERT [dbo].[HoaDon] ([hdid], [date], [cid], [Rcname], [Raddress], [Rphone], [total], [status]) VALUES (8, CAST(0x0000A9890131E45E AS DateTime), 1, N'thienndhaha', N'Hanoi', N'0566662225', 500.0000, 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[sid] [varchar](30) NOT NULL,
	[sname] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[picture] [varchar](200) NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[hid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'1', N'Iphone 6', 90, 500.0000, N'images/products/small/iphone6.png', N'', 1, 1)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'10', N'Samsung S6', 20, 500.0000, N'images/products/small/samsungS10.png', N'', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'11', N'Apple Iphone 7', 19, 500.0000, N'images/products/small/iphoneXS.png', N'new', 1, 1)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'12', N'Apple Iphone 7', 0, 500.0000, N'images/products/small/iphoneXS.png', N'Het Hang', 1, 1)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'2', N'IPhone X', 20, 1200.0000, N'images/products/small/iphoneXS.png', N'', 1, 1)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'3', N'SamSung Note9', 100, 1200.0000, N'images/products/small/samsungNote9.png', N'-30%', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'4', N'SamSung S10', 19, 1000.0000, N'images/products/small/samsungS10.png', N'new', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'5', N'SamSung S10 New', 20, 1000.0000, N'images/products/small/samsungS10.png', N'', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'6', N'IPhone XS', 19, 2000.0000, N'images/products/small/iphoneXS.png', N'', 1, 1)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'7', N'Samsung S6', 19, 500.0000, N'images/products/small/samsungS10.png', N'new', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'8', N'Samsung S6', 20, 500.0000, N'images/products/small/samsungS10.png', N'', 1, 2)
INSERT [dbo].[SanPham] ([sid], [sname], [quantity], [price], [picture], [description], [status], [hid]) VALUES (N'9', N'Samsung S6', 20, 500.0000, N'images/products/small/samsungS10.png', N'', 1, 2)
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 10/30/2018 18:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[hdid] [int] NOT NULL,
	[sid] [varchar](30) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[hdid] ASC,
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (1, N'10', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (2, N'1', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (2, N'10', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (2, N'3', 1, 1200.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (2, N'6', 1, 2000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (3, N'1', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (3, N'10', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (3, N'11', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'10', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'11', 2, 1000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'12', 2, 1000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'3', 1, 1200.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'6', 1, 2000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (4, N'7', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (5, N'11', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (5, N'4', 1, 1000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (5, N'7', 1, 500.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (6, N'10', 10, 5000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (7, N'1', 10, 5000.0000)
INSERT [dbo].[HoaDonChiTiet] ([hdid], [sid], [quantity], [price]) VALUES (8, N'1', 1, 500.0000)
/****** Object:  Default [DF__KhachHang__statu__173876EA]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__HangSanXu__statu__182C9B23]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HangSanXuat] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__admin__status__1920BF5C]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[admin] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__HoaDon__date__1A14E395]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__HoaDon__status__1B0907CE]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__SanPham__status__1BFD2C07]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  ForeignKey [FK__HoaDon__cid__1CF15040]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[KhachHang] ([cid])
GO
/****** Object:  ForeignKey [FK__SanPham__hid__1DE57479]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([hid])
REFERENCES [dbo].[HangSanXuat] ([hid])
GO
/****** Object:  ForeignKey [FK__HoaDonChiT__hdid__1ED998B2]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([hdid])
REFERENCES [dbo].[HoaDon] ([hdid])
GO
/****** Object:  ForeignKey [FK__HoaDonChiTi__sid__1FCDBCEB]    Script Date: 10/30/2018 18:47:13 ******/
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[SanPham] ([sid])
GO
