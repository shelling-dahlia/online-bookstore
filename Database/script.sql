USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 7/14/2021 11:56:39 PM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 7/14/2021 11:57:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [varchar](255) NOT NULL,
	[TITLE] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_STATUS]    Script Date: 7/14/2021 11:57:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_STATUS](
	[ID] [varchar](255) NOT NULL,
	[TYPE] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 7/14/2021 11:57:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[ID] [varchar](255) NOT NULL,
	[ORDERID] [varchar](255) NULL,
	[PRODUCTID] [varchar](255) NULL,
	[QUANTITY] [int] NULL,
	[TOTAL_PRICE] [float] NULL,
	[STATUS] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 7/14/2021 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ID] [varchar](255) NOT NULL,
	[USEREMAIL] [varchar](255) NULL,
	[ADDRESS] [varchar](255) NULL,
	[PHONE] [varchar](100) NULL,
	[TOTAL_PRICE] [float] NULL,
	[ORDER_DATE] [date] NULL,
	[PAYMENT_STATUS] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 7/14/2021 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [varchar](255) NOT NULL,
	[NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[CATEGORY] [varchar](255) NULL,
	[PRICE] [float] NULL,
	[QUANTITY] [int] NULL,
	[LAST_UPDATE] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERROLE]    Script Date: 7/14/2021 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERROLE](
	[ID] [varchar](255) NOT NULL,
	[TYPE] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 7/14/2021 11:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[EMAIL] [varchar](255) NOT NULL,
	[ISVERIFIED] [bit] NOT NULL,
	[SIGNINMETHOD] [varchar](150) NOT NULL,
	[FULLNAME] [varchar](255) NOT NULL,
	[PASSWORD] [varchar](255) NULL,
	[PHONENUMBER] [varchar](100) NOT NULL,
	[ADDRESS] [varchar](255) NOT NULL,
	[ROLEID] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CATEGORY] ([ID], [TITLE]) VALUES (N'C01', N'HISTORY')
