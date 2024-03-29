USE [master]
GO
/****** Object:  Database [PetShelter]    Script Date: 06-May-23 8:09:47 PM ******/
CREATE DATABASE [PetShelter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShelter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetShelter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetShelter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetShelter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PetShelter] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShelter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShelter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShelter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShelter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShelter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShelter] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShelter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetShelter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShelter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShelter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShelter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShelter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShelter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShelter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShelter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShelter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetShelter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShelter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShelter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShelter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShelter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShelter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShelter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShelter] SET RECOVERY FULL 
GO
ALTER DATABASE [PetShelter] SET  MULTI_USER 
GO
ALTER DATABASE [PetShelter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShelter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShelter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShelter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShelter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShelter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetShelter', N'ON'
GO
ALTER DATABASE [PetShelter] SET QUERY_STORE = ON
GO
ALTER DATABASE [PetShelter] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PetShelter]
GO
/****** Object:  Table [dbo].[adoption_requests]    Script Date: 06-May-23 8:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adoption_requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[adopter_name] [varchar](255) NULL,
	[adopter_email] [varchar](255) NULL,
	[adopter_phone] [varchar](255) NULL,
	[adopter_address] [text] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[animal_profiles]    Script Date: 06-May-23 8:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[animal_profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[species] [varchar](255) NULL,
	[breed] [varchar](255) NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NULL,
	[description] [text] NULL,
	[health_records] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donation_requests]    Script Date: 06-May-23 8:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donation_requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pet_name] [varchar](255) NULL,
	[species] [varchar](255) NULL,
	[breed] [varchar](255) NULL,
	[age] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[health_records] [varchar](255) NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adoption_requests] ON 

INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (1, 1, N'Mahmoud Hemeda', N'7ooda@gmail.com', N'01093651823', N'Serag Mall, Nasr City', N'Pending')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (2, 2, N'Ahmed Mohamed', N'Hamoud@gmail.com', N'01235422486', N'Kia Service Center, El Shorouk', N'Accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (3, 3, N'Seif Hussien', N'7os@yahoo.com', N'01135489964', N'10, Kalet Al Roda, Al Manial', N'Accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (4, 3, N'Bassel', N'relentless@gmail.com', N'01100057839', N'18, Abbas Al Akad Corridor, New Cairo 1', N'Rejected')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (16, 13, N'omar hamada', N'aaasda@gmail.com', N'01233432', N'aaaaaaddd', N'accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (17, 13, N'omar', N'sadads', N'012301', N'asda', N'accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (18, 13, N'omarss', N'omaaaa', N'010213131', N'aaddd', N'accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (19, 13, N'aadss', N'aaaaaaaa', N'002333939', N'aaoo', N'accepted')
INSERT [dbo].[adoption_requests] ([id], [animal_id], [adopter_name], [adopter_email], [adopter_phone], [adopter_address], [status]) VALUES (20, 13, N'aosos', N'skdke', N'02030550', N'alls', N'accepted')
SET IDENTITY_INSERT [dbo].[adoption_requests] OFF
GO
SET IDENTITY_INSERT [dbo].[animal_profiles] ON 

INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (1, N'Maw', N'Cat', N'Siamese', 1, N'Female', N'<3', N'Vaccinated')
INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (2, N'Nugget', N'Bird', N'Cockatiel', 1, N'Female', N'Friendly', N'Not vaccinated')
INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (3, N'Jollie', N'Cat', N'Persian', 2, N'Female', N'White', N'Vaccinated')
INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (4, N'Snowy', N'Cat', N'Persian', 7, N'Female', N'White', N'Not vaccinated')
INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (5, N'Covo', N'Cat', N'Persian', 5, N'Male', N'Chunky', N'Vaccinated')
INSERT [dbo].[animal_profiles] ([id], [name], [species], [breed], [age], [gender], [description], [health_records]) VALUES (6, N'Sugar', N'Dog', N'Coton de Tulear', 2, N'Male', N'D O G', N'Vaccinated')
SET IDENTITY_INSERT [dbo].[animal_profiles] OFF
GO
SET IDENTITY_INSERT [dbo].[donation_requests] ON 

INSERT [dbo].[donation_requests] ([id], [pet_name], [species], [breed], [age], [gender], [health_records], [status]) VALUES (1, N'Oreo', N'Cat', N'Siamese', N'1', N'Male', N'Vaccinated', N'accepted')
INSERT [dbo].[donation_requests] ([id], [pet_name], [species], [breed], [age], [gender], [health_records], [status]) VALUES (2, N'Moka', N'Dog', N'Golden Retriever', N'3', N'Female', N'Vaccinated', N'pending')
INSERT [dbo].[donation_requests] ([id], [pet_name], [species], [breed], [age], [gender], [health_records], [status]) VALUES (15, N'marwan', N'Dogs', N'pug', N'20', N'queer', N'vaccinated', N'accepted')
SET IDENTITY_INSERT [dbo].[donation_requests] OFF
GO
ALTER TABLE [dbo].[donation_requests] ADD  CONSTRAINT [DF_donation_requests_status]  DEFAULT ('pending') FOR [status]
GO
USE [master]
GO
ALTER DATABASE [PetShelter] SET  READ_WRITE 
GO
