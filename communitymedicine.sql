USE [master]
GO
/****** Object:  Database [CommunityMedicineDB]    Script Date: 02/07/2015 19:38:56 ******/
CREATE DATABASE [CommunityMedicineDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommunityMedicineDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.PAVEL\MSSQL\DATA\CommunityMedicineDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CommunityMedicineDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.PAVEL\MSSQL\DATA\CommunityMedicineDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CommunityMedicineDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommunityMedicineDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommunityMedicineDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityMedicineDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityMedicineDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommunityMedicineDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommunityMedicineDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommunityMedicineDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CommunityMedicineDB] SET  MULTI_USER 
GO
ALTER DATABASE [CommunityMedicineDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommunityMedicineDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommunityMedicineDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommunityMedicineDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CommunityMedicineDB]
GO
/****** Object:  Table [dbo].[Center]    Script Date: 02/07/2015 19:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Center](
	[CenterId] [int] IDENTITY(1,1) NOT NULL,
	[CenterName] [varchar](200) NOT NULL,
	[CenterCode] [varchar](100) NOT NULL,
	[CenterPassword] [varchar](100) NOT NULL,
	[ThanaId] [int] NOT NULL,
 CONSTRAINT [PK_Center] PRIMARY KEY CLUSTERED 
(
	[CenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diesease]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diesease](
	[DiseaseId] [int] IDENTITY(1,1) NOT NULL,
	[DiseaseName] [varchar](200) NOT NULL,
	[Description] [varchar](800) NOT NULL,
	[TreatementProcedure] [varchar](800) NOT NULL,
 CONSTRAINT [PK_Diesease] PRIMARY KEY CLUSTERED 
(
	[DiseaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DistributeMedicine]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistributeMedicine](
	[DMedicineId] [int] IDENTITY(1,1) NOT NULL,
	[CenterId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_DistributeMedicine] PRIMARY KEY CLUSTERED 
(
	[DMedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](100) NOT NULL,
	[Population] [int] NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](100) NOT NULL,
	[Degree] [varchar](100) NOT NULL,
	[Specialization] [varchar](100) NOT NULL,
	[CenterId] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoterId] [varchar](50) NOT NULL,
	[ServiceGiven] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thana]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Thana](
	[ThanaId] [int] IDENTITY(1,1) NOT NULL,
	[ThanaName] [varchar](100) NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_Thana] PRIMARY KEY CLUSTERED 
(
	[ThanaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 02/07/2015 19:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Treatment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoterId] [varchar](50) NOT NULL,
	[Observation] [varchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[DiseaseId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Dose] [varchar](60) NOT NULL,
	[Meal] [varchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [varchar](500) NOT NULL,
	[CenterId] [int] NOT NULL,
 CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Center] ON 

INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (1, N'Ramgoti Health Center-1', N'Ram486', N'tTFo2E', 2)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (2, N'Ramgoti Health-2', N'Ram661', N'EJ0UgX', 2)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (3, N'Sonagazi Health-1', N'Son228', N'ecT0zo', 5)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (4, N'Songazi Health -2', N'Son141', N'0t3vun', 5)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (5, N'Horipur Health-1', N'Hor265', N'8KyqNk', 12)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (6, N'DaganBhuiyan-1', N'Dag528633', N'zaUJhgvE', 8)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (7, N'Porshuram Health-1', N'Por183873', N'FFXo6Bsa6W7MMoes8O5knQ==', 10)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (1004, N'Daganbyiyan Health-2', N'Dag716743', N'mhT7+ZaLu1/PWUDrweC38A==', 8)
INSERT [dbo].[Center] ([CenterId], [CenterName], [CenterCode], [CenterPassword], [ThanaId]) VALUES (1005, N'Ranisankail Health Center-1', N'Ran481416', N'xczH6TNzXeDRmGeMXsvluQ==', 15)
SET IDENTITY_INSERT [dbo].[Center] OFF
SET IDENTITY_INSERT [dbo].[Diesease] ON 

INSERT [dbo].[Diesease] ([DiseaseId], [DiseaseName], [Description], [TreatementProcedure]) VALUES (1, N'Malaria', N'Malaria is a mosquito-borne infectious disease of humans and other animals caused by parasitic protozoans (a group of single-celled microorganism) belonging to the genus Plasmodium.', N'give a loading dose of 6.25 mg base/kg (=10 mg salt/kg) of quinidine gluconate infused intravenously over 1-2 hours followed by a continuous infusion of 0.0125 mg base/kg/min (=0.02 mg salt/kg/min.')
INSERT [dbo].[Diesease] ([DiseaseId], [DiseaseName], [Description], [TreatementProcedure]) VALUES (2, N'Diarrhoea', N'Diarrhoea is the passage of 3 or more loose or liquid stools per day, or more frequently than is  for the individual.', N'Because most cases of diarrhoea resolve on their own within a day or two, self-care to relieve symptoms is usually sufficient for treatment: ')
SET IDENTITY_INSERT [dbo].[Diesease] OFF
SET IDENTITY_INSERT [dbo].[DistributeMedicine] ON 

INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1, 1, 1, 320)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (2, 1, 2, 310)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (3, 1, 3, 200)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (6, 3, 1, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (7, 1, 4, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (8, 1, 5, 110)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (9, 2, 5, 350)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (10, 2, 4, 220)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (11, 2, 2, 10)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (12, 2, 1, 20)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (13, 6, 2, 746)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (14, 6, 3, 300)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (15, 6, 1, 200)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (16, 6, 5, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (17, 6, 4, 1741)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (18, 3, 5, 33)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1002, 1004, 1, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1003, 1004, 3, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1004, 1004, 4, 100)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1005, 1005, 1, 88)
INSERT [dbo].[DistributeMedicine] ([DMedicineId], [CenterId], [MedicineId], [Quantity]) VALUES (1006, 1005, 4, 55)
SET IDENTITY_INSERT [dbo].[DistributeMedicine] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (1, N'Dhaka', 2600)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (2, N'Feni', 3000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (3, N'Noakhali', 3000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (4, N'Lakshmipur', 25000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (5, N'Thakurgaon', 6700)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (6, N'Natore', 30000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (7, N'Comilla', 50000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (8, N'Pabna', 50000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (9, N'Bogra', 50000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (10, N'Chittagong', 120000)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [Population]) VALUES (11, N'Mymensing', 60000)
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [DoctorName], [Degree], [Specialization], [CenterId]) VALUES (1, N'Ismail Hossain', N'	MBBS', N'Medicine', 1)
INSERT [dbo].[Doctor] ([Id], [DoctorName], [Degree], [Specialization], [CenterId]) VALUES (2, N'Mahmud Rahman', N'MBBS', N'Medicine', 5)
INSERT [dbo].[Doctor] ([Id], [DoctorName], [Degree], [Specialization], [CenterId]) VALUES (4, N'Monir mahmud', N'MBBS', N'Medicine', 7)
INSERT [dbo].[Doctor] ([Id], [DoctorName], [Degree], [Specialization], [CenterId]) VALUES (1002, N'Rashed Khan', N'MBBS', N'Medicine', 1004)
INSERT [dbo].[Doctor] ([Id], [DoctorName], [Degree], [Specialization], [CenterId]) VALUES (1003, N'Ram Babu Kuswaha', N'MBBS', N'Medicine', 1005)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (1, N'Napa Extra')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (2, N'Saclo 500mg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (3, N'Maxpro 20mg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (4, N'Omited 50mg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (5, N'Diclopan 50mg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineName]) VALUES (1001, N'Ciprocin 500 mg')
SET IDENTITY_INSERT [dbo].[Medicine] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [VoterId], [ServiceGiven]) VALUES (1, N'5644309456813', 8)
INSERT [dbo].[Service] ([Id], [VoterId], [ServiceGiven]) VALUES (2, N'9509623450915', 5)
INSERT [dbo].[Service] ([Id], [VoterId], [ServiceGiven]) VALUES (3, N'7865409458659', 2)
INSERT [dbo].[Service] ([Id], [VoterId], [ServiceGiven]) VALUES (4, N'8909854343334', 1)
INSERT [dbo].[Service] ([Id], [VoterId], [ServiceGiven]) VALUES (5, N'1098789543218', 3)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Thana] ON 

INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (1, N'Raipur', 4)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (2, N'Ramgoti', 4)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (3, N'Ramgonj', 4)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (4, N'Komalnagor', 4)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (5, N'Sonagazi', 2)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (6, N'Fulgazi', 2)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (8, N'Daganbhuiyan', 2)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (9, N'Chhagalnaiya', 2)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (10, N'Porshuram', 2)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (12, N'Horipur', 5)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (13, N'Pirganj', 5)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (14, N'Baliadangi ', 5)
INSERT [dbo].[Thana] ([ThanaId], [ThanaName], [DistrictId]) VALUES (15, N'Ranisankail ', 5)
SET IDENTITY_INSERT [dbo].[Thana] OFF
SET IDENTITY_INSERT [dbo].[Treatment] ON 

INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (11, N'9509623450915', N'hfjhdkfjjk', CAST(0x313A0B00 AS Date), 1003, 2, 4, N'0+0+1', N'Before Meal', 7, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (13, N'9509623450915', N'jfhkjfk', CAST(0x333A0B00 AS Date), 1003, 2, 4, N'1+0+1', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (14, N'9509623450915', N'jfhkjfk', CAST(0x333A0B00 AS Date), 1003, 2, 1, N'0+0+1', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (15, N'7865409458659', N'dhjfkjdfhkjgh', CAST(0x323A0B00 AS Date), 1003, 1, 4, N'0+1+1', N'After Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (16, N'7865409458659', N'dhjfkjdfhkjgh', CAST(0x323A0B00 AS Date), 1003, 1, 1, N'1+0+1', N'After Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (17, N'8909854343334', N'jfhjjgkj', CAST(0x323A0B00 AS Date), 1003, 2, 4, N'1+0+0', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (18, N'5644309456813', N'gjhkjjjj', CAST(0x323A0B00 AS Date), 1003, 1, 4, N'0+0+1', N'After Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (19, N'1098789543218', N'dhjfhhf', CAST(0x2C3A0B00 AS Date), 1003, 2, 1, N'0+1+0', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (20, N'1098789543218', N'Pooor health Condition', CAST(0x393A0B00 AS Date), 1003, 1, 4, N'1+0+0', N'After Meal', 10, N'jfhjgfk', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (21, N'7865409458659', N'hfjhgk', CAST(0x3E3A0B00 AS Date), 1003, 2, 1, N'1+1+0', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (22, N'1098789543218', N'fhkjgkj', CAST(0x2D3A0B00 AS Date), 1003, 2, 4, N'0+0+1', N'Before Meal', 1, N'Continue one week', 1005)
INSERT [dbo].[Treatment] ([Id], [VoterId], [Observation], [Date], [DoctorId], [DiseaseId], [MedicineId], [Dose], [Meal], [Quantity], [Note], [CenterId]) VALUES (23, N'1098789543218', N'good health', CAST(0x3C3A0B00 AS Date), 1003, 1, 1, N'1+0+0', N'Before Meal', 1, N'Continue one week', 1005)
SET IDENTITY_INSERT [dbo].[Treatment] OFF
ALTER TABLE [dbo].[Center]  WITH CHECK ADD  CONSTRAINT [FK_Center_Thana] FOREIGN KEY([ThanaId])
REFERENCES [dbo].[Thana] ([ThanaId])
GO
ALTER TABLE [dbo].[Center] CHECK CONSTRAINT [FK_Center_Thana]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Center] FOREIGN KEY([CenterId])
REFERENCES [dbo].[Center] ([CenterId])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Center]
GO
ALTER TABLE [dbo].[Thana]  WITH CHECK ADD  CONSTRAINT [FK_Thana_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Thana] CHECK CONSTRAINT [FK_Thana_District]
GO
USE [master]
GO
ALTER DATABASE [CommunityMedicineDB] SET  READ_WRITE 
GO