INSERT [dbo].[CATEGORY] ([ID], [TITLE]) VALUES (N'C02', N'CHILDREN')
INSERT [dbo].[CATEGORY] ([ID], [TITLE]) VALUES (N'C03', N'OTHERS')
INSERT [dbo].[ORDER_STATUS] ([ID], [TYPE]) VALUES (N'1', N'PENDING')
INSERT [dbo].[ORDER_STATUS] ([ID], [TYPE]) VALUES (N'2', N'FAILED')
INSERT [dbo].[ORDER_STATUS] ([ID], [TYPE]) VALUES (N'3', N'SUCCESS')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'05028f4d-741d-4a55-9076-ef75e1605d88', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B04', 1001, 224173.94999999998, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'10d8292a-2af8-4242-b674-90c9e538c6fc', N'a33aae6b-509e-4310-b673-41332ec3187b', N'B04', 10, 2239.5, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'170626f1-d7c1-404d-9fdd-2fa4fde92a41', N'a33aae6b-509e-4310-b673-41332ec3187b', N'B09', 1, 250.12, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'1d7dad10-5f5a-4ebd-a3fa-e4c9541c055c', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B05', 3, 41.67, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'1de7d311-860d-4dde-8cb0-626d10b4c458', N'f13d660e-4964-4aab-bb60-420788932bf5', N'B04', 1, 223.95, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'1e3b8578-e6e7-4e76-8dfc-748d75079014', N'61f6a3bc-6017-48a0-8f57-63a55432b0c9', N'B04', 2, 447.9, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'279c74c3-c5c7-41c2-a205-68e3c3c60a14', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B01', 1, 23.99, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'28b8cf4e-10b3-4ed9-bf1c-53b5e3082d4d', N'0841f352-d5cb-4ac6-b902-8cdb0e5a67fc', N'B05', 1, 13.89, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'3203d8ad-e3ca-4edc-86c3-b2cfed5eadd4', N'339079bd-f8c9-4423-afb9-f67e0ae54e76', N'B09', 3, 750.36, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'36a5f605-23f5-42d8-bcec-61e78ec33d98', N'e6d36946-089c-47f0-ac74-41f1153ae959', N'B09', 1, 250.12, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'42d721fa-5780-417d-8059-e4b140e058e8', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B06', 1, 50.22, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'4a5d399f-175a-4cc8-99c6-107a95b65181', N'61f6a3bc-6017-48a0-8f57-63a55432b0c9', N'B09', 1, 250.12, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'52621208-652c-4879-8d2e-6fd3b92ddce5', N'e6d36946-089c-47f0-ac74-41f1153ae959', N'B04', 2, 447.9, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'5a78235b-382c-44c0-b9dc-f0d96d480901', N'51a09f3f-6939-4096-9768-3c930784c384', N'B09', 1, 250.12, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'6eb3b98a-f8a4-4866-bd2f-ccfd453788a5', N'a47cfc88-d188-407f-b024-e19412eaae40', N'B05', 10, 138.9, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'968a9d91-cdbc-4b64-9c2d-40a254afb1a5', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B09', 2, 500.24, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'd1b57337-f37c-4950-be97-b4f48bbaa705', N'a47cfc88-d188-407f-b024-e19412eaae40', N'B07', 1, 40.19, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'dad21b7c-f12d-43be-a82b-f7d7547d8f07', N'61f6a3bc-6017-48a0-8f57-63a55432b0c9', N'B05', 3, 41.67, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'db1586b3-8ca6-4953-9147-d0259b421ca6', N'a47cfc88-d188-407f-b024-e19412eaae40', N'B06', 1, 50.22, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'e36c9382-a689-4e4d-bdc3-c5756091ae64', N'c1e29557-f711-44ce-9707-992eb21a6cd9', N'B08', 1, 103.99, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'e8462288-2dd1-458d-a99b-0f8ab0c63983', N'a47cfc88-d188-407f-b024-e19412eaae40', N'B09', 1, 250.12, N'1')
INSERT [dbo].[ORDERDETAIL] ([ID], [ORDERID], [PRODUCTID], [QUANTITY], [TOTAL_PRICE], [STATUS]) VALUES (N'ebc019dc-7002-447f-86b2-e359a6084938', N'339079bd-f8c9-4423-afb9-f67e0ae54e76', N'B04', 4, 895.8, N'1')
INSERT [dbo].[ORDERS] ([ID], [USEREMAIL], [ADDRESS], [PHONE], [TOTAL_PRICE], [ORDER_DATE], [PAYMENT_STATUS]) VALUES (N'a33aae6b-509e-4310-b673-41332ec3187b', N'shelling4869.holmes@gmail.com', N'Thu Duc', N'0901951676', 2489.62, CAST(N'2021-07-14' AS Date), 1)
INSERT [dbo].[ORDERS] ([ID], [USEREMAIL], [ADDRESS], [PHONE], [TOTAL_PRICE], [ORDER_DATE], [PAYMENT_STATUS]) VALUES (N'a47cfc88-d188-407f-b024-e19412eaae40', N'shelling4869.holmes@gmail.com', N'Thu Duc', N'0901951676', 479.43, CAST(N'2021-07-11' AS Date), 1)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B01', N'HARRY POTTER', N'Fantastic Beasts and Where to find them', N'C02', 23.99, 115, CAST(N'2020-12-12' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B02', N'IN PRAISE OF SHADOW', N'An essay on Japanese aesthetics', N'C03', 13.99, 60, CAST(N'2018-10-03' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B03', N'CARDS ON THE TABLE', N'A detective story of Agatha Christie', N'C03', 199.99, 120, CAST(N'2021-01-09' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B04', N'THE HOBBIT', N'The Lord of the Rings', N'C01', 223.95, 88, CAST(N'2019-10-12' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B05', N'THE THORN BIRDS', N'A famous love story arround the world', N'C01', 13.89, 200, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B06', N'TOTO-CHAN', N'The little girl at the Window', N'C02', 50.22, 188, CAST(N'2018-02-12' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B07', N'LE PETIT PRINCE', N' A novella by French aristocrat, writer, and aviator Antoine de Saint-Exupéry', N'C02', 40.19, 119, CAST(N'2021-02-07' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B08', N'SHERLOCK HOLMES', N'One of the most famost detective story in XIX century', N'C03', 103.99, 69, CAST(N'2013-05-12' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B09', N'HAMLET', N'A famous play written by William /shakespeare', N'C01', 250.12, 299, CAST(N'2019-08-12' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [CATEGORY], [PRICE], [QUANTITY], [LAST_UPDATE]) VALUES (N'B10', N'THE SILENCE OF THE LAMBS', N'One of the episode in Hanibal serie', N'C03', 150.11, 194, CAST(N'2019-03-05' AS Date))
INSERT [dbo].[USERROLE] ([ID], [TYPE]) VALUES (N'1', N'ADMIN')
INSERT [dbo].[USERROLE] ([ID], [TYPE]) VALUES (N'2', N'USER')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'lamtoto45@gmail.com', 1, N'BUILTIN', N'Lam 2', N'123456', N'0123456789', N'Quang Ngai City', N'2')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'nhu123@gmail.com', 1, N'BUILTIN', N'Nhu', N'1231233', N'0123456789', N'FPT University', N'2')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'nhultse150213@fpt.edu.vn', 1, N'GOOGLE_SIGNIN', N'Lam Tam Nhu', NULL, N'0901951468', N'Ho Chi Minh City', N'2')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'shelling@gmail.com', 1, N'BUILTIN', N'Shelling', N'1', N'0901971454', N'45, Nguyen Dinh Chieu, Quan 3, HCM', N'1')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'shelling4869.holmes@gmail.com', 1, N'GOOGLE_SIGNIN', N'Shelling', NULL, N'0901951676', N'Thu Duc', N'2')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'slimair.co@gmail.com', 1, N'GOOGLE_SIGNIN', N'Slim Air Company', NULL, N'0901479650', N'Viet Nam', N'1')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'tamnhulam@gmail.com', 1, N'BUILTIN', N'Lam Tam Nhu', N'nhu123', N'0901951452', N'129/32, Quang Ngai', N'1')
INSERT [dbo].[USERS] ([EMAIL], [ISVERIFIED], [SIGNINMETHOD], [FULLNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [ROLEID]) VALUES (N'vatican42@gmail.com', 0, N'BUILTIN', N'Vatican', N'123456', N'0123456898', N'Thu Duc ', N'2')
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([STATUS])
REFERENCES [dbo].[ORDER_STATUS] ([ID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [ORDER_USERS] FOREIGN KEY([USEREMAIL])
REFERENCES [dbo].[USERS] ([EMAIL])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [ORDER_USERS]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([CATEGORY])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD FOREIGN KEY([ROLEID])
REFERENCES [dbo].[USERROLE] ([ID])
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
