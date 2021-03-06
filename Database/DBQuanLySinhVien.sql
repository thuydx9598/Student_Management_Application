USE [master]
GO
/****** Object:  Database [DBQuanLySinhVien]    Script Date: 06/03/2018 12:20:35 ******/
CREATE DATABASE [DBQuanLySinhVien] ON  PRIMARY 
( NAME = N'DBQuanLySinhVien', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DBQuanLySinhVien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBQuanLySinhVien_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DBQuanLySinhVien_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBQuanLySinhVien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBQuanLySinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBQuanLySinhVien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET ARITHABORT OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBQuanLySinhVien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBQuanLySinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBQuanLySinhVien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBQuanLySinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBQuanLySinhVien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBQuanLySinhVien] SET  READ_WRITE
GO
ALTER DATABASE [DBQuanLySinhVien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DBQuanLySinhVien] SET  MULTI_USER
GO
ALTER DATABASE [DBQuanLySinhVien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBQuanLySinhVien] SET DB_CHAINING OFF
GO
USE [DBQuanLySinhVien]
GO
/****** Object:  Table [dbo].[VIPHAM]    Script Date: 06/03/2018 12:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VIPHAM](
	[MaSV] [varchar](8) NOT NULL,
	[NoiDung] [nvarchar](100) NOT NULL,
	[HinhThucKL] [nvarchar](100) NOT NULL,
	[NgayViPham] [date] NOT NULL,
 CONSTRAINT [PK_VIPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[NoiDung] ASC,
	[HinhThucKL] ASC,
	[NgayViPham] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110002', N'Chích ma túy', N'Đuổi học', CAST(0x3D3E0B00 AS Date))
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110002', N'Đánh nhau', N'Đình chỉ học 7 ngày', CAST(0xA23D0B00 AS Date))
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110019', N'đăng kí không tham gia', N'Cảnh cáo', CAST(0x563E0B00 AS Date))
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110023', N'đăng kí không tham gia', N'Khiểm trách', CAST(0x1D3F0B00 AS Date))
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110544', N'tham gia hôi thao bị thẻ', N'Khiển trách', CAST(0xB23E0B00 AS Date))
INSERT [dbo].[VIPHAM] ([MaSV], [NoiDung], [HinhThucKL], [NgayViPham]) VALUES (N'16110573', N'đăng kí mà không tham gia mùa hè xanh', N'Cảnh cáo', CAST(0x143E0B00 AS Date))
/****** Object:  StoredProcedure [dbo].[spXoaViPham]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaViPham]
	@maSV varchar(8),
	@noiDung nvarchar(500),
	@hinhthucKL nvarchar(500),
	@ngayVP date
AS
BEGIN
	DELETE FROM VIPHAM
	WHERE MaSV = @maSV and NoiDung = @noiDung and HinhThucKL = @hinhthucKL and NgayViPham = @ngayVP
END
GO
/****** Object:  StoredProcedure [dbo].[spThemViPham]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemViPham]
	@maSV varchar(8),
	@noiDung nvarchar(500),
	@hinhthucKL nvarchar(500),
	@ngayVP date
AS
BEGIN
	INSERT INTO VIPHAM VALUES(@maSV, @noiDung, @hinhthucKL, @ngayVP)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetVPByMaSV]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetVPByMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT *
	FROM VIPHAM
	WHERE MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetVPByAllKey]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetVPByAllKey]
	@maSV varchar(8),
	@noiDung nvarchar(500),
	@hinhthucKL nvarchar(500),
	@ngayVP date
AS
BEGIN
	SELECT *
	FROM VIPHAM
	WHERE MaSV = @maSV and NoiDung = @noiDung and HinhThucKL = @hinhthucKL and NgayViPham = @ngayVP
END
GO
/****** Object:  StoredProcedure [dbo].[spGetViPham]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetViPham]
	
AS
BEGIN
	SELECT *
	FROM VIPHAM
END
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSV] [varchar](8) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DanToc] [nvarchar](15) NULL,
	[QueQuan] [nvarchar](50) NULL,
	[MaLop] [varchar](50) NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110001', N'Ngô Công Ai', N'Cẩm Đường, Long Thành, Đồng Nai', CAST(0x56210B00 AS Date), N'Nam', N'Kinh', N'Đà Nẵng', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110002', N'Ngô Công An', N'Cẩm Đường-Long Thành-Đồng Nai', CAST(0x5E220B00 AS Date), N'Nam', N'kinh', N'Đồng Nai', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110003', N'Trần Đức Lương', N'Bà Rịa-Tỉnh bà Rịa Vũng tàu', CAST(0x36210B00 AS Date), N'Nam', N'kinh', N'Vũng Tàu', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110004', N'Trần Văn Tý', N'Đơn Dương-Lâm Đồng', CAST(0xCA210B00 AS Date), N'Nam', N'kinh', N'Lâm Đồng', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110005', N'Nguyễn Văn Tèo', N'Lagi-Bình Thuận', CAST(0x77210B00 AS Date), N'Nam', N'kinh', N'Bình Thuận', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110006', N'Lê Thị Tý', N'Tp-Đà Lạt-Tỉnh Lâm Đồng', CAST(0xCC210B00 AS Date), N'Nu', N'kinh', N'Lâm Đồng', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110007', N'Lê Văn Lượm', N'Nha Trang-Tỉnh Khánh Hòa', CAST(0x2F220B00 AS Date), N'Nam', N'kinh', N'Khánh Hòa', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110008', N'Kim Thanh', N'Đồng Xoài-Tỉnh Bình Phước', CAST(0x50210B00 AS Date), N'Nu', N'H''mong', N'Bình Phước', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110009', N'Bùi Minh Huy', N'Cam Ranh-Khánh Hòa', CAST(0x6D210B00 AS Date), N'Nam', N'Khơ me', N'Khánh Hòa', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110010', N'Nguyễn Văn Ba', N'Buôn Mê Thuật-Tỉnh Đắc Lắc', CAST(0xC8210B00 AS Date), N'Nam', N'kinh', N'Đắc Lắc', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110011', N'Nông Văn Bền', N'Gia Nghĩa-Đắc Nông', CAST(0x4C210B00 AS Date), N'Nu', N'kinh', N'Đắc Nông', N'008')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110012', N'Lí Thị Bông', N'Biên Hòa-Tỉnh Đồng Nai', CAST(0x31210B00 AS Date), N'Nu', N'kinh', N'Đồng Nai', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110013', N'Võ Thị Sáu', N'Ba Vì-Thủ Đô Hà Nội', CAST(0x70210B00 AS Date), N'Nu', N'kinh', N'Hà Nội', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110014', N'Bùi Văn Bền ', N'Bạc Liêu', CAST(0xD8210B00 AS Date), N'Nam', N'kinh', N'Bạc Liêu', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110016', N'Lê Thị Kim Oanh', N'Quảng Nam', CAST(0x64220B00 AS Date), N'Nam', N'kinh', N'Quảng Nam', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110017', N'Lài Thị Màu', N'Hà Tỉnh', CAST(0x82220B00 AS Date), N'Nam', N'kinh', N'Hà Tỉnh', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110018', N'Và Văn Có', N'Dĩ An-Bình Dương', CAST(0x98220B00 AS Date), N'Nam', N'kinh', N'Bình Dương', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110019', N'Nguyễn Thị Như Ý', N'Phú Yên', CAST(0x79220B00 AS Date), N'Nu', N'kinh', N'Phú Yên', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110020', N'Trần Văn Quyết', N'Hà Giang', CAST(0x21220B00 AS Date), N'Nam', N'kinh', N'Hà Giang', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110021', N'Bùi Công Nam', N'Đà Nẵng ', CAST(0x31210B00 AS Date), N'Nam', N'kinh', N'Đà Nẵng', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110022', N'Hoàng Nguyên Lý', N'Ninh Thuận', CAST(0xC9210B00 AS Date), N'Nam', N'kinh', N'Ninh Thuận', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110023', N'Đào Xuân Hoàng', N'Bến Tre', CAST(0x6A210B00 AS Date), N'Nam', N'kinh', N'Bến Tre', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110024', N'Lì Văn Cò', N'VĨnh Long', CAST(0x70210B00 AS Date), N'Nam', N'kinh', N'Vĩnh Long', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110025', N'Nguyễn Văn ba', N'Bắc Giang', CAST(0xA9210B00 AS Date), N'Nam', N'kinh', N'Bắc Giang', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110026', N'Nguyễn Thị Định', N'Kiên Giang', CAST(0xCC210B00 AS Date), N'Nu', N'kinh', N'Kiên Giang', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110027', N'Nguyễn Văn Nghĩa', N'Bạc Liêu', CAST(0x08220B00 AS Date), N'Nam', N'kinh', N'Bạc Liêu', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110028', N'Võ Thị Mai', N'Hà Tĩnh', CAST(0xEA210B00 AS Date), N'Nu', N'kinh', N'Hà Tĩnh', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110029', N'Tô Tiểu Giang', N'Tiền Giang', CAST(0x09220B00 AS Date), N'Nam', N'kinh', N'Tiền Giang', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110030', N'Lê Thị Riêng', N'Quận 5-TPHCM', CAST(0xA9210B00 AS Date), N'Nu', N'kinh', N'TPHCM', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110031', N'Bùi Tiến Dũng', N'Nghệ An', CAST(0xA8210B00 AS Date), N'Nam', N'kinh', N'Nghệ An', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110032', N'Lê Văn Việt', N'Hải Phòng', CAST(0xE7210B00 AS Date), N'Nam', N'kinh', N'Hải Phòng', N'006')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110033', N'Bùi Thị Nở', N'Ma Lâm-Bình Thuận', CAST(0x63220B00 AS Date), N'Nu', N'kinh', N'Bình Thuận', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110034', N'Nông Văn Bền', N'Quảng Ngãi', CAST(0x08220B00 AS Date), N'Nam', N'kinh', N'Quảng Ngãi', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110035', N'Nguyễn Thị Lụa', N'An Giang', CAST(0x33210B00 AS Date), N'Nam', N'kinh', N'An Giang', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110036', N'Lài Như Ý', N'Tây Ninh', CAST(0x16220B00 AS Date), N'Nam', N'kinh', N'Tây Ninh', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110037', N'Trần Phước Hưng', N'Long An', CAST(0xF0210B00 AS Date), N'Nam', N'kinh', N'Long An', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110038', N'Nguyễn Thị Huệ', N'Tuyên Quang', CAST(0x21220B00 AS Date), N'Nam', N'kinh', N'Tuyên Quang', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110039', N'Lê Phước Bảo', N'Tân Phú-Đồng Nai', CAST(0xCC210B00 AS Date), N'Nam', N'kinh', N'Đồng Nai', N'005')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110544', N'Đào Xuân Thủy', N'Thôn 9-Hòa Ninh-Di Linh-Lâm Đồng', CAST(0xAD210B00 AS Date), N'Nam', N'kinh', N'Lâm Đồng', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16110573', N'Nguyễn Út Thiện', N'176-thôn 4- Tân Thượng-Di linh-Lâm Đồng', CAST(0xBA210B00 AS Date), N'Nam', N'kinh', N'Lâm Đồng', N'007')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16146001', N'Nguyễn Thị Tỵ', N'Hà Nam - Hà Nội', CAST(0x63220B00 AS Date), N'Nu', N'H''Mong', N'Trung Quốc', N'DDT_CL1')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16146002', N'Ngô Công Nhân', N'Thủ Dầu 1, Bình Dương', CAST(0x63220B00 AS Date), N'Nam', N'H.Mông', N'Nhật Bản', N'DDT_CL1')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [DiaChi], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16610015', N'Lại Văn Sâm', N'Hải Dương', CAST(0x47220B00 AS Date), N'Nam', N'kinh', N'Hải Dương', N'007')
/****** Object:  StoredProcedure [dbo].[spXoaSinhVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaSinhVien]
	@maSV varchar(8)
AS
BEGIN
	DELETE FROM SINHVIEN
	WHERE MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spThemSinhVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemSinhVien]
	@maSV varchar(8),
	@hoTen nvarchar(50),
	@diaChi nvarchar(200),
	@ngaySinh date,
	@gioiTinh nvarchar(10),
	@danToc nvarchar(15),
	@queQuan nvarchar(50),
	@maLop varchar(50)
AS
BEGIN
	INSERT INTO SINHVIEN VALUES (@maSV, @hoTen, @diaChi, @ngaySinh, @gioiTinh, @danToc, @queQuan, @maLop)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaSinhVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaSinhVien]
	@maSV varchar(8),
	@hoTen nvarchar(50),
	@diaChi nvarchar(200),
	@ngaySinh date,
	@gioiTinh nvarchar(10),
	@danToc nvarchar(15),
	@queQuan nvarchar(50),
	@maLop varchar(50)
AS
BEGIN
	UPDATE SINHVIEN
	SET HoTen = @hoTen, DiaChi = @diaChi, NgaySinh = @ngaySinh, GioiTinh = @gioiTinh, DanToc = @danToc, QueQuan = @queQuan, MaLop = @maLop
	WHERE MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVTheoMaSV]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVTheoMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT *
	FROM SINHVIEN
	WHERE MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVTheoMaLop]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVTheoMaLop]
	@maLop varchar(50)
AS
BEGIN
	SELECT *
	FROM SINHVIEN sv
	WHERE sv.MaLop = @maLop
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSiSoLop]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSiSoLop]
	@maLop varchar(50)
AS
BEGIN
	SELECT COUNT(sv.MaSV)
	FROM SINHVIEN sv
	WHERE sv.MaLop = @maLop
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMSSV]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMSSV]
AS
BEGIN
	SELECT MaSV
	FROM SINHVIEN
END
GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[MaGV] [varchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[ThuocMaKhoa] [varchar](50) NULL,
	[HocVi] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT] [varchar](11) NULL,
 CONSTRAINT [PK_GIANGVIEN_1] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'ABC', N'Vĩ Minh', N'002', N'Thạc Sỹ', N'Quận 5- TPhCM', N'16514564644')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'ADMIN', N'Giám đốc Trung tâm Công Nghệ Phần Mềm', NULL, N'Tiến Sĩ', N'Thủ Đức, Hồ Chí Minh', N'0987654321')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'DHN', N'Đinh Huy Nhân', N'002', N'Thạc Sỹ', N'Thanh Hóa', N'48731377343')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'GV001', N'Nguyễn Minh Đạo', NULL, N'Tiến Sĩ', N'Thủ Đức, Hồ Chí Minh', N'0912333333')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'GV002', N'Nguyễn Minh Đạo', N'001', N'Tiến Sĩ', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'GV003', N'Lê Văn Vinh', N'001', N'Tiến Sĩ', N'Hồ Chí Minh', N'0987654321')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'LLT', N'Kim Thanh', N'001', N'cử nhân', N'Đồng Xoài-Bình Phước', N'01686256256')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'MSI', N'Công Đoan', N'001', N'Tiến Sỹ', N'Ninh Bình', N'65489796434')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'NMC', N'Minh Châu', N'001', N'Thạc Sỹ', N'Bạc Liêu', N'87546876654')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'PET', N'Minh Đạo', N'002', N'Thạc Sỹ', N'Quận 1-TP HCM', N'21151665486')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'PTT', N'Phương Thảo', N'002', N'Thạc Sỹ', N'Buôn Ma Thuật-Đắc Lắc', N'45465464667')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'RES', N'Đức Dũng', N'001', N'Tiến Sỹ', N'Nam Đàn- Nghệ An', N'23032035131')
INSERT [dbo].[GIANGVIEN] ([MaGV], [TenGV], [ThuocMaKhoa], [HocVi], [DiaChi], [SDT]) VALUES (N'TCT', N'Trần Công Tú', N'001', N'Thạc Sỹ', N'TPHCM', N'45484545745')
/****** Object:  StoredProcedure [dbo].[spXoaGiangVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaGiangVien]
    @magv varchar(50)
AS
BEGIN
     DELETE FROM GIANGVIEN WHERE MaGV = @magv
END
GO
/****** Object:  StoredProcedure [dbo].[spThemGiangVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemGiangVien]
    @magv varchar(50),
    @tengv nvarchar(50),
    @thuocmakhoa varchar(50),
    @hocvi nvarchar(50),
    @diachi nvarchar(200),
    @sdt varchar(11)
AS
BEGIN
     INSERT INTO GIANGVIEN VALUES (@magv, @tengv, @thuocmakhoa,
     @hocvi, @diachi, @sdt)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaGiangVien]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaGiangVien]
    @magv varchar(50),
    @tengv nvarchar(50),
    @thuocmakhoa varchar(50),
    @hocvi nvarchar(50),
    @diachi nvarchar(200),
    @sdt varchar(11)
AS
BEGIN
     UPDATE GIANGVIEN SET TenGV = @tengv, ThuocMaKhoa = @thuocmakhoa,
     HocVi = @hocvi, DiaChi = @diachi, SDT = @sdt
     WHERE MaGV = @magv
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMaGV]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMaGV]
AS
BEGIN
	SELECT MaGV
	FROM GIANGVIEN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetGVTheoMaKhoa]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetGVTheoMaKhoa]
	@maKhoa varchar(50)
AS
BEGIN
	SELECT *
	FROM GIANGVIEN
	WHERE ThuocMaKhoa = @maKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[spGetGVTheoMaGV]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetGVTheoMaGV]
	@maGV varchar(50)
AS
BEGIN
	SELECT *
	FROM GIANGVIEN
	WHERE MaGV = @maGV
END
GO
/****** Object:  Table [dbo].[DSSV_HDRENLYEN]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSSV_HDRENLYEN](
	[MaSV] [varchar](8) NOT NULL,
	[MaHD] [varchar](50) NOT NULL,
	[CoThamGia] [bit] NULL,
 CONSTRAINT [PK_DSSV_HDRENLYEN] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110001', N'111', 0)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110001', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110001', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110001', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110002', N'222', 0)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110002', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110002', N'444', 0)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110002', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110002', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110003', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110003', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110003', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110003', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110004', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110004', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110004', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110004', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110005', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110005', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110005', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110005', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110005', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110006', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110006', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110006', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110006', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110006', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110007', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110007', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110007', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110007', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110007', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110008', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110008', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110008', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110009', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110009', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110009', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110009', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110009', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110010', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110010', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110010', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110011', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110012', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110013', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110014', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110016', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110017', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110018', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110019', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110020', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110020', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110020', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110021', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110021', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110021', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110021', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110021', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'444', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110022', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110023', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110023', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110023', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110023', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110023', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110025', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110025', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110025', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110025', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110025', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110026', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110027', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110028', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110029', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110030', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110030', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110030', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110030', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110030', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110031', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110031', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110031', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110031', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110032', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110033', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110033', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110033', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110033', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110033', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110034', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110034', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110034', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110034', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110034', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110035', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110036', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110036', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110036', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110037', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110038', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110038', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110038', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110038', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'123', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'666', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110039', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'124', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'432', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'444', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'456', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'555', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'666', 0)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'777', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'888', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110544', N'999', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'111', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'222', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'333', 1)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'432', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'444', NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'555', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16110573', N'666', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16610015', N'444', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16610015', N'555', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16610015', N'666', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16610015', N'777', NULL)
INSERT [dbo].[DSSV_HDRENLYEN] ([MaSV], [MaHD], [CoThamGia]) VALUES (N'16610015', N'888', NULL)
/****** Object:  StoredProcedure [dbo].[spXoaDSSV_HDRL]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaDSSV_HDRL]
	@maSV varchar(8),
	@MaHDRL varchar(50)
AS
BEGIN
	DELETE FROM DSSV_HDRENLYEN
	WHERE MaHD = @MaHDRL and MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spThemDSSV_HDRL]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemDSSV_HDRL]
	@maSV varchar(8),
	@MaHDRL varchar(50),
	@coMat bit
AS
BEGIN
	INSERT INTO DSSV_HDRENLYEN VALUES(@maSV, @MaHDRL, @coMat)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVByMaSV_MaHDRL]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVByMaSV_MaHDRL]
	@maSV varchar(8),
	@MaHDRL varchar(50)
AS
BEGIN
	SELECT *
	FROM DSSV_HDRENLYEN
	WHERE MaSV = @maSV and MaHD = @MaHDRL
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVByMaRL]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVByMaRL]
	@MaHD varchar(50)
AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.GioiTinh, sv.MaLop, ds.CoThamGia
	FROM DSSV_HDRENLYEN ds join SINHVIEN sv on (sv.MaSV = ds.MaSV)
	WHERE ds.MaHD = @MaHD
END
GO
/****** Object:  Table [dbo].[DSSV_HDCTXH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSSV_HDCTXH](
	[MaSV] [varchar](8) NOT NULL,
	[MaHDCTXH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DSSV_HDCTXH] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaHDCTXH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110001', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110001', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110001', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110002', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110002', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110002', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110002', N'CTXH005')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110002', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110003', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110003', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110003', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110003', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110004', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110004', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110004', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110005', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110005', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110005', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110005', N'CTXH005')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110006', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110006', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110007', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110007', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110007', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110008', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110009', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110009', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110010', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110017', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110032', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH002')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH003')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH004')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH005')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110544', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110573', N'CTXH001')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110573', N'CTXH005')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16110573', N'CTXH006')
INSERT [dbo].[DSSV_HDCTXH] ([MaSV], [MaHDCTXH]) VALUES (N'16146001', N'CTXH002')
/****** Object:  StoredProcedure [dbo].[spXoaDSSV_HDCTXH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaDSSV_HDCTXH]
	@maHD varchar(50),
	@maSV varchar(8)
AS
BEGIN
	DELETE FROM DSSV_HDCTXH
	WHERE MaHDCTXH = @maHD and MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spThemDSSV_HDCTXH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemDSSV_HDCTXH]
	@maHD varchar(50),
	@maSV varchar(8)
AS
BEGIN
	INSERT INTO DSSV_HDCTXH VALUES(@maSV, @maHD)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVByMaSV_MaHDCTXH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVByMaSV_MaHDCTXH]
	@maHD varchar(50),
	@maSV varchar(8)
AS
BEGIN
	SELECT * 
	FROM DSSV_HDCTXH
	WHERE MaHDCTXH = @maHD and MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVByMaCTXH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVByMaCTXH]
	@maHD varchar(50)
AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.GioiTinh, sv.MaLop
	FROM DSSV_HDCTXH ds join SINHVIEN sv on (ds.MaSV = sv.MaSV)
	WHERE ds.MaHDCTXH = @maHD
END
GO
/****** Object:  Table [dbo].[DIEMTHI]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIEMTHI](
	[MaSV] [varchar](8) NOT NULL,
	[MaHP] [varchar](50) NOT NULL,
	[DiemGiuaKy] [decimal](18, 2) NULL,
	[DiemCuoiKy] [decimal](18, 2) NULL,
	[DaDongHP] [bit] NULL,
 CONSTRAINT [PK_DIEMTHI] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaHP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110001', N'CCT', CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110001', N'KTT', CAST(4.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110001', N'LVM', CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110001', N'TLH', CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'HHD', CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'KTT', CAST(3.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'NLT', CAST(1.23 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'TCC', CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'TLH', CAST(8.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110002', N'XYZ', CAST(5.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'CCT', CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'DST', CAST(2.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'HHD', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'KTT', CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'NLT', CAST(2.34 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110003', N'XYZ', CAST(6.00 AS Decimal(18, 2)), CAST(6.60 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110004', N'LPV', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110004', N'LVM', CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110004', N'NLT', CAST(1.23 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110004', N'TLH', CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110004', N'WLT', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110005', N'KTT', CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110005', N'LPV', CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110005', N'NLT', CAST(6.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110005', N'TCC', CAST(3.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110005', N'TLH', CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110006', N'DST', CAST(9.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110006', N'HHD', CAST(5.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110006', N'LVM', CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110006', N'NLT', CAST(8.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110006', N'TCC', CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'CCT', CAST(4.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'KTT', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'LPV', CAST(9.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'NLT', CAST(5.32 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'TCC', CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110007', N'WLT', CAST(3.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110008', N'DST', CAST(6.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110008', N'KTT', CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110008', N'LVM', CAST(7.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110008', N'TLH', CAST(5.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110008', N'WLT', CAST(3.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'CCT', CAST(9.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'DST', CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'HHD', CAST(8.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'LVM', CAST(7.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'NLT', CAST(9.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110009', N'TCC', CAST(7.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110010', N'CCT', CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110010', N'HHD', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110010', N'NLT', CAST(4.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110010', N'TCC', CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110010', N'WLT', CAST(8.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110011', N'DST', CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110011', N'LPV', CAST(7.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110011', N'NLT', CAST(9.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110011', N'TCC', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110011', N'WLT', CAST(8.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110012', N'CCT', CAST(6.30 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110012', N'HHD', CAST(8.00 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110012', N'KTT', CAST(5.50 AS Decimal(18, 2)), CAST(4.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110012', N'LVM', CAST(4.25 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110012', N'TCC', CAST(8.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110013', N'DST', CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110013', N'LPV', CAST(3.25 AS Decimal(18, 2)), CAST(7.25 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110013', N'LVM', CAST(7.75 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110013', N'NLT', CAST(4.50 AS Decimal(18, 2)), CAST(6.75 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110013', N'WLT', CAST(4.75 AS Decimal(18, 2)), CAST(3.25 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110014', N'CCT', CAST(5.75 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110014', N'DST', CAST(3.25 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110014', N'KTT', CAST(4.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110014', N'LPV', CAST(7.25 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110014', N'TLH', CAST(6.20 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110016', N'HHD', CAST(3.75 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110016', N'LPV', CAST(5.25 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110016', N'LVM', CAST(5.50 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110016', N'NLT', CAST(8.25 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110016', N'TLH', CAST(4.50 AS Decimal(18, 2)), CAST(6.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110017', N'CCT', CAST(6.50 AS Decimal(18, 2)), CAST(3.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110017', N'DST', CAST(3.25 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110017', N'NLT', CAST(6.00 AS Decimal(18, 2)), CAST(6.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110017', N'TCC', CAST(7.25 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110017', N'WLT', CAST(2.25 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110018', N'CCT', CAST(9.25 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110018', N'HHD', CAST(7.20 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110018', N'LPV', CAST(9.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110018', N'LVM', CAST(6.30 AS Decimal(18, 2)), CAST(9.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110018', N'WLT', CAST(3.25 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110019', N'DST', CAST(3.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110019', N'KTT', CAST(6.25 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110019', N'LVM', CAST(5.00 AS Decimal(18, 2)), CAST(6.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110019', N'NLT', CAST(8.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110019', N'TCC', CAST(6.25 AS Decimal(18, 2)), CAST(4.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110020', N'CCT', CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110020', N'LPV', CAST(6.75 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110020', N'NLT', CAST(8.20 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110020', N'TLH', CAST(4.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110020', N'WLT', CAST(7.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110021', N'DST', CAST(3.25 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110021', N'HHD', CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110021', N'KTT', CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110021', N'LPV', CAST(4.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110021', N'TCC', CAST(6.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110022', N'CCT', CAST(3.75 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110022', N'DST', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110022', N'HHD', CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110022', N'LPV', CAST(4.50 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110022', N'NLT', CAST(1.00 AS Decimal(18, 2)), CAST(8.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110023', N'KTT', CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110023', N'LPV', CAST(3.25 AS Decimal(18, 2)), CAST(6.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110023', N'LVM', CAST(5.00 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110023', N'NLT', CAST(8.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110023', N'TCC', CAST(3.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110024', N'CCT', CAST(9.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110024', N'HHD', CAST(3.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110024', N'LPV', CAST(4.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110024', N'NLT', CAST(6.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110024', N'WLT', CAST(2.50 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110025', N'CCT', CAST(3.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110025', N'DST', CAST(8.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110025', N'KTT', CAST(5.90 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110025', N'NLT', CAST(4.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110025', N'TCC', CAST(8.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110026', N'HHD', CAST(4.50 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110026', N'KTT', CAST(8.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110026', N'NLT', CAST(5.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110026', N'TCC', CAST(7.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110026', N'WLT', CAST(7.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110027', N'CCT', CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110027', N'LPV', CAST(8.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110027', N'NLT', CAST(4.50 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110027', N'TCC', CAST(4.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110027', N'TLH', CAST(6.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110028', N'DST', CAST(2.50 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110028', N'HHD', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110028', N'KTT', CAST(6.75 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110028', N'NLT', CAST(6.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110028', N'TCC', CAST(4.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110029', N'HHD', CAST(6.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110029', N'KTT', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110029', N'LPV', CAST(5.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110029', N'TLH', CAST(3.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110029', N'WLT', CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110030', N'DST', CAST(8.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110030', N'LPV', CAST(7.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110030', N'LVM', CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110030', N'TCC', CAST(4.50 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110030', N'TLH', CAST(9.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110031', N'CCT', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110031', N'LVM', CAST(6.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110031', N'NLT', CAST(5.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110031', N'TCC', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110031', N'WLT', CAST(5.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110032', N'DST', CAST(5.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110032', N'HHD', CAST(2.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110032', N'KTT', CAST(4.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110032', N'LPV', CAST(7.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110032', N'TLH', CAST(6.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110033', N'CCT', CAST(3.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110033', N'LPV', CAST(6.50 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110033', N'NLT', CAST(6.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110033', N'TCC', CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110033', N'TLH', CAST(7.00 AS Decimal(18, 2)), CAST(3.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110034', N'KTT', CAST(6.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110034', N'LPV', CAST(4.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110034', N'LVM', CAST(8.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110034', N'NLT', CAST(2.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110034', N'WLT', CAST(6.00 AS Decimal(18, 2)), CAST(3.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110035', N'CCT', CAST(3.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110035', N'DST', CAST(9.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110035', N'LVM', CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110035', N'NLT', CAST(4.00 AS Decimal(18, 2)), CAST(5.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110035', N'TLH', CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110036', N'CCT', CAST(3.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110036', N'DST', CAST(6.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110036', N'HHD', CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110036', N'LPV', CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110036', N'WLT', CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110037', N'DST', CAST(9.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110037', N'KTT', CAST(8.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110037', N'LVM', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110037', N'NLT', CAST(9.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110037', N'TLH', CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110038', N'KTT', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110038', N'LVM', CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110038', N'NLT', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110038', N'TCC', CAST(5.75 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110038', N'WLT', CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110039', N'DST', CAST(8.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110039', N'HHD', CAST(6.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110039', N'KTT', CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110039', N'LPV', CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110039', N'TCC', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'CCT', CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'DST', CAST(9.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'LVM', CAST(6.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'TCC', CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'WLT', CAST(10.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110544', N'XYZ', CAST(10.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'DST', CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'HHD', CAST(6.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'KTT', CAST(9.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'LVM', CAST(10.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'NLT', CAST(5.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'WLT', CAST(6.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16110573', N'XYZ', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16610015', N'CCT', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16610015', N'HHD', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16610015', N'NLT', CAST(9.88 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16610015', N'TCC', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DIEMTHI] ([MaSV], [MaHP], [DiemGiuaKy], [DiemCuoiKy], [DaDongHP]) VALUES (N'16610015', N'TLH', CAST(2.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), NULL)
/****** Object:  StoredProcedure [dbo].[spXoaDiemThi]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaDiemThi]
	@maSV varchar(8),
	@maHP varchar(50)
AS
BEGIN
	DELETE FROM DIEMTHI
	WHERE MaSV = @maSV and MaHP = @maHP
END
GO
/****** Object:  StoredProcedure [dbo].[spThemDiemThi]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemDiemThi]
	@maHP varchar(50),
	@maSV varchar(8)
AS
BEGIN
	INSERT INTO DIEMTHI VALUES(@maSV, @maHP, null, null, null)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaTinhTrangHP]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaTinhTrangHP]
	@maSV varchar(8),
	@maHP varchar(50),
	@daDongHP bit
AS
BEGIN
	UPDATE DIEMTHI
	SET DaDongHP = @daDongHP
	WHERE MaSV = @maSV and MaHP = @maHP
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaDiemThi]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaDiemThi]
	@maSV varchar(8),
	@maHP varchar(50),
	@diemGK decimal(18,2),
	@diemCK decimal(18,2)
AS
BEGIN
	UPDATE DIEMTHI
	SET DiemGiuaKy = @diemGK, DiemCuoiKy = @diemCK
	WHERE MaSV = @maSV and MaHP = @maHP
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDiemTheoMSSV_MaHP]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDiemTheoMSSV_MaHP]
	@maSV varchar(8),
	@maHP varchar(50)
AS
BEGIN
	SELECT *
	FROM DIEMTHI 
	WHERE MaHP = @maHP and MaSV = @maSV
END
GO
/****** Object:  Table [dbo].[CHUYENNGANH]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHUYENNGANH](
	[MaChuyenNganh] [varchar](50) NOT NULL,
	[TenChuyenNganh] [nvarchar](100) NULL,
	[MaKhoa] [varchar](50) NULL,
 CONSTRAINT [PK_CHUYENNGANH] PRIMARY KEY CLUSTERED 
(
	[MaChuyenNganh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHUYENNGANH] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'BOT', N'Công Nghệ Thông Tin', N'002')
INSERT [dbo].[CHUYENNGANH] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'OTP', N'Điện Tử', N'001')
INSERT [dbo].[CHUYENNGANH] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'PET', N'Cơ Khí Chế tạo Máy', N'001')
INSERT [dbo].[CHUYENNGANH] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'VVT', N'Quản Lí Công Nghiệp', N'002')
INSERT [dbo].[CHUYENNGANH] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'ÐT_CLC', N'Điện-Điện tử CLC', N'001')
/****** Object:  StoredProcedure [dbo].[spXoaChuyenNganh]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaChuyenNganh]
	@maCN varchar(50)
AS
BEGIN
	DELETE FROM CHUYENNGANH
	WHERE MaChuyenNganh = @maCN
END
GO
/****** Object:  StoredProcedure [dbo].[spThemChuyenNganh]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemChuyenNganh]
	@maCN varchar(50),
	@tenChuyenNganh nvarchar(100),
	@maKhoa varchar(50)
AS
BEGIN
	INSERT INTO CHUYENNGANH VALUES (@maCN, @tenChuyenNganh, @maKhoa)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaChuyenNganh]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaChuyenNganh]
	@maCN varchar(50),
	@tenChuyenNganh nvarchar(100),
	@maKhoa varchar(50)
AS
BEGIN
	UPDATE CHUYENNGANH
	SET TenChuyenNganh = @tenChuyenNganh, MaKhoa = @maKhoa
	WHERE MaChuyenNganh = @maCN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCNTheoMaCN]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCNTheoMaCN]
	@maCN varchar(50)
AS
BEGIN
	SELECT *
	FROM CHUYENNGANH
	WHERE MaChuyenNganh = @maCN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCNTheoKhoa]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCNTheoKhoa]
	@maKhoa varchar(50)
AS
BEGIN
	SELECT *
	FROM CHUYENNGANH
	WHERE MaKhoa = @maKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[spGetChuyenNganh]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetChuyenNganh]

AS
BEGIN
	SELECT *
	FROM CHUYENNGANH
END
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [varchar](50) NOT NULL,
	[ChuyenNganh] [varchar](50) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LOP] ([MaLop], [ChuyenNganh]) VALUES (N'005', N'VVT')
INSERT [dbo].[LOP] ([MaLop], [ChuyenNganh]) VALUES (N'006', N'OTP')
INSERT [dbo].[LOP] ([MaLop], [ChuyenNganh]) VALUES (N'007', N'PET')
INSERT [dbo].[LOP] ([MaLop], [ChuyenNganh]) VALUES (N'008', N'BOT')
INSERT [dbo].[LOP] ([MaLop], [ChuyenNganh]) VALUES (N'DDT_CL1', N'ÐT_CLC')
/****** Object:  StoredProcedure [dbo].[spXoaLop]    Script Date: 06/03/2018 12:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaLop]
	@maLop varchar(50)
AS
BEGIN
	DELETE FROM LOP
	WHERE MaLop = @maLop
END
GO
/****** Object:  StoredProcedure [dbo].[spThemLop]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemLop]
	@maLop varchar(50),
	@chuyenNganh varchar(50)
AS
BEGIN
	INSERT INTO LOP VALUES (@maLop, @chuyenNganh)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaLop]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaLop]
	@maLop varchar(50),
	@chuyenNganh varchar(50)
AS
BEGIN
	UPDATE LOP
	SET ChuyenNganh = @chuyenNganh
	WHERE MaLop = @maLop
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLopTheoMaLop]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLopTheoMaLop]
	@maLop varchar(50)
AS
BEGIN
	SELECT *
	FROM LOP
	WHERE MaLop = @maLop
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLopTheoChuyenNganh]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLopTheoChuyenNganh]
	@maCN varchar(50)
AS
BEGIN
	SELECT *
	FROM LOP
	WHERE ChuyenNganh = @maCN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLop]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLop]

AS
BEGIN
	SELECT *
	FROM LOP
END
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [varchar](50) NOT NULL,
	[TenKhoa] [nvarchar](100) NULL,
	[CNKhoa] [varchar](50) NULL,
	[SDTKhoa] [varchar](11) NULL,
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [CNKhoa], [SDTKhoa]) VALUES (N'001', N'Chất Lượng Cao', N'LLT', N'13161131345')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [CNKhoa], [SDTKhoa]) VALUES (N'002', N'Đại Trà', N'ABC', N'21315156456')
/****** Object:  StoredProcedure [dbo].[spXoaKhoa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaKhoa]
	@maKhoa varchar(50)
AS
BEGIN
	DELETE FROM KHOA
	WHERE MaKhoa = @maKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[spThemKhoa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemKhoa]
	@maKhoa varchar(50),
	@tenKhoa nvarchar(100),
	@truongKhoa varchar(50),
	@SDT varchar(11)
AS
BEGIN
	INSERT INTO KHOA VALUES (@maKhoa, @tenKhoa, @truongKhoa, @SDT)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaKhoa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaKhoa]
	@maKhoa varchar(50),
	@tenKhoa nvarchar(100),
	@truongKhoa varchar(50),
	@SDT varchar(11)
AS
BEGIN
	UPDATE KHOA
	SET TenKhoa = @tenKhoa, CNKhoa = @truongKhoa, SDTKhoa = @SDT
	WHERE MaKhoa = @maKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[spGetKTheoMaKhoa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetKTheoMaKhoa]
	@maKhoa varchar(50)
AS
BEGIN
	SELECT *
	FROM KHOA
	WHERE MaKhoa = @maKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[spGetKhoa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetKhoa]

AS
BEGIN
	SELECT *
	FROM KHOA
END
GO
/****** Object:  Table [dbo].[HOCPHAN]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOCPHAN](
	[MaHP] [varchar](50) NOT NULL,
	[MaMH] [varchar](50) NULL,
	[HocKy] [int] NULL,
	[NamHoc] [char](9) NULL,
	[MaGV] [varchar](50) NULL,
	[SoTC] [int] NULL,
	[HocPhi] [int] NULL,
 CONSTRAINT [PK_HOCPHAN] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'CCT', N'TCC', 1, N'2016-2017', N'NMC', 3, 1950000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'DST', N'NCA', 1, N'2016-2017', N'RES', 4, 2600000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'HHD', N'HDH', 1, N'2016-2017', N'MSI', 4, 2600000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'KTT', N'HDT', 1, N'2016-2017', N'PET', 2, 1300000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'LPV', N'PLD', 1, N'2016-2017', N'DHN', 2, 1300000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'LVM', N'MMT', 2, N'2016-2017', N'ABC', 2, 1300000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'NLT', N'DXT', 1, N'2016-2017', N'TCT', 1, 650000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'TCC', N'NUT', 2, N'2017-2018', N'RES', 4, 2600000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'TLH', N'TVT', 1, N'2016-2017', N'LLT', 3, 1950000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'WLT', N'LTW', 1, N'2017-2018', N'PET', 4, 2600000)
INSERT [dbo].[HOCPHAN] ([MaHP], [MaMH], [HocKy], [NamHoc], [MaGV], [SoTC], [HocPhi]) VALUES (N'XYZ', N'DXT', 2, N'2017-2018', N'TCT', 2, 1200000)
/****** Object:  StoredProcedure [dbo].[spXoaHocPhan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaHocPhan]
    @mahp varchar(50)
AS
BEGIN
     DELETE FROM HOCPHAN WHERE MaHP = @mahp
END
GO
/****** Object:  StoredProcedure [dbo].[spThemHocPhan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemHocPhan]
    @mahp varchar(50),
    @mamh varchar(50),
    @hocky int,
    @namhoc char(9),
    @magv varchar(50),
    @sotc int,
    @hocphi int
AS
BEGIN
     INSERT INTO HOCPHAN VALUES (@mahp, @mamh, @hocky, @namhoc,
     @magv, @sotc, @hocphi)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaHocPhan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaHocPhan]
    @mahp varchar(50),
    @mamh varchar(50),
    @hocky int,
    @namhoc char(9),
    @magv varchar(50),
    @sotc int,
    @hocphi int
AS
BEGIN
     UPDATE HOCPHAN SET MaMH = @mamh, HocKy = @hocky, NamHoc = @namhoc, 
     MaGV = @magv, SoTC = @sotc, HocPhi = @hocphi
     WHERE MaHP = @mahp
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTongNoHPByMaSV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTongNoHPByMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT SUM(hp.HocPhi)AS 'TongNo'
	FROM HOCPHAN hp INNER JOIN DIEMTHI dt on(hp.MaHP = dt.MaHP)
	WHERE dt.MaSV = @maSV and dt.DaDongHP != '1'
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVTheoMaHP]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVTheoMaHP]
	@maHP varchar(50)
AS
BEGIN
	SELECT hp.*, sv.*, dt.DaDongHP, dt.DiemCuoiKy, dt.DiemGiuaKy
	FROM HOCPHAN hp join DIEMTHI dt on(dt.MaHP = hp.MaHP) join SINHVIEN sv on (sv.MaSV = dt.MaSV)
	WHERE hp.MaHP = @maHP
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVNoHocPhi]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVNoHocPhi]

AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.MaLop, SUM(hp.HocPhi) AS 'TongNoHP'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on(sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE dt.DaDongHP = 'False' or dt.DaDongHP = null
	GROUP BY sv.MaSV, sv.HoTen, sv.MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNamHoc]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetNamHoc]
	
AS
BEGIN
	SELECT DISTINCT NamHoc
	FROM HOCPHAN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHPTheoMaHP]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHPTheoMaHP]
	@maHP varchar(50)
AS
BEGIN
	SELECT *
	FROM HOCPHAN
	WHERE MaHP = @maHP
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHPByMaSV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHPByMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT hp.MaHP, hp.MaGV, hp.NamHoc, hp.HocKy, hp.SoTC, hp.HocPhi, dt.DaDongHP
	FROM HOCPHAN hp INNER JOIN DIEMTHI dt on(hp.MaHP = dt.MaHP)
	WHERE dt.MaSV = @maSV
	ORDER BY hp.MaHP asc
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHocKy]
	
AS
BEGIN
	SELECT DISTINCT HocKy
	FROM HOCPHAN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHBNhatLop_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHBNhatLop_NamHoc_HocKy]
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT sv.MaLop, sv.MaSV, sv.HoTen, SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTB'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on(sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE hp.NamHoc = @namHoc and hp.HocKy = @hocKy
	GROUP BY sv.MaLop, sv.MaSV, sv.HoTen
	HAVING SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) >= all 
	(
	SELECT SUM((dt2.DiemGiuaKy + dt2.DiemCuoiKy)/2 * hp2.SoTC) / SUM(hp2.SoTC)
	FROM SINHVIEN sv2 INNER JOIN DIEMTHI dt2 on(sv2.MaSV = dt2.MaSV) INNER JOIN HOCPHAN hp2 on(hp2.MaHP = dt2.MaHP)
	WHERE sv2.MaLop = sv.MaLop and hp2.NamHoc = @namHoc and hp2.HocKy = @hocKy
	GROUP BY sv2.MaLop, sv2.MaSV
	)
	ORDER BY sv.MaLop asc
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHBKha_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHBKha_NamHoc_HocKy]
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.MaLop, SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTB'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on(sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE hp.HocKy = @hocKy and hp.NamHoc = @namHoc
	GROUP BY sv.MaSV, sv.HoTen, sv.MaLop
	HAVING SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) < 8.5 and SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) >= 7
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHBGioi_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHBGioi_NamHoc_HocKy]
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.MaLop, SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTB'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on(sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE hp.HocKy = @hocKy and hp.NamHoc = @namHoc
	GROUP BY sv.MaSV, sv.HoTen, sv.MaLop
	HAVING SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) >= 8.5
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDSSVCanhBaoHV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDSSVCanhBaoHV]

AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.MaLop, SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTB'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on (sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	GROUP BY sv.MaSV, sv.HoTen, sv.MaLop
	HAVING SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) <= 3.5
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDiemTBTL_SoTCTL]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDiemTBTL_SoTCTL]
	@maSV varchar(8)
AS
BEGIN
	SELECT SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTBTL', SUM(hp.SoTC) AS 'SoTCTL'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on (sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE sv.MaSV = @maSV and (dt.DiemGiuaKy + dt.DiemCuoiKy)/2 >= 5
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDiemTB_SoTC]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDiemTB_SoTC]
	@maSV varchar(8)
AS
BEGIN
	SELECT SUM((dt.DiemGiuaKy + dt.DiemCuoiKy)/2 * hp.SoTC) / SUM(hp.SoTC) AS 'DTB', SUM(hp.SoTC) AS 'SoTC'
	FROM SINHVIEN sv INNER JOIN DIEMTHI dt on (sv.MaSV = dt.MaSV) INNER JOIN HOCPHAN hp on(hp.MaHP = dt.MaHP)
	WHERE sv.MaSV = @maSV
END
GO
/****** Object:  Table [dbo].[HDRENLUYEN]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HDRENLUYEN](
	[MaHDRL] [varchar](50) NOT NULL,
	[TenHDRL] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[NgayTC] [date] NULL,
	[NamHoc] [varchar](9) NULL,
	[HocKy] [int] NULL,
	[SoDiemRL] [int] NULL,
 CONSTRAINT [PK_HDRENLUYEN] PRIMARY KEY CLUSTERED 
(
	[MaHDRL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'111', N'Thi giọng ca sinh viên', N'Dh SPKT', CAST(0x8E3E0B00 AS Date), N'2017-2018', 1, 10)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'123', N'Bến sắn', N'Bình Dương', CAST(0xCC390B00 AS Date), N'2017-2018', 2, 10)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'124', N'mùa hè xanh', N'tây ninh', CAST(0x563E0B00 AS Date), N'2017-2018', 1, 30)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'222', N'Thi nét đẹp sinh viên', N'Hội trường', CAST(0xBA3D0B00 AS Date), N'2016-2017', 1, 15)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'333', N'Xuân tình nguyện', N'Long An', CAST(0x1D3F0B00 AS Date), N'2016-2017', 1, 20)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'432', N'hội thao', N'sân bóng', CAST(0xD73D0B00 AS Date), N'2016-2017', 2, 5)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'444', N'Sinh Viên 5 tốt', N'Dh SPKT', CAST(0xDD3D0B00 AS Date), N'2016-2017', 2, 15)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'456', N'Maxtering IT', N'Đh SPKT', CAST(0x323E0B00 AS Date), N'2016-2017', 1, 5)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'555', N'Kỉ Niệm 55 năm thành lập trường', N'Sân Trường', CAST(0x363E0B00 AS Date), N'2017-2018', 2, 10)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'666', N'trực khu tự học', N'Khu tư học', CAST(0x563E0B00 AS Date), N'2017-2018', 1, 20)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'777', N'hiến máu', N'Sân việt đức', CAST(0xB13E0B00 AS Date), N'2017-2018', 1, 10)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'888', N'Cổ vũ hoa hậu sinh viên', N'Nhà hát thành phố', CAST(0x363E0B00 AS Date), N'2017-2018', 2, 5)
INSERT [dbo].[HDRENLUYEN] ([MaHDRL], [TenHDRL], [DiaDiem], [NgayTC], [NamHoc], [HocKy], [SoDiemRL]) VALUES (N'999', N'trực kiểm tra thẻ sinh viên', N'Sân việt đức', CAST(0x503E0B00 AS Date), N'2017-2018', 1, 10)
/****** Object:  StoredProcedure [dbo].[spGetTongDiemTruRLByMaSV_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTongDiemTruRLByMaSV_NamHoc_HocKy]
	@maSV varchar(8),
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT SUM(hd.SoDiemRL) AS 'DiemTru'
	FROM DSSV_HDRENLYEN ds join HDRENLUYEN hd on (ds.MaHD = hd.MaHDRL)
	WHERE ds.MaSV = @maSV and hd.NamHoc = @namHoc and hd.HocKy = @hocKy and (ds.CoThamGia = 'False' or ds.CoThamGia = null)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTongDiemCongRLByMaSV_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTongDiemCongRLByMaSV_NamHoc_HocKy]
	@maSV varchar(8),
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT SUM(hd.SoDiemRL) AS 'DiemCong'
	FROM DSSV_HDRENLYEN ds join HDRENLUYEN hd on (ds.MaHD = hd.MaHDRL)
	WHERE ds.MaSV = @maSV and hd.NamHoc = @namHoc and hd.HocKy = @hocKy and ds.CoThamGia = 'True'
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHDRLByMaSV_NamHoc_HocKy]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHDRLByMaSV_NamHoc_HocKy]
	@maSV varchar(8),
	@namHoc varchar(9),
	@hocKy int
AS
BEGIN
	SELECT hd.MaHDRL, hd.TenHDRL, hd.DiaDiem, hd.NgayTC, hd.SoDiemRL, ds.CoThamGia
	FROM DSSV_HDRENLYEN ds join HDRENLUYEN hd on (ds.MaHD = hd.MaHDRL)
	WHERE ds.MaSV = @maSV and hd.NamHoc = @namHoc and hd.HocKy = @hocKy
END
GO
/****** Object:  Table [dbo].[HDCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HDCTXH](
	[MaHDCTXH] [varchar](50) NOT NULL,
	[TenHDCTXH] [nvarchar](100) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[NgayTC] [date] NULL,
	[SoDiemCTXH] [int] NULL,
 CONSTRAINT [PK_HDCTXH] PRIMARY KEY CLUSTERED 
(
	[MaHDCTXH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH001', N'Thăm người già', N'Bình Dương', CAST(0xAC3D0B00 AS Date), 10)
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH002', N'Trại phong - Bến sắn', N'Bình Dương', CAST(0x193E0B00 AS Date), 10)
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH003', N'Đi biển', N'Vũng Tàu', CAST(0x303E0B00 AS Date), 15)
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH004', N'Đi rừng', N'Rừng Cù Lần', CAST(0x373E0B00 AS Date), 20)
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH005', N'Phượt HCMUTE', N'Hà Nội', CAST(0x3F3E0B00 AS Date), 50)
INSERT [dbo].[HDCTXH] ([MaHDCTXH], [TenHDCTXH], [DiaDiem], [NgayTC], [SoDiemCTXH]) VALUES (N'CTXH006', N'Vui chơi', N'Làng Đại học', CAST(0x363E0B00 AS Date), 10)
/****** Object:  StoredProcedure [dbo].[spGetTongDiemHDCTXHByMaSV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTongDiemHDCTXHByMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT SUM(hd.SoDiemCTXH) AS 'TongDiem'
	FROM DSSV_HDCTXH ds join HDCTXH hd on(ds.MaHDCTXH = hd.MaHDCTXH)
	WHERE ds.MaSV = @maSV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSVThieuDiemCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSVThieuDiemCTXH]

AS
BEGIN
	SELECT sv.MaSV, sv.HoTen, sv.MaLop, SUM(hd.SoDiemCTXH) AS 'TongDiemCTXH'
	FROM SINHVIEN sv INNER JOIN DSSV_HDCTXH ds on (ds.MaSV = sv.MaSV) INNER JOIN HDCTXH hd on(hd.MaHDCTXH = ds.MaHDCTXH)
	GROUP BY sv.MaSV, sv.HoTen, sv.MaLop
	HAVING SUM(hd.SoDiemCTXH) < 40
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHDCTXHByMaSV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHDCTXHByMaSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT hd.MaHDCTXH, hd.TenHDCTXH, hd.DiaDiem, hd.NgayTC, hd.SoDiemCTXH
	FROM DSSV_HDCTXH ds join HDCTXH hd on(ds.MaHDCTXH = hd.MaHDCTXH)
	WHERE ds.MaSV = @maSV
END
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMH] [varchar](50) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
 CONSTRAINT [PK_MONHOC] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'DXT', N'Nhập môn Lập trình')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'HDH', N'Hệ Điều Hành')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'HDT', N'Hướng đối tượng')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'LTW', N'Lập trình window')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'MMT', N'Mạng Máy Tính Căn Bản')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'NCA', N'dai so')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'NUT', N'Toan cc1')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'PLD', N'Pháp Luật Đại Cương')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'TCC', N'Toán cc2')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH]) VALUES (N'TVT', N'Tam li')
/****** Object:  StoredProcedure [dbo].[spGetMHTrongHPTheoGV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMHTrongHPTheoGV]
	@maGV varchar(50)
AS
BEGIN
	SELECT DISTINCT mh.MaMH, mh.TenMH
	FROM HOCPHAN hp join MONHOC mh on (hp.MaMH = mh.MaMH)
	WHERE hp.MaGV = @maGV
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMHTrongHP]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMHTrongHP]

AS
BEGIN
	SELECT DISTINCT mh.MaMH, mh.TenMH
	FROM HOCPHAN hp join MONHOC mh on (hp.MaMH = mh.MaMH)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHPTheoMH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHPTheoMH]
	@maMH varchar(50)
AS
BEGIN
	SELECT hp.HocKy, hp.HocPhi, hp.MaGV, hp.MaHP, hp.MaMH, hp.NamHoc, hp.SoTC, mh.TenMH, mh.MaMH AS 'MaMH_MH'
	FROM HOCPHAN hp join MONHOC mh on (mh.MaMH = hp.MaMH)
	WHERE mh.MaMH = @maMH
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDiemTheoMSSV]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDiemTheoMSSV]
	@maSV varchar(8)
AS
BEGIN
	SELECT sv.*, hp.*, dt.DaDongHP, dt.DiemCuoiKy, dt.DiemGiuaKy, mh.TenMH
	FROM DIEMTHI dt join HOCPHAN hp on (dt.MaHP = hp.MaHP) right join SINHVIEN sv on (sv.MaSV = dt.MaSV) left join MONHOC mh on (mh.MaMH = hp.MaMH)
	WHERE sv.MaSV = @maSV
END
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[LoaiUser] [varchar](50) NOT NULL,
	[Ma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TAIKHOAN] ([TaiKhoan], [MatKhau], [LoaiUser], [Ma]) VALUES (N'16110002', N'123', N'SinhVien', N'16110002')
INSERT [dbo].[TAIKHOAN] ([TaiKhoan], [MatKhau], [LoaiUser], [Ma]) VALUES (N'16110544', N'123', N'SinhVien', N'16110544')
INSERT [dbo].[TAIKHOAN] ([TaiKhoan], [MatKhau], [LoaiUser], [Ma]) VALUES (N'admin', N'123', N'Admin', N'ADMIN')
INSERT [dbo].[TAIKHOAN] ([TaiKhoan], [MatKhau], [LoaiUser], [Ma]) VALUES (N'res', N'123', N'GiangVien', N'RES')
/****** Object:  StoredProcedure [dbo].[spXoaTaiKhoan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaTaiKhoan]
	@maTk varchar(20)
AS
BEGIN
	DELETE FROM TAIKHOAN
	WHERE TaiKhoan = @maTk
END
GO
/****** Object:  StoredProcedure [dbo].[spXoaRL]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaRL]
	@MaHDRL varchar(50)
AS
BEGIN
	DELETE FROM HDRENLUYEN
	WHERE MaHDRL = @MaHDRL
END
GO
/****** Object:  StoredProcedure [dbo].[spXoaMonHoc]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaMonHoc]
    @maMH varchar(50)
AS
BEGIN
     DELETE FROM MONHOC
     WHERE MaMH = @maMH
END
GO
/****** Object:  StoredProcedure [dbo].[spThemTaiKhoan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemTaiKhoan]
	@maTk varchar(20),
	@matKhau varchar(50),
	@loaiUser varchar(50),
	@ma varchar(50)
AS
BEGIN
	INSERT INTO TAIKHOAN VALUES (@maTk, @matKhau, @loaiUser, @ma)
END
GO
/****** Object:  StoredProcedure [dbo].[spThemRL]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemRL]
	@MaHDRL varchar(50),
	@TenHDRL nvarchar(50),
	@DiaDiem nvarchar(50),
	@NgayTC date,
	@namHoc varchar(9),
	@hocKy int,
	@SoDiemRL int
AS
BEGIN
	INSERT INTO HDRENLUYEN
	VALUES(@MaHDRL, @TenHDRL, @DiaDiem, @NgayTC, @namHoc, @hocKy, @SoDiemRL)
END
GO
/****** Object:  StoredProcedure [dbo].[spThemMonHoc]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemMonHoc]
    @maMH varchar(50),
    @tenMH nvarchar(50)
AS
BEGIN
     INSERT INTO MONHOC VALUES (@maMH, @tenMH)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaTaiKhoan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaTaiKhoan]
	@maTk varchar(20),
	@matKhau varchar(50),
	@loaiUser varchar(50),
	@magv varchar(50)
AS
BEGIN
	UPDATE TAIKHOAN
	SET MatKhau = @matKhau, LoaiUser = @loaiUser, Ma = @magv
	WHERE TaiKhoan = @maTk
END
GO
/****** Object:  StoredProcedure [dbo].[spXoaCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spXoaCTXH]
	@maHD varchar(50)
AS
BEGIN
	DELETE FROM HDCTXH
	WHERE MaHDCTXH = @maHD
END
GO
/****** Object:  StoredProcedure [dbo].[spThemCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spThemCTXH]
	@MaHDCTXH varchar(50),
	@TenHDCTXH nvarchar(100),
	@DiaDiem nvarchar(50),
	@NgayTC date,
	@SoDiemCTXH int
AS
BEGIN
	INSERT INTO HDCTXH VALUES (@MaHDCTXH, @TenHDCTXH, @DiaDiem, @NgayTC, @SoDiemCTXH)
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaRL]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaRL]
	@MaHDRL varchar(50),
	@TenHDRL nvarchar(50),
	@DiaDiem nvarchar(50),
	@NgayTC date,
	@namHoc varchar(9),
	@hocKy int,
	@SoDiemRL int
AS
BEGIN
	UPDATE HDRENLUYEN
	SET TenHDRL = @TenHDRL, DiaDiem = @DiaDiem, NgayTC = @NgayTC, NamHoc = @namHoc, HocKy = @hocKy, SoDiemRL = @SoDiemRL
	WHERE MaHDRL = @MaHDRL
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaMonHoc]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaMonHoc]
    @maMH varchar(50),
    @tenMH nvarchar(50)
AS
BEGIN
     UPDATE MONHOC SET TenMH = @tenMH
     WHERE MaMH = @maMH
END
GO
/****** Object:  StoredProcedure [dbo].[spgetHDByMaHD]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spgetHDByMaHD]
	@maHD varchar(50)
AS
BEGIN
	SELECT *
	FROM HDCTXH
	WHERE MaHDCTXH = @maHD
END
GO
/****** Object:  StoredProcedure [dbo].[spSuaCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSuaCTXH]
	@MaHDCTXH varchar(50),
	@TenHDCTXH nvarchar(100),
	@DiaDiem nvarchar(50),
	@NgayTC date,
	@SoDiemCTXH int
AS
BEGIN
	UPDATE HDCTXH
	SET TenHDCTXH = @TenHDCTXH, DiaDiem = @DiaDiem, NgayTC = @NgayTC, SoDiemCTXH = @SoDiemCTXH
	WHERE MaHDCTXH = @MaHDCTXH
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByIDPass]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserByIDPass]
	-- Add the parameters for the stored procedure here
	@user varchar(20),
	@pass varchar(50)
AS
BEGIN
	SELECT *
	FROM TAIKHOAN t
	WHERE t.TaiKhoan = @user and t.MatKhau = @pass
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMHTheoMaMH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMHTheoMaMH]
	@maMH varchar(50)
AS
BEGIN
	SELECT *
	FROM MONHOC
	WHERE MaMH = @maMH
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMaHDRL]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMaHDRL]
AS
BEGIN
	SELECT MaHDRL
	FROM HDRENLUYEN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMaHDCTXH]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMaHDCTXH]
AS
BEGIN
	SELECT MaHDCTXH
	FROM HDCTXH
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTKTheoTK]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTKTheoTK]
	@user varchar(20)
AS
BEGIN
	SELECT *
	FROM TAIKHOAN
	WHERE TaiKhoan = @user
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTKTheoMa]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTKTheoMa]
	@ma varchar(50)
AS
BEGIN
	SELECT *
	FROM TAIKHOAN
	WHERE Ma = @ma
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTKTheoLoaiUser]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTKTheoLoaiUser]
	@loaiUser varchar(50)
AS
BEGIN
	SELECT *
	FROM TAIKHOAN
	WHERE LoaiUser = @loaiUser
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTaiKhoan]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTaiKhoan]
AS
BEGIN
	SELECT *
	FROM TAIKHOAN
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMonHoc]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMonHoc]

AS
BEGIN
	SELECT *
	FROM MONHOC mh
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHDRLByMaHD]    Script Date: 06/03/2018 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetHDRLByMaHD]
	@MaHD varchar(50)

AS
BEGIN
	SELECT *
	FROM HDRENLUYEN
	WHERE MaHDRL = @MaHD
END
GO
/****** Object:  Check [CK_SINHVIEN_GioiTinh]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [CK_SINHVIEN_GioiTinh] CHECK  (([GioiTinh]='Nam' OR [GioiTinh]='Nu'))
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [CK_SINHVIEN_GioiTinh]
GO
/****** Object:  Check [CK_SINHVIEN_NgaySinh]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [CK_SINHVIEN_NgaySinh] CHECK  (([NgaySinh]<getdate()))
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [CK_SINHVIEN_NgaySinh]
GO
/****** Object:  Check [CK_Account_LoaiUser]    Script Date: 06/03/2018 12:20:39 ******/
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [CK_Account_LoaiUser] CHECK  (([LoaiUser]='Admin' OR [LoaiUser]='GiangVien' OR [LoaiUser]='SinhVien'))
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [CK_Account_LoaiUser]
GO
/****** Object:  ForeignKey [FK_VIPHAM_SINHVIEN]    Script Date: 06/03/2018 12:20:36 ******/
ALTER TABLE [dbo].[VIPHAM]  WITH CHECK ADD  CONSTRAINT [FK_VIPHAM_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[VIPHAM] CHECK CONSTRAINT [FK_VIPHAM_SINHVIEN]
GO
/****** Object:  ForeignKey [FK_SINHVIEN_LOP]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP]
GO
/****** Object:  ForeignKey [FK_GIANGVIEN_KHOA]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIANGVIEN_KHOA] FOREIGN KEY([ThuocMaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GIANGVIEN_KHOA]
GO
/****** Object:  ForeignKey [FK_DSSV_HDRENLYEN_HDRENLUYEN]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DSSV_HDRENLYEN]  WITH CHECK ADD  CONSTRAINT [FK_DSSV_HDRENLYEN_HDRENLUYEN] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HDRENLUYEN] ([MaHDRL])
GO
ALTER TABLE [dbo].[DSSV_HDRENLYEN] CHECK CONSTRAINT [FK_DSSV_HDRENLYEN_HDRENLUYEN]
GO
/****** Object:  ForeignKey [FK_DSSV_HDRENLYEN_SINHVIEN]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DSSV_HDRENLYEN]  WITH CHECK ADD  CONSTRAINT [FK_DSSV_HDRENLYEN_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[DSSV_HDRENLYEN] CHECK CONSTRAINT [FK_DSSV_HDRENLYEN_SINHVIEN]
GO
/****** Object:  ForeignKey [FK_DSSV_HDCTXH_HDCTXH]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DSSV_HDCTXH]  WITH CHECK ADD  CONSTRAINT [FK_DSSV_HDCTXH_HDCTXH] FOREIGN KEY([MaHDCTXH])
REFERENCES [dbo].[HDCTXH] ([MaHDCTXH])
GO
ALTER TABLE [dbo].[DSSV_HDCTXH] CHECK CONSTRAINT [FK_DSSV_HDCTXH_HDCTXH]
GO
/****** Object:  ForeignKey [FK_DSSV_HDCTXH_SINHVIEN]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DSSV_HDCTXH]  WITH CHECK ADD  CONSTRAINT [FK_DSSV_HDCTXH_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[DSSV_HDCTXH] CHECK CONSTRAINT [FK_DSSV_HDCTXH_SINHVIEN]
GO
/****** Object:  ForeignKey [FK_DIEMTHI_HOCPHAN]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DIEMTHI]  WITH CHECK ADD  CONSTRAINT [FK_DIEMTHI_HOCPHAN] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HOCPHAN] ([MaHP])
GO
ALTER TABLE [dbo].[DIEMTHI] CHECK CONSTRAINT [FK_DIEMTHI_HOCPHAN]
GO
/****** Object:  ForeignKey [FK_DIEMTHI_SINHVIEN]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[DIEMTHI]  WITH CHECK ADD  CONSTRAINT [FK_DIEMTHI_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[DIEMTHI] CHECK CONSTRAINT [FK_DIEMTHI_SINHVIEN]
GO
/****** Object:  ForeignKey [FK_CHUYENNGANH_KHOA]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[CHUYENNGANH]  WITH CHECK ADD  CONSTRAINT [FK_CHUYENNGANH_KHOA] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
GO
ALTER TABLE [dbo].[CHUYENNGANH] CHECK CONSTRAINT [FK_CHUYENNGANH_KHOA]
GO
/****** Object:  ForeignKey [FK_LOP_CHUYENNGANH]    Script Date: 06/03/2018 12:20:38 ******/
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_CHUYENNGANH] FOREIGN KEY([ChuyenNganh])
REFERENCES [dbo].[CHUYENNGANH] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_CHUYENNGANH]
GO
/****** Object:  ForeignKey [FK_KHOA_GIANGVIEN]    Script Date: 06/03/2018 12:20:39 ******/
ALTER TABLE [dbo].[KHOA]  WITH CHECK ADD  CONSTRAINT [FK_KHOA_GIANGVIEN] FOREIGN KEY([CNKhoa])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[KHOA] CHECK CONSTRAINT [FK_KHOA_GIANGVIEN]
GO
/****** Object:  ForeignKey [FK_HOCPHAN_GIANGVIEN]    Script Date: 06/03/2018 12:20:39 ******/
ALTER TABLE [dbo].[HOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_HOCPHAN_GIANGVIEN] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[HOCPHAN] CHECK CONSTRAINT [FK_HOCPHAN_GIANGVIEN]
GO
/****** Object:  ForeignKey [FK_HOCPHAN_MONHOC]    Script Date: 06/03/2018 12:20:39 ******/
ALTER TABLE [dbo].[HOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_HOCPHAN_MONHOC] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MONHOC] ([MaMH])
GO
ALTER TABLE [dbo].[HOCPHAN] CHECK CONSTRAINT [FK_HOCPHAN_MONHOC]
GO
