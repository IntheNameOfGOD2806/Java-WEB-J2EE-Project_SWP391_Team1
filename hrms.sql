USE [master]
GO
/****** Object:  Database [HRMS]    Script Date: 10-Nov-23 20:35:35 ******/
CREATE DATABASE [HRMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUYNX\MSSQL\DATA\HRMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HRMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUYNX\MSSQL\DATA\HRMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HRMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HRMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HRMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HRMS] SET  MULTI_USER 
GO
ALTER DATABASE [HRMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HRMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HRMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HRMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [HRMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HRMS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Balance] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[AdsID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[AdsFee] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateDate] [date] NULL,
	[brief_infor] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constract]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constract](
	[ConstractID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConstractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[NumberOfRoom] [int] NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[ElectricalFee] [money] NOT NULL,
	[WaterFee] [money] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House Category]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House Category](
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House Feedback]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[HouseID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[ParentID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[ImageName] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileID] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[DOB] [datetime] NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[RequestDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10-Nov-23 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[AccountID] [int] NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Area] [int] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (1, N'admin1', N'f5e98b4132faecbdb14f171504c3e185', 1, 1, 1, NULL)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (2, N'tenant1', N'ec2e23da26c007e3c2db12736fdb0ec0', 2, 2, 1, NULL)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (3, N'tenant2', N'a4f326122b77bea6588c6aeedccbeb89', 2, 3, 1, NULL)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (4, N'tenant3', N'3aa0efd3500aeeaa2c0a580476f0669e', 2, 4, 1, NULL)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (5, N'landlord1', N'6c759e969526f34495eb9961108d6f0e', 3, 5, 1, 3000000.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (6, N'landlord2', N'69ff6ae53fa271391c18fe847560cfe8', 3, 6, 1, 3366666.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (7, N'landlord3', N'9c502ba0d676abed43de90031988708a', 3, 7, 1, 3000000.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (8, N'landlord4', N'66a30885fae4dd8117898c8947427405', 3, 8, 1, 3000000.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (9, N'landlord5', N'47bc24dd2bbabaf21db9aff02c6ddc03', 3, 9, 1, 3000000.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (10, N'marketing1', N'c1286affc9411db15c9d5b06481e5b07', 4, 10, 1, 100000.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (11, N'marketing2', N'06cb994b5078eab932e739d9986df38f', 4, 11, 1, 0.0000)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [RoleID], [ProfileID], [Status], [Balance]) VALUES (12, N'marketing3', N'9170eddf81a51523d044c395cc5cf2a3', 4, 12, 1, 0.0000)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 
GO
INSERT [dbo].[Advertisement] ([AdsID], [HouseID], [AdsFee], [StartDate], [EndDate], [Status]) VALUES (1, 3, 50000.0000, CAST(N'2023-10-15T00:00:00.000' AS DateTime), CAST(N'2023-10-22T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Advertisement] ([AdsID], [HouseID], [AdsFee], [StartDate], [EndDate], [Status]) VALUES (2, 4, 190000.0000, CAST(N'2023-10-15T00:00:00.000' AS DateTime), CAST(N'2023-11-14T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Advertisement] ([AdsID], [HouseID], [AdsFee], [StartDate], [EndDate], [Status]) VALUES (3, 5, 500000.0000, CAST(N'2023-09-10T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([BlogID], [AccountID], [Title], [Content], [CreateDate], [brief_infor], [Photo], [Status]) VALUES (1, 1, N'Demo ', N'<p>Em của ngày hôm kia</p><p><img src="/marketing/assets/images/blog/57051494-3210-49f7-acf6-1f1e8bdaf82b.png"></p>', CAST(N'2023-11-06' AS Date), N'Demo Post Blog', N'/marketing/assets/images/blog/ba8de98d-5adb-4906-a860-91dcb2c467ef.png', 0)
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Constract] ON 
GO
INSERT [dbo].[Constract] ([ConstractID], [AccountID], [RoomID], [StartDate], [EndDate], [Status]) VALUES (1, 2, 1, CAST(N'2023-10-10T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Constract] ([ConstractID], [AccountID], [RoomID], [StartDate], [EndDate], [Status]) VALUES (2, 3, 2, CAST(N'2023-10-11T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Constract] ([ConstractID], [AccountID], [RoomID], [StartDate], [EndDate], [Status]) VALUES (3, 4, 3, CAST(N'2023-10-12T00:00:00.000' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Constract] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (1, 6, N'Tony House', N'ngõ 69, đường Mục Uyên - Công Nghệ, xã Tân Xã', 1, N'- 1 phòng gồm có: Giường, tủ, bàn ghế, điều hòa, bình nóng lạnh, bếp từ, tủ bếp, tủ lạnh, quạt trần, kệ nấu nướng.\n- Tiện ích: Hầm để xe, thang máy, máy giặt, khóa vân tay tòa nhà, khóa cửa phòng - Smartlock, bảo vệ 24/24.', 10, N'Hanoi', 3000.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (2, 6, N'Hoàng Nam 2', N'Thôn Bình Yên, Xã Thạch Thất, Hà Nội', 1, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3km - 1 phòng gồm có: Giường đôi 1,8m, đệm, tủ quần áo, bàn học đôi, kệ sách, bình nóng lạnh, tủ lạnh máy giặt, điều hoà, bếp từ.\n- Tiện ích: Thang máy, cửa vân tay, khép kín 100%, không gian 3 mặt thoáng đầy đủ ánh nắng vào phòng, có chỗ nấu ăn riêng tách biệt với phòng ngủ, 1 phòng ở được từ 2 – 3 người; gần chợ, bưu điện, nhà thuốc.', 4, N'Hanoi', 3000.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (3, 7, N'SmallHouse', N'154 thôn 3, Thạch Hoà', 1, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 200-300 m.\n- Diện tích: 20 m2.\n- 1 phòng gồm có: Giường, Điều hoà, nóng lạnh, máy giặt, tủ.\n- Tiện ích: khóa vân tay, bảo vệ 24/24.', 10, N'Hanoi', 3000.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (4, 8, N'Green Home', N'Khu TDC Bắc Phú Cát, Thạch Hòa, Thạch Thất, Hà Nội', 2, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3,5 - 4km.\n- Diện tích: 20 - 26m2.\n- 1 phòng gồm có: Giường, tủ, bàn ghế, điều hòa, bình nóng lạnh, bếp và tủ bếp, tủ lạnh, máy giặt- Tiện ích: Hầm để xe, thang máy, khóa vân tay, bảo vệ 24/24, caffe trên tầng 10, trung tâm tiếng anh tầng 1-2', 4, N'Hanoi', 3000.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (5, 9, N'Lake View', N'Thôn Mục Uyên, xã Tân Xã', 2, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3,4km.\n- 1 phòng gồm có: Giường, tủ, bàn ghế, điều hòa, bình nóng lạnh, bếp và tủ bếp, tủ lạnh, máy giặt - Tiện ích: Hầm để xe, thang máy, khóa vân tay, bảo vệ 24/24, caffe trên tầng 10, trung tâm tiếng anh tầng 1-2', 10, N'Hanoi', 3000.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (6, 8, N'Cốm Saximi', N'Số nhà 26, ngõ 52, đường Tân Xã-Hạ Bằng, xã Tân xã, Thạch Thất, Hà Nội', 2, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3km.\n- 1 phòng gồm có: phòng ngủ, phòng khách, gác xép, tủ lạnh, giường, tủ quần áo, bàn ăn, điều hòa, bình nóng lạnh, bàn học, bàn bếp, ban công. - Tiện ích: Khóa vân tay, thang máy, thang thoát hiểm, chỗ để xe rộng rãi, dịch vụ vui chơi giải trí tại tầng 1.', 10, N'Hanoi', 2800.0000, 50000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (7, 9, N'Mến Thảo', N'Thôn 2, Tái định cư Thạch Hoà, Thạch Thất, Hà Nội.', 3, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3,5km.\n- 1 phòng gồm có: Giường đôi, tủ quần áo, bàn học đôi, bình nóng lạnh, điều hoà. - Tiện ích: Khóa vân tay, bảo vệ 24/24.', 10, N'Hanoi', 2800.0000, 100000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (8, 6, N'White House', N'Thôn Kim Bông, xã Tân Xã, Thạch Thất, Hà Nội', 3, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3,9km.\n- 1 phòng gồm có: Giường, tủ, bàn ghế, điều hòa, bình nóng lạnh, bàn học, ban công có bếp, giá phơi quần áo,...\n- Tiện ích: Hầm để xe, thang máy, máy giặt, khóa vân tay, bảo vệ 24/24.', 10, N'Hanoi', 2800.0000, 100000.0000, 1)
GO
INSERT [dbo].[House] ([HouseID], [AccountID], [Name], [Address], [CategoryID], [Description], [NumberOfRoom], [City], [ElectricalFee], [WaterFee], [Status]) VALUES (9, 7, N'Sky Home', N'Khu TĐC Bắc Phú Cát, xã Thạch Hòa, Thạch Thất, Hà Nội', 3, N'- Khoảng cách từ phòng trọ đến ĐH FPT: 3km.\n- 1 phòng gồm có: Giường, tủ, bàn ghế, điều hòa, bình nóng lạnh, bàn bếp,...\n- Tiện ích: Hầm để xe, thang máy, máy giặt, khóa vân tay FaceID, siêu thị mini.', 10, N'Hanoi', 2800.0000, 100000.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[House] OFF
GO
INSERT [dbo].[House Category] ([CategoryID], [Description], [Category]) VALUES (1, N'description 1', N'Chung Cư Mini')
GO
INSERT [dbo].[House Category] ([CategoryID], [Description], [Category]) VALUES (2, N'description 2', N'Homestay')
GO
INSERT [dbo].[House Category] ([CategoryID], [Description], [Category]) VALUES (3, N'description 3', N'Xóm trọ')
GO
SET IDENTITY_INSERT [dbo].[House Feedback] ON 
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (1, 2, 1, N'Beautiful', CAST(N'2023-10-10T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (2, 3, 2, N'Lovely', CAST(N'2023-10-11T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (3, 4, 3, N'An ninh tốt', CAST(N'2023-10-12T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (4, 2, 4, N'Yên tĩnh', CAST(N'2023-10-13T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (5, 3, 5, N'Beautiful', CAST(N'2023-10-14T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (6, 4, 6, N'Lovely', CAST(N'2023-10-15T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (7, 2, 7, N'An ninh tốt', CAST(N'2023-10-16T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (8, 3, 8, N'Yên tĩnh', CAST(N'2023-10-17T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (9, 6, 2, N'Thank you very much.', CAST(N'2023-10-16T17:08:28.530' AS DateTime), 2, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (10, 6, 8, N'Ngon', CAST(N'2023-10-19T10:58:29.723' AS DateTime), 8, 1)
GO
INSERT [dbo].[House Feedback] ([FeedbackID], [AccountID], [HouseID], [Description], [CreateDate], [ParentID], [Status]) VALUES (12, 6, 1, N'Thank you', CAST(N'2023-10-23T08:27:00.057' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[House Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (1, 1, N'below', N'images/17(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (2, 2, N'below', N'images/18(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (3, 3, N'below', N'images/20(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (4, 4, N'below', N'images/19(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (5, 5, N'below', N'images/21(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (6, 6, N'below', N'images/22(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (7, 7, N'below', N'images/23(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (8, 8, N'below', N'images/24(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (9, 9, N'below', N'images/25(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (10, 1, NULL, N'images/1(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (11, 2, NULL, N'images/2(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (12, 3, NULL, N'images/2(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (13, 4, NULL, N'images/3(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (14, 5, NULL, N'images/4(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (15, 6, NULL, N'images/5(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (16, 7, NULL, N'images/6(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (17, 8, NULL, N'images/7(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (18, 9, NULL, N'images/8(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (19, 1, NULL, N'images/9(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (20, 2, NULL, N'images/10(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (21, 3, NULL, N'images/11(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (22, 4, NULL, N'images/12(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (23, 5, NULL, N'images/13(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (24, 6, NULL, N'images/14(project).jpg')
GO
INSERT [dbo].[Image] ([ImageID], [HouseID], [ImageName], [ImagePath]) VALUES (25, 7, NULL, N'images/16(project).jpg')
GO
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (1, N'Đức Dương', N'0987654321', CAST(N'1998-05-15T00:00:00.000' AS DateTime), 1, N'Duong@example.com', N'images/avatar/1.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (2, N'Xuân huy', N'0987654322', CAST(N'1998-09-20T00:00:00.000' AS DateTime), 1, N'natstusan@gmail.com', N'images/avatar/1.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (3, N'Hồng Đăng', N'0987654323', CAST(N'1998-03-10T00:00:00.000' AS DateTime), 1, N'huyht9a@gmail.com', N'images/avatar/1.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (4, N'Đạt', N'0987654324', CAST(N'1998-03-11T00:00:00.000' AS DateTime), 1, N'huyht9a@gmail.com', N'images/avatar/2.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (5, N'Thao', N'0987654325', CAST(N'1998-03-12T00:00:00.000' AS DateTime), 1, N'huyht9a@gmail.com', N'images/avatar/2.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (6, N'Quang Minh', N'0987654326', CAST(N'1998-03-07T00:00:00.000' AS DateTime), 1, N'huynxhe170420@fpt.edu.vn', N'images/avatar/2.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (7, N'Hùng', N'0987654327', CAST(N'1998-03-14T00:00:00.000' AS DateTime), 1, N'huynxhe170420@fpt.edu.vn', N'images/avatar/3.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (8, N'Nam', N'0987654328', CAST(N'1990-05-15T00:00:00.000' AS DateTime), 1, N'huynxhe170420@fpt.edu.vn', N'images/avatar/3.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (9, N'Leo Messi', N'0987654329', CAST(N'1998-09-20T00:00:00.000' AS DateTime), 1, N'huynxhe170420@fpt.edu.vn', N'images/avatar/3.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (10, N'Hong', N'0987654330', CAST(N'1998-03-10T00:00:00.000' AS DateTime), 0, N'huytbn@gmail.com', N'images/avatar/4.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (11, N'Peter', N'0987654331', CAST(N'1998-03-11T00:00:00.000' AS DateTime), 1, N'huytbn@gmail.com', N'images/avatar/4.png')
GO
INSERT [dbo].[Profile] ([ProfileID], [FullName], [Phone], [DOB], [Gender], [Email], [Photo]) VALUES (12, N'Viet', N'0987654332', CAST(N'1998-03-12T00:00:00.000' AS DateTime), 1, N'huytbn@gmail.com', N'images/avatar/4.png')
GO
SET IDENTITY_INSERT [dbo].[Request] ON 
GO
INSERT [dbo].[Request] ([RequestID], [AccountID], [RoomID], [RequestDate]) VALUES (1, 2, 1, CAST(N'2023-10-10' AS Date))
GO
INSERT [dbo].[Request] ([RequestID], [AccountID], [RoomID], [RequestDate]) VALUES (2, 3, 2, CAST(N'2023-10-11' AS Date))
GO
INSERT [dbo].[Request] ([RequestID], [AccountID], [RoomID], [RequestDate]) VALUES (3, 4, 3, CAST(N'2023-10-12' AS Date))
GO
INSERT [dbo].[Request] ([RequestID], [AccountID], [RoomID], [RequestDate]) VALUES (4, 2, 4, CAST(N'2023-10-13' AS Date))
GO
INSERT [dbo].[Request] ([RequestID], [AccountID], [RoomID], [RequestDate]) VALUES (5, 3, 5, CAST(N'2023-10-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Tenant')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'LandLord')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Marketing')
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (1, 1, 2, 2900000.0000, NULL, 25, 1)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (2, 1, 3, 4000000.0000, NULL, 35, 1)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (3, 2, 4, 2800000.0000, NULL, 25, 1)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (4, 2, NULL, 3500000.0000, NULL, 32, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (5, 3, NULL, 1190000.0000, NULL, 15, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (6, 3, NULL, 2300000.0000, NULL, 20, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (7, 4, NULL, 3500000.0000, NULL, 20, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (8, 4, NULL, 4500000.0000, NULL, 40, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (9, 5, NULL, 4000000.0000, NULL, 35, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (10, 5, NULL, 5000000.0000, NULL, 41, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (11, 6, NULL, 3500000.0000, NULL, 35, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (12, 6, NULL, 4000000.0000, NULL, 30, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (13, 7, NULL, 2000000.0000, NULL, 25, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (14, 7, NULL, 3000000.0000, NULL, 30, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (15, 8, NULL, 1900000.0000, NULL, 20, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (16, 8, NULL, 2400000.0000, NULL, 25, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (17, 9, NULL, 2300000.0000, NULL, 18, 0)
GO
INSERT [dbo].[Room] ([RoomID], [HouseID], [AccountID], [Price], [Description], [Area], [Status]) VALUES (18, 9, NULL, 2900000.0000, NULL, 27, 0)
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Constract] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[House Feedback] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Request] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Constract]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Constract]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[House Category] ([CategoryID])
GO
ALTER TABLE [dbo].[House Feedback]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[House Feedback]  WITH CHECK ADD FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
USE [master]
GO
ALTER DATABASE [HRMS] SET  READ_WRITE 
GO
