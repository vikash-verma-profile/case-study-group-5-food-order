USE [master]
GO
/****** Object:  Database [fooddb]    Script Date: 7/24/2022 6:41:46 PM ******/
CREATE DATABASE [fooddb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'foodb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'foodb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [fooddb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fooddb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fooddb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fooddb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fooddb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fooddb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fooddb] SET ARITHABORT OFF 
GO
ALTER DATABASE [fooddb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fooddb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fooddb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fooddb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fooddb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fooddb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fooddb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fooddb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fooddb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fooddb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [fooddb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fooddb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fooddb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fooddb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fooddb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fooddb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fooddb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fooddb] SET RECOVERY FULL 
GO
ALTER DATABASE [fooddb] SET  MULTI_USER 
GO
ALTER DATABASE [fooddb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fooddb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fooddb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fooddb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fooddb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fooddb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'fooddb', N'ON'
GO
ALTER DATABASE [fooddb] SET QUERY_STORE = OFF
GO
USE [fooddb]
GO
/****** Object:  Table [dbo].[FoodDetails]    Script Date: 7/24/2022 6:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[restaurantName] [varchar](100) NULL,
	[foodName] [varchar](100) NULL,
	[foodImage] [varchar](100) NULL,
	[foodDescription] [varchar](100) NULL,
	[place] [varchar](100) NULL,
	[foodMrp] [decimal](18, 2) NULL,
	[foodDiscount] [decimal](18, 2) NULL,
	[foodFinal] [decimal](18, 2) NULL,
	[foodQuantity] [int] NULL,
	[IsActive] [int] NULL,
	[restaurantUserName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodDetailsAdmin]    Script Date: 7/24/2022 6:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodDetailsAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[restaurantName] [varchar](100) NULL,
	[foodName] [varchar](100) NULL,
	[foodImage] [varchar](100) NULL,
	[foodDescription] [varchar](100) NULL,
	[place] [varchar](100) NULL,
	[foodMrp] [decimal](18, 2) NULL,
	[foodDiscount] [decimal](18, 2) NULL,
	[foodFinal] [decimal](18, 2) NULL,
	[foodQuantity] [int] NULL,
	[IsActive] [int] NULL,
	[RestaurantUserName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailTbl]    Script Date: 7/24/2022 6:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NULL,
	[FoodDescription] [nvarchar](100) NULL,
	[OrderId] [int] NULL,
	[RestaurantName] [nvarchar](100) NULL,
	[RestaurantEmail] [nvarchar](100) NULL,
	[FoodQty] [int] NULL,
	[FoodMrp] [decimal](18, 0) NULL,
	[FoodFinal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetailTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTbl]    Script Date: 7/24/2022 6:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTbl](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[firstName] [varchar](100) NULL,
	[lastName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNo] [varchar](10) NULL,
	[paymentmode] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[UserName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterTbl]    Script Date: 7/24/2022 6:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterTbl](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[PhoneNo] [int] NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[IsAdmin] [int] NULL,
	[IsRestaurant] [int] NULL,
	[RestaurantName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [fooddb] SET  READ_WRITE 
GO
