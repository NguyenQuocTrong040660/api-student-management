USE [master]
GO
/****** Object:  Database [Student_System_Api]    Script Date: 12/29/2022 12:05:19 PM ******/
CREATE DATABASE [Student_System_Api]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_System_Api', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUOCTRONG\MSSQL\DATA\Student_System_Api.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_System_Api_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUOCTRONG\MSSQL\DATA\Student_System_Api_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_System_Api] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_System_Api].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_System_Api] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_System_Api] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_System_Api] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_System_Api] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_System_Api] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_System_Api] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_System_Api] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_System_Api] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_System_Api] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_System_Api] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_System_Api] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_System_Api] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_System_Api] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_System_Api] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_System_Api] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_System_Api] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_System_Api] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_System_Api] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_System_Api] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_System_Api] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_System_Api] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_System_Api] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_System_Api] SET RECOVERY FULL 
GO
ALTER DATABASE [Student_System_Api] SET  MULTI_USER 
GO
ALTER DATABASE [Student_System_Api] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_System_Api] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_System_Api] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_System_Api] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_System_Api] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_System_Api] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Student_System_Api', N'ON'
GO
ALTER DATABASE [Student_System_Api] SET QUERY_STORE = OFF
GO
USE [Student_System_Api]
GO
/****** Object:  Table [dbo].[checkvp]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkvp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[offence_id] [int] NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime2](7) NULL,
	[student_id] [int] NOT NULL,
	[date_id] [int] NULL,
	[offence_mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clazz]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clazz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NULL,
	[name_clazz] [nvarchar](100) NULL,
	[start_date] [datetime2](7) NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clazz_teacher]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clazz_teacher](
	[clazz_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[role_clazz] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[clazz_id] ASC,
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dates]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dates](
	[date_id] [int] IDENTITY(1,1) NOT NULL,
	[entry_date] [datetime2](7) NULL,
	[name_day] [varchar](255) NULL,
	[week_year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_evaluate]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_evaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[student_name] [nvarchar](200) NULL,
	[student_id] [int] NULL,
	[update_at] [datetime2](7) NULL,
	[offence_id] [int] NOT NULL,
	[schedule_evaluate_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mark]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[mark] [float] NULL,
	[semester] [int] NULL,
	[status] [bit] NOT NULL,
	[subject_id] [int] NULL,
	[update_at] [datetime2](7) NULL,
	[mark_type_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mark_type]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mark_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[mark_number] [float] NOT NULL,
	[mark_type_name] [nvarchar](200) NULL,
	[update_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offence]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offence](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[mark_offence] [int] NULL,
	[offence_name] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[date_start] [datetime2](7) NULL,
	[lession] [int] NULL,
	[lessionppct] [int] NULL,
	[note] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
	[subject_content] [nvarchar](200) NULL,
	[update_at] [datetime2](7) NULL,
	[clazz_id] [int] NOT NULL,
	[date_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[id_teacher] [int] NULL,
	[name_teacher] [nvarchar](200) NULL,
 CONSTRAINT [PK__schedule__3213E83F73BA8032] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule_evaluate]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule_evaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[evaluate_note] [nvarchar](200) NOT NULL,
	[home_work] [nvarchar](200) NOT NULL,
	[mark1] [float] NOT NULL,
	[mark2] [float] NOT NULL,
	[mark3] [float] NOT NULL,
	[schedule_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](200) NULL,
	[birth_date] [datetime2](7) NULL,
	[create_at] [datetime2](7) NOT NULL,
	[email] [nvarchar](50) NULL,
	[gender] [bit] NOT NULL,
	[name_student] [nvarchar](100) NULL,
	[phone] [varchar](255) NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime2](7) NULL,
	[clazz_id] [int] NOT NULL,
	[student_family_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_family]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_family](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NOT NULL,
	[email1] [nvarchar](100) NULL,
	[father_name] [nvarchar](100) NULL,
	[mother_name] [nvarchar](100) NULL,
	[phone1] [varchar](255) NULL,
	[update_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [nvarchar](200) NULL,
	[subject_status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](200) NULL,
	[birth_date] [datetime2](7) NULL,
	[create_at] [datetime2](7) NOT NULL,
	[email] [varchar](255) NULL,
	[gender] [bit] NOT NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[status] [bit] NOT NULL,
	[teacher_name] [nvarchar](100) NULL,
	[update_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_role]    Script Date: 12/29/2022 12:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_role](
	[teacher_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[checkvp] ON 

INSERT [dbo].[checkvp] ([id], [create_at], [offence_id], [status], [update_at], [student_id], [date_id], [offence_mark]) VALUES (58, CAST(N'2022-10-15T13:33:21.8160000' AS DateTime2), 1, 1, CAST(N'2022-10-15T13:33:21.8160000' AS DateTime2), 18, 288, -5)
INSERT [dbo].[checkvp] ([id], [create_at], [offence_id], [status], [update_at], [student_id], [date_id], [offence_mark]) VALUES (60, CAST(N'2022-10-24T16:21:45.4620000' AS DateTime2), 1, 1, CAST(N'2022-10-24T16:21:45.4620000' AS DateTime2), 18, 297, -5)
SET IDENTITY_INSERT [dbo].[checkvp] OFF
GO
SET IDENTITY_INSERT [dbo].[clazz] ON 

INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (9, CAST(N'2022-10-10T15:13:57.9460000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'10A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-10-10T21:58:42.5790000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (10, CAST(N'2022-10-10T15:14:05.9410000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'11A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 0, CAST(N'2022-10-10T15:15:26.3980000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (11, CAST(N'2022-10-10T15:24:42.2060000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'11A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-10-10T15:24:42.2060000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (12, CAST(N'2022-10-10T15:24:48.1040000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'12A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 0, CAST(N'2022-10-10T15:24:51.3830000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (13, CAST(N'2022-10-11T16:38:51.8110000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'12A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-10-11T16:38:51.8110000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (14, CAST(N'2022-10-11T22:48:56.6700000' AS DateTime2), CAST(N'2022-12-01T07:00:00.0000000' AS DateTime2), N'8A1', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-10-11T22:48:56.6700000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (15, CAST(N'2022-10-13T11:37:42.2700000' AS DateTime2), CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), N'8A2', CAST(N'2022-01-01T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-10-13T11:37:42.2700000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (16, CAST(N'2022-10-31T14:42:33.2110000' AS DateTime2), CAST(N'2022-12-04T07:00:00.0000000' AS DateTime2), N'8A3', CAST(N'2022-06-04T07:00:00.0000000' AS DateTime2), 0, CAST(N'2022-10-31T14:54:08.7430000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (17, CAST(N'2022-10-31T14:42:33.4820000' AS DateTime2), CAST(N'2022-12-04T07:00:00.0000000' AS DateTime2), N'8A3', CAST(N'2022-06-04T07:00:00.0000000' AS DateTime2), 0, CAST(N'2022-10-31T14:45:10.9340000' AS DateTime2))
INSERT [dbo].[clazz] ([id], [create_at], [end_date], [name_clazz], [start_date], [status], [update_at]) VALUES (18, CAST(N'2022-12-15T13:38:04.3100000' AS DateTime2), CAST(N'2022-12-29T07:00:00.0000000' AS DateTime2), N'7A1', CAST(N'2022-08-29T07:00:00.0000000' AS DateTime2), 1, CAST(N'2022-12-15T13:38:04.3110000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[clazz] OFF
GO
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (9, 1, N'Bộ môn')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (11, 1, N'Bộ môn')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (11, 2, N'Quản nhiệm')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (11, 3, N'Quản nhiệm')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (11, 6, N'Bộ môn')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (11, 7, N'Bộ môn')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (14, 3, N'Bộ môn')
INSERT [dbo].[clazz_teacher] ([clazz_id], [teacher_id], [role_clazz]) VALUES (14, 6, N'Bộ môn')
GO
SET IDENTITY_INSERT [dbo].[dates] ON 

INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (1, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), N'Saturday', 1)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (2, CAST(N'2022-01-02T00:00:00.0000000' AS DateTime2), N'Sunday', 1)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (3, CAST(N'2022-01-03T00:00:00.0000000' AS DateTime2), N'Monday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (4, CAST(N'2022-01-04T00:00:00.0000000' AS DateTime2), N'Tuesday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (5, CAST(N'2022-01-05T00:00:00.0000000' AS DateTime2), N'Wednesday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (6, CAST(N'2022-01-06T00:00:00.0000000' AS DateTime2), N'Thursday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (7, CAST(N'2022-01-07T00:00:00.0000000' AS DateTime2), N'Friday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (8, CAST(N'2022-01-08T00:00:00.0000000' AS DateTime2), N'Saturday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (9, CAST(N'2022-01-09T00:00:00.0000000' AS DateTime2), N'Sunday', 2)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (10, CAST(N'2022-01-10T00:00:00.0000000' AS DateTime2), N'Monday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (11, CAST(N'2022-01-11T00:00:00.0000000' AS DateTime2), N'Tuesday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (12, CAST(N'2022-01-12T00:00:00.0000000' AS DateTime2), N'Wednesday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (13, CAST(N'2022-01-13T00:00:00.0000000' AS DateTime2), N'Thursday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (14, CAST(N'2022-01-14T00:00:00.0000000' AS DateTime2), N'Friday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (15, CAST(N'2022-01-15T00:00:00.0000000' AS DateTime2), N'Saturday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (16, CAST(N'2022-01-16T00:00:00.0000000' AS DateTime2), N'Sunday', 3)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (17, CAST(N'2022-01-17T00:00:00.0000000' AS DateTime2), N'Monday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (18, CAST(N'2022-01-18T00:00:00.0000000' AS DateTime2), N'Tuesday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (19, CAST(N'2022-01-19T00:00:00.0000000' AS DateTime2), N'Wednesday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (20, CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), N'Thursday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (21, CAST(N'2022-01-21T00:00:00.0000000' AS DateTime2), N'Friday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (22, CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), N'Saturday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (23, CAST(N'2022-01-23T00:00:00.0000000' AS DateTime2), N'Sunday', 4)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (24, CAST(N'2022-01-24T00:00:00.0000000' AS DateTime2), N'Monday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (25, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Tuesday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (26, CAST(N'2022-01-26T00:00:00.0000000' AS DateTime2), N'Wednesday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (27, CAST(N'2022-01-27T00:00:00.0000000' AS DateTime2), N'Thursday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (28, CAST(N'2022-01-28T00:00:00.0000000' AS DateTime2), N'Friday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (29, CAST(N'2022-01-29T00:00:00.0000000' AS DateTime2), N'Saturday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (30, CAST(N'2022-01-30T00:00:00.0000000' AS DateTime2), N'Sunday', 5)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (31, CAST(N'2022-01-31T00:00:00.0000000' AS DateTime2), N'Monday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (32, CAST(N'2022-02-01T00:00:00.0000000' AS DateTime2), N'Tuesday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (33, CAST(N'2022-02-02T00:00:00.0000000' AS DateTime2), N'Wednesday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (34, CAST(N'2022-02-03T00:00:00.0000000' AS DateTime2), N'Thursday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (35, CAST(N'2022-02-04T00:00:00.0000000' AS DateTime2), N'Friday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (36, CAST(N'2022-02-05T00:00:00.0000000' AS DateTime2), N'Saturday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (37, CAST(N'2022-02-06T00:00:00.0000000' AS DateTime2), N'Sunday', 6)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (38, CAST(N'2022-02-07T00:00:00.0000000' AS DateTime2), N'Monday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (39, CAST(N'2022-02-08T00:00:00.0000000' AS DateTime2), N'Tuesday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (40, CAST(N'2022-02-09T00:00:00.0000000' AS DateTime2), N'Wednesday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (41, CAST(N'2022-02-10T00:00:00.0000000' AS DateTime2), N'Thursday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (42, CAST(N'2022-02-11T00:00:00.0000000' AS DateTime2), N'Friday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (43, CAST(N'2022-02-12T00:00:00.0000000' AS DateTime2), N'Saturday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (44, CAST(N'2022-02-13T00:00:00.0000000' AS DateTime2), N'Sunday', 7)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (45, CAST(N'2022-02-14T00:00:00.0000000' AS DateTime2), N'Monday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (46, CAST(N'2022-02-15T00:00:00.0000000' AS DateTime2), N'Tuesday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (47, CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2), N'Wednesday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (48, CAST(N'2022-02-17T00:00:00.0000000' AS DateTime2), N'Thursday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (49, CAST(N'2022-02-18T00:00:00.0000000' AS DateTime2), N'Friday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (50, CAST(N'2022-02-19T00:00:00.0000000' AS DateTime2), N'Saturday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (51, CAST(N'2022-02-20T00:00:00.0000000' AS DateTime2), N'Sunday', 8)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (52, CAST(N'2022-02-21T00:00:00.0000000' AS DateTime2), N'Monday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (53, CAST(N'2022-02-22T00:00:00.0000000' AS DateTime2), N'Tuesday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (54, CAST(N'2022-02-23T00:00:00.0000000' AS DateTime2), N'Wednesday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (55, CAST(N'2022-02-24T00:00:00.0000000' AS DateTime2), N'Thursday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (56, CAST(N'2022-02-25T00:00:00.0000000' AS DateTime2), N'Friday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (57, CAST(N'2022-02-26T00:00:00.0000000' AS DateTime2), N'Saturday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (58, CAST(N'2022-02-27T00:00:00.0000000' AS DateTime2), N'Sunday', 9)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (59, CAST(N'2022-02-28T00:00:00.0000000' AS DateTime2), N'Monday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (60, CAST(N'2022-03-01T00:00:00.0000000' AS DateTime2), N'Tuesday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (61, CAST(N'2022-03-02T00:00:00.0000000' AS DateTime2), N'Wednesday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (62, CAST(N'2022-03-03T00:00:00.0000000' AS DateTime2), N'Thursday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (63, CAST(N'2022-03-04T00:00:00.0000000' AS DateTime2), N'Friday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (64, CAST(N'2022-03-05T00:00:00.0000000' AS DateTime2), N'Saturday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (65, CAST(N'2022-03-06T00:00:00.0000000' AS DateTime2), N'Sunday', 10)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (66, CAST(N'2022-03-07T00:00:00.0000000' AS DateTime2), N'Monday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (67, CAST(N'2022-03-08T00:00:00.0000000' AS DateTime2), N'Tuesday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (68, CAST(N'2022-03-09T00:00:00.0000000' AS DateTime2), N'Wednesday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (69, CAST(N'2022-03-10T00:00:00.0000000' AS DateTime2), N'Thursday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (70, CAST(N'2022-03-11T00:00:00.0000000' AS DateTime2), N'Friday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (71, CAST(N'2022-03-12T00:00:00.0000000' AS DateTime2), N'Saturday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (72, CAST(N'2022-03-13T00:00:00.0000000' AS DateTime2), N'Sunday', 11)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (73, CAST(N'2022-03-14T00:00:00.0000000' AS DateTime2), N'Monday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (74, CAST(N'2022-03-15T00:00:00.0000000' AS DateTime2), N'Tuesday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (75, CAST(N'2022-03-16T00:00:00.0000000' AS DateTime2), N'Wednesday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (76, CAST(N'2022-03-17T00:00:00.0000000' AS DateTime2), N'Thursday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (77, CAST(N'2022-03-18T00:00:00.0000000' AS DateTime2), N'Friday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (78, CAST(N'2022-03-19T00:00:00.0000000' AS DateTime2), N'Saturday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (79, CAST(N'2022-03-20T00:00:00.0000000' AS DateTime2), N'Sunday', 12)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (80, CAST(N'2022-03-21T00:00:00.0000000' AS DateTime2), N'Monday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (81, CAST(N'2022-03-22T00:00:00.0000000' AS DateTime2), N'Tuesday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (82, CAST(N'2022-03-23T00:00:00.0000000' AS DateTime2), N'Wednesday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (83, CAST(N'2022-03-24T00:00:00.0000000' AS DateTime2), N'Thursday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (84, CAST(N'2022-03-25T00:00:00.0000000' AS DateTime2), N'Friday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (85, CAST(N'2022-03-26T00:00:00.0000000' AS DateTime2), N'Saturday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (86, CAST(N'2022-03-27T00:00:00.0000000' AS DateTime2), N'Sunday', 13)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (87, CAST(N'2022-03-28T00:00:00.0000000' AS DateTime2), N'Monday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (88, CAST(N'2022-03-29T00:00:00.0000000' AS DateTime2), N'Tuesday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (89, CAST(N'2022-03-30T00:00:00.0000000' AS DateTime2), N'Wednesday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (90, CAST(N'2022-03-31T00:00:00.0000000' AS DateTime2), N'Thursday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (91, CAST(N'2022-04-01T00:00:00.0000000' AS DateTime2), N'Friday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (92, CAST(N'2022-04-02T00:00:00.0000000' AS DateTime2), N'Saturday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (93, CAST(N'2022-04-03T00:00:00.0000000' AS DateTime2), N'Sunday', 14)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (94, CAST(N'2022-04-04T00:00:00.0000000' AS DateTime2), N'Monday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (95, CAST(N'2022-04-05T00:00:00.0000000' AS DateTime2), N'Tuesday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (96, CAST(N'2022-04-06T00:00:00.0000000' AS DateTime2), N'Wednesday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (97, CAST(N'2022-04-07T00:00:00.0000000' AS DateTime2), N'Thursday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (98, CAST(N'2022-04-08T00:00:00.0000000' AS DateTime2), N'Friday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (99, CAST(N'2022-04-09T00:00:00.0000000' AS DateTime2), N'Saturday', 15)
GO
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (100, CAST(N'2022-04-10T00:00:00.0000000' AS DateTime2), N'Sunday', 15)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (101, CAST(N'2022-04-11T00:00:00.0000000' AS DateTime2), N'Monday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (102, CAST(N'2022-04-12T00:00:00.0000000' AS DateTime2), N'Tuesday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (103, CAST(N'2022-04-13T00:00:00.0000000' AS DateTime2), N'Wednesday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (104, CAST(N'2022-04-14T00:00:00.0000000' AS DateTime2), N'Thursday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (105, CAST(N'2022-04-15T00:00:00.0000000' AS DateTime2), N'Friday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (106, CAST(N'2022-04-16T00:00:00.0000000' AS DateTime2), N'Saturday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (107, CAST(N'2022-04-17T00:00:00.0000000' AS DateTime2), N'Sunday', 16)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (108, CAST(N'2022-04-18T00:00:00.0000000' AS DateTime2), N'Monday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (109, CAST(N'2022-04-19T00:00:00.0000000' AS DateTime2), N'Tuesday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (110, CAST(N'2022-04-20T00:00:00.0000000' AS DateTime2), N'Wednesday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (111, CAST(N'2022-04-21T00:00:00.0000000' AS DateTime2), N'Thursday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (112, CAST(N'2022-04-22T00:00:00.0000000' AS DateTime2), N'Friday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (113, CAST(N'2022-04-23T00:00:00.0000000' AS DateTime2), N'Saturday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (114, CAST(N'2022-04-24T00:00:00.0000000' AS DateTime2), N'Sunday', 17)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (115, CAST(N'2022-04-25T00:00:00.0000000' AS DateTime2), N'Monday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (116, CAST(N'2022-04-26T00:00:00.0000000' AS DateTime2), N'Tuesday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (117, CAST(N'2022-04-27T00:00:00.0000000' AS DateTime2), N'Wednesday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (118, CAST(N'2022-04-28T00:00:00.0000000' AS DateTime2), N'Thursday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (119, CAST(N'2022-04-29T00:00:00.0000000' AS DateTime2), N'Friday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (120, CAST(N'2022-04-30T00:00:00.0000000' AS DateTime2), N'Saturday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (121, CAST(N'2022-05-01T00:00:00.0000000' AS DateTime2), N'Sunday', 18)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (122, CAST(N'2022-05-02T00:00:00.0000000' AS DateTime2), N'Monday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (123, CAST(N'2022-05-03T00:00:00.0000000' AS DateTime2), N'Tuesday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (124, CAST(N'2022-05-04T00:00:00.0000000' AS DateTime2), N'Wednesday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (125, CAST(N'2022-05-05T00:00:00.0000000' AS DateTime2), N'Thursday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (126, CAST(N'2022-05-06T00:00:00.0000000' AS DateTime2), N'Friday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (127, CAST(N'2022-05-07T00:00:00.0000000' AS DateTime2), N'Saturday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (128, CAST(N'2022-05-08T00:00:00.0000000' AS DateTime2), N'Sunday', 19)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (129, CAST(N'2022-05-09T00:00:00.0000000' AS DateTime2), N'Monday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (130, CAST(N'2022-05-10T00:00:00.0000000' AS DateTime2), N'Tuesday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (131, CAST(N'2022-05-11T00:00:00.0000000' AS DateTime2), N'Wednesday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (132, CAST(N'2022-05-12T00:00:00.0000000' AS DateTime2), N'Thursday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (133, CAST(N'2022-05-13T00:00:00.0000000' AS DateTime2), N'Friday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (134, CAST(N'2022-05-14T00:00:00.0000000' AS DateTime2), N'Saturday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (135, CAST(N'2022-05-15T00:00:00.0000000' AS DateTime2), N'Sunday', 20)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (136, CAST(N'2022-05-16T00:00:00.0000000' AS DateTime2), N'Monday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (137, CAST(N'2022-05-17T00:00:00.0000000' AS DateTime2), N'Tuesday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (138, CAST(N'2022-05-18T00:00:00.0000000' AS DateTime2), N'Wednesday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (139, CAST(N'2022-05-19T00:00:00.0000000' AS DateTime2), N'Thursday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (140, CAST(N'2022-05-20T00:00:00.0000000' AS DateTime2), N'Friday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (141, CAST(N'2022-05-21T00:00:00.0000000' AS DateTime2), N'Saturday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (142, CAST(N'2022-05-22T00:00:00.0000000' AS DateTime2), N'Sunday', 21)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (143, CAST(N'2022-05-23T00:00:00.0000000' AS DateTime2), N'Monday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (144, CAST(N'2022-05-24T00:00:00.0000000' AS DateTime2), N'Tuesday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (145, CAST(N'2022-05-25T00:00:00.0000000' AS DateTime2), N'Wednesday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (146, CAST(N'2022-05-26T00:00:00.0000000' AS DateTime2), N'Thursday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (147, CAST(N'2022-05-27T00:00:00.0000000' AS DateTime2), N'Friday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (148, CAST(N'2022-05-28T00:00:00.0000000' AS DateTime2), N'Saturday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (149, CAST(N'2022-05-29T00:00:00.0000000' AS DateTime2), N'Sunday', 22)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (150, CAST(N'2022-05-30T00:00:00.0000000' AS DateTime2), N'Monday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (151, CAST(N'2022-05-31T00:00:00.0000000' AS DateTime2), N'Tuesday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (152, CAST(N'2022-06-01T00:00:00.0000000' AS DateTime2), N'Wednesday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (153, CAST(N'2022-06-02T00:00:00.0000000' AS DateTime2), N'Thursday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (154, CAST(N'2022-06-03T00:00:00.0000000' AS DateTime2), N'Friday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (155, CAST(N'2022-06-04T00:00:00.0000000' AS DateTime2), N'Saturday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (156, CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'Sunday', 23)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (157, CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), N'Monday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (158, CAST(N'2022-06-07T00:00:00.0000000' AS DateTime2), N'Tuesday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (159, CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), N'Wednesday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (160, CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), N'Thursday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (161, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'Friday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (162, CAST(N'2022-06-11T00:00:00.0000000' AS DateTime2), N'Saturday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (163, CAST(N'2022-06-12T00:00:00.0000000' AS DateTime2), N'Sunday', 24)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (164, CAST(N'2022-06-13T00:00:00.0000000' AS DateTime2), N'Monday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (165, CAST(N'2022-06-14T00:00:00.0000000' AS DateTime2), N'Tuesday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (166, CAST(N'2022-06-15T00:00:00.0000000' AS DateTime2), N'Wednesday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (167, CAST(N'2022-06-16T00:00:00.0000000' AS DateTime2), N'Thursday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (168, CAST(N'2022-06-17T00:00:00.0000000' AS DateTime2), N'Friday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (169, CAST(N'2022-06-18T00:00:00.0000000' AS DateTime2), N'Saturday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (170, CAST(N'2022-06-19T00:00:00.0000000' AS DateTime2), N'Sunday', 25)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (171, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'Monday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (172, CAST(N'2022-06-21T00:00:00.0000000' AS DateTime2), N'Tuesday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (173, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), N'Wednesday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (174, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'Thursday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (175, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), N'Friday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (176, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), N'Saturday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (177, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), N'Sunday', 26)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (178, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), N'Monday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (179, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), N'Tuesday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (180, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), N'Wednesday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (181, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), N'Thursday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (182, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), N'Friday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (183, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), N'Saturday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (184, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), N'Sunday', 27)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (185, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), N'Monday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (186, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), N'Tuesday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (187, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), N'Wednesday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (188, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), N'Thursday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (189, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), N'Friday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (190, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), N'Saturday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (191, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), N'Sunday', 28)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (192, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), N'Monday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (193, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), N'Tuesday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (194, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), N'Wednesday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (195, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), N'Thursday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (196, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'Friday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (197, CAST(N'2022-07-16T00:00:00.0000000' AS DateTime2), N'Saturday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (198, CAST(N'2022-07-17T00:00:00.0000000' AS DateTime2), N'Sunday', 29)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (199, CAST(N'2022-07-18T00:00:00.0000000' AS DateTime2), N'Monday', 30)
GO
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (200, CAST(N'2022-07-19T00:00:00.0000000' AS DateTime2), N'Tuesday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (201, CAST(N'2022-07-20T00:00:00.0000000' AS DateTime2), N'Wednesday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (202, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), N'Thursday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (203, CAST(N'2022-07-22T00:00:00.0000000' AS DateTime2), N'Friday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (204, CAST(N'2022-07-23T00:00:00.0000000' AS DateTime2), N'Saturday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (205, CAST(N'2022-07-24T00:00:00.0000000' AS DateTime2), N'Sunday', 30)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (206, CAST(N'2022-07-25T00:00:00.0000000' AS DateTime2), N'Monday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (207, CAST(N'2022-07-26T00:00:00.0000000' AS DateTime2), N'Tuesday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (208, CAST(N'2022-07-27T00:00:00.0000000' AS DateTime2), N'Wednesday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (209, CAST(N'2022-07-28T00:00:00.0000000' AS DateTime2), N'Thursday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (210, CAST(N'2022-07-29T00:00:00.0000000' AS DateTime2), N'Friday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (211, CAST(N'2022-07-30T00:00:00.0000000' AS DateTime2), N'Saturday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (212, CAST(N'2022-07-31T00:00:00.0000000' AS DateTime2), N'Sunday', 31)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (213, CAST(N'2022-08-01T00:00:00.0000000' AS DateTime2), N'Monday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (214, CAST(N'2022-08-02T00:00:00.0000000' AS DateTime2), N'Tuesday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (215, CAST(N'2022-08-03T00:00:00.0000000' AS DateTime2), N'Wednesday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (216, CAST(N'2022-08-04T00:00:00.0000000' AS DateTime2), N'Thursday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (217, CAST(N'2022-08-05T00:00:00.0000000' AS DateTime2), N'Friday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (218, CAST(N'2022-08-06T00:00:00.0000000' AS DateTime2), N'Saturday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (219, CAST(N'2022-08-07T00:00:00.0000000' AS DateTime2), N'Sunday', 32)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (220, CAST(N'2022-08-08T00:00:00.0000000' AS DateTime2), N'Monday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (221, CAST(N'2022-08-09T00:00:00.0000000' AS DateTime2), N'Tuesday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (222, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'Wednesday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (223, CAST(N'2022-08-11T00:00:00.0000000' AS DateTime2), N'Thursday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (224, CAST(N'2022-08-12T00:00:00.0000000' AS DateTime2), N'Friday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (225, CAST(N'2022-08-13T00:00:00.0000000' AS DateTime2), N'Saturday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (226, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'Sunday', 33)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (227, CAST(N'2022-08-15T00:00:00.0000000' AS DateTime2), N'Monday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (228, CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'Tuesday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (229, CAST(N'2022-08-17T00:00:00.0000000' AS DateTime2), N'Wednesday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (230, CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'Thursday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (231, CAST(N'2022-08-19T00:00:00.0000000' AS DateTime2), N'Friday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (232, CAST(N'2022-08-20T00:00:00.0000000' AS DateTime2), N'Saturday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (233, CAST(N'2022-08-21T00:00:00.0000000' AS DateTime2), N'Sunday', 34)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (234, CAST(N'2022-08-22T00:00:00.0000000' AS DateTime2), N'Monday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (235, CAST(N'2022-08-23T00:00:00.0000000' AS DateTime2), N'Tuesday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (236, CAST(N'2022-08-24T00:00:00.0000000' AS DateTime2), N'Wednesday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (237, CAST(N'2022-08-25T00:00:00.0000000' AS DateTime2), N'Thursday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (238, CAST(N'2022-08-26T00:00:00.0000000' AS DateTime2), N'Friday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (239, CAST(N'2022-08-27T00:00:00.0000000' AS DateTime2), N'Saturday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (240, CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'Sunday', 35)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (241, CAST(N'2022-08-29T00:00:00.0000000' AS DateTime2), N'Monday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (242, CAST(N'2022-08-30T00:00:00.0000000' AS DateTime2), N'Tuesday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (243, CAST(N'2022-08-31T00:00:00.0000000' AS DateTime2), N'Wednesday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (244, CAST(N'2022-09-01T00:00:00.0000000' AS DateTime2), N'Thursday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (245, CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), N'Friday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (246, CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), N'Saturday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (247, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'Sunday', 36)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (248, CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), N'Monday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (249, CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), N'Tuesday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (250, CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), N'Wednesday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (251, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'Thursday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (252, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'Friday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (253, CAST(N'2022-09-10T00:00:00.0000000' AS DateTime2), N'Saturday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (254, CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'Sunday', 37)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (255, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'Monday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (256, CAST(N'2022-09-13T00:00:00.0000000' AS DateTime2), N'Tuesday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (257, CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'Wednesday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (258, CAST(N'2022-09-15T00:00:00.0000000' AS DateTime2), N'Thursday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (259, CAST(N'2022-09-16T00:00:00.0000000' AS DateTime2), N'Friday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (260, CAST(N'2022-09-17T00:00:00.0000000' AS DateTime2), N'Saturday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (261, CAST(N'2022-09-18T00:00:00.0000000' AS DateTime2), N'Sunday', 38)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (262, CAST(N'2022-09-19T00:00:00.0000000' AS DateTime2), N'Monday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (263, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'Tuesday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (264, CAST(N'2022-09-21T00:00:00.0000000' AS DateTime2), N'Wednesday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (265, CAST(N'2022-09-22T00:00:00.0000000' AS DateTime2), N'Thursday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (266, CAST(N'2022-09-23T00:00:00.0000000' AS DateTime2), N'Friday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (267, CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2), N'Saturday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (268, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'Sunday', 39)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (269, CAST(N'2022-09-26T00:00:00.0000000' AS DateTime2), N'Monday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (270, CAST(N'2022-09-27T00:00:00.0000000' AS DateTime2), N'Tuesday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (271, CAST(N'2022-09-28T00:00:00.0000000' AS DateTime2), N'Wednesday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (272, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'Thursday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (273, CAST(N'2022-09-30T00:00:00.0000000' AS DateTime2), N'Friday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (274, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'Saturday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (275, CAST(N'2022-10-02T00:00:00.0000000' AS DateTime2), N'Sunday', 40)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (276, CAST(N'2022-10-03T00:00:00.0000000' AS DateTime2), N'Monday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (277, CAST(N'2022-10-04T00:00:00.0000000' AS DateTime2), N'Tuesday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (278, CAST(N'2022-10-05T00:00:00.0000000' AS DateTime2), N'Wednesday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (279, CAST(N'2022-10-06T00:00:00.0000000' AS DateTime2), N'Thursday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (280, CAST(N'2022-10-07T00:00:00.0000000' AS DateTime2), N'Friday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (281, CAST(N'2022-10-08T00:00:00.0000000' AS DateTime2), N'Saturday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (282, CAST(N'2022-10-09T00:00:00.0000000' AS DateTime2), N'Sunday', 41)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (283, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'Monday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (284, CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), N'Tuesday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (285, CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2), N'Wednesday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (286, CAST(N'2022-10-13T00:00:00.0000000' AS DateTime2), N'Thursday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (287, CAST(N'2022-10-14T00:00:00.0000000' AS DateTime2), N'Friday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (288, CAST(N'2022-10-15T00:00:00.0000000' AS DateTime2), N'Saturday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (289, CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), N'Sunday', 42)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (290, CAST(N'2022-10-17T00:00:00.0000000' AS DateTime2), N'Monday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (291, CAST(N'2022-10-18T00:00:00.0000000' AS DateTime2), N'Tuesday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (292, CAST(N'2022-10-19T00:00:00.0000000' AS DateTime2), N'Wednesday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (293, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), N'Thursday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (294, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'Friday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (295, CAST(N'2022-10-22T00:00:00.0000000' AS DateTime2), N'Saturday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (296, CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), N'Sunday', 43)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (297, CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), N'Monday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (298, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), N'Tuesday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (299, CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), N'Wednesday', 44)
GO
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (300, CAST(N'2022-10-27T00:00:00.0000000' AS DateTime2), N'Thursday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (301, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), N'Friday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (302, CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2), N'Saturday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (303, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), N'Sunday', 44)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (304, CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2), N'Monday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (305, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), N'Tuesday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (306, CAST(N'2022-11-02T00:00:00.0000000' AS DateTime2), N'Wednesday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (307, CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), N'Thursday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (308, CAST(N'2022-11-04T00:00:00.0000000' AS DateTime2), N'Friday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (309, CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), N'Saturday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (310, CAST(N'2022-11-06T00:00:00.0000000' AS DateTime2), N'Sunday', 45)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (311, CAST(N'2022-11-07T00:00:00.0000000' AS DateTime2), N'Monday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (312, CAST(N'2022-11-08T00:00:00.0000000' AS DateTime2), N'Tuesday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (313, CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), N'Wednesday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (314, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), N'Thursday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (315, CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), N'Friday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (316, CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), N'Saturday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (317, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), N'Sunday', 46)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (318, CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), N'Monday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (319, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), N'Tuesday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (320, CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), N'Wednesday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (321, CAST(N'2022-11-17T00:00:00.0000000' AS DateTime2), N'Thursday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (322, CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), N'Friday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (323, CAST(N'2022-11-19T00:00:00.0000000' AS DateTime2), N'Saturday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (324, CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), N'Sunday', 47)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (325, CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), N'Monday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (326, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), N'Tuesday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (327, CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), N'Wednesday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (328, CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), N'Thursday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (329, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), N'Friday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (330, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), N'Saturday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (331, CAST(N'2022-11-27T00:00:00.0000000' AS DateTime2), N'Sunday', 48)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (332, CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), N'Monday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (333, CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), N'Tuesday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (334, CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), N'Wednesday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (335, CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), N'Thursday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (336, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), N'Friday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (337, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), N'Saturday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (338, CAST(N'2022-12-04T00:00:00.0000000' AS DateTime2), N'Sunday', 49)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (339, CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), N'Monday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (340, CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), N'Tuesday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (341, CAST(N'2022-12-07T00:00:00.0000000' AS DateTime2), N'Wednesday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (342, CAST(N'2022-12-08T00:00:00.0000000' AS DateTime2), N'Thursday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (343, CAST(N'2022-12-09T00:00:00.0000000' AS DateTime2), N'Friday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (344, CAST(N'2022-12-10T00:00:00.0000000' AS DateTime2), N'Saturday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (345, CAST(N'2022-12-11T00:00:00.0000000' AS DateTime2), N'Sunday', 50)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (346, CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), N'Monday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (347, CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), N'Tuesday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (348, CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), N'Wednesday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (349, CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'Thursday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (350, CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), N'Friday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (351, CAST(N'2022-12-17T00:00:00.0000000' AS DateTime2), N'Saturday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (352, CAST(N'2022-12-18T00:00:00.0000000' AS DateTime2), N'Sunday', 51)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (353, CAST(N'2022-12-19T00:00:00.0000000' AS DateTime2), N'Monday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (354, CAST(N'2022-12-20T00:00:00.0000000' AS DateTime2), N'Tuesday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (355, CAST(N'2022-12-21T00:00:00.0000000' AS DateTime2), N'Wednesday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (356, CAST(N'2022-12-22T00:00:00.0000000' AS DateTime2), N'Thursday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (357, CAST(N'2022-12-23T00:00:00.0000000' AS DateTime2), N'Friday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (358, CAST(N'2022-12-24T00:00:00.0000000' AS DateTime2), N'Saturday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (359, CAST(N'2022-12-25T00:00:00.0000000' AS DateTime2), N'Sunday', 52)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (360, CAST(N'2022-12-26T00:00:00.0000000' AS DateTime2), N'Monday', 53)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (361, CAST(N'2022-12-27T00:00:00.0000000' AS DateTime2), N'Tuesday', 53)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (362, CAST(N'2022-12-28T00:00:00.0000000' AS DateTime2), N'Wednesday', 53)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (363, CAST(N'2022-12-29T00:00:00.0000000' AS DateTime2), N'Thursday', 53)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (364, CAST(N'2022-12-30T00:00:00.0000000' AS DateTime2), N'Friday', 53)
INSERT [dbo].[dates] ([date_id], [entry_date], [name_day], [week_year]) VALUES (365, CAST(N'2022-12-31T00:00:00.0000000' AS DateTime2), N'Saturday', 53)
SET IDENTITY_INSERT [dbo].[dates] OFF
GO
SET IDENTITY_INSERT [dbo].[detail_evaluate] ON 

INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (1, CAST(N'2022-10-25T12:23:12.4670000' AS DateTime2), N'An Nguyen', 18, CAST(N'2022-10-25T12:23:12.4670000' AS DateTime2), 8, 4)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (3, CAST(N'2022-10-25T12:38:51.5510000' AS DateTime2), N'Nguyen Kim Song', 20, CAST(N'2022-10-25T12:38:51.5510000' AS DateTime2), 8, 5)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (4, CAST(N'2022-10-25T12:38:54.9930000' AS DateTime2), N'Le Công Minh', 21, CAST(N'2022-10-25T12:38:54.9930000' AS DateTime2), 5, 5)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (6, CAST(N'2022-10-25T13:00:06.7790000' AS DateTime2), N'Nguyen Huu Canh', 25, CAST(N'2022-10-25T13:00:06.7790000' AS DateTime2), 3, 7)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (7, CAST(N'2022-10-25T13:00:43.7370000' AS DateTime2), N'Nguyen Canh Anh', 26, CAST(N'2022-10-25T13:00:43.7370000' AS DateTime2), 7, 7)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (8, CAST(N'2022-11-03T10:24:04.2570000' AS DateTime2), N'Nguyen Kim Song', 20, CAST(N'2022-11-03T10:24:04.2570000' AS DateTime2), 8, 8)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (10, CAST(N'2022-11-22T11:18:12.2080000' AS DateTime2), N'An Nguyen', 18, CAST(N'2022-11-22T11:18:12.2080000' AS DateTime2), 8, 9)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (11, CAST(N'2022-11-22T11:24:08.2210000' AS DateTime2), N'Nguyen Kim Song', 20, CAST(N'2022-11-22T11:24:08.2210000' AS DateTime2), 1, 10)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (12, CAST(N'2022-11-22T11:26:29.6690000' AS DateTime2), N'Le Công Minh', 21, CAST(N'2022-11-22T11:26:29.6690000' AS DateTime2), 7, 11)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (13, CAST(N'2022-11-22T11:27:41.5950000' AS DateTime2), N'Nguyen Quoc Huu', 24, CAST(N'2022-11-22T11:27:41.5950000' AS DateTime2), 8, 12)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (14, CAST(N'2022-11-22T11:28:39.7450000' AS DateTime2), N'Nguyen Canh Anh', 26, CAST(N'2022-11-22T11:28:39.7450000' AS DateTime2), 8, 13)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (15, CAST(N'2022-11-23T15:55:37.7770000' AS DateTime2), N'Nguyen Trung Nam', 23, CAST(N'2022-11-23T15:55:37.7770000' AS DateTime2), 7, 15)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (16, CAST(N'2022-11-23T15:56:18.1830000' AS DateTime2), N'Le Công Minh', 21, CAST(N'2022-11-23T15:56:18.1830000' AS DateTime2), 1, 16)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (17, CAST(N'2022-11-23T15:57:14.3540000' AS DateTime2), N'Nguyen Huu Canh', 25, CAST(N'2022-11-23T15:57:14.3540000' AS DateTime2), 4, 17)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (18, CAST(N'2022-12-02T14:20:14.3540000' AS DateTime2), N'Le Công Minh', 21, CAST(N'2022-12-02T14:20:14.3540000' AS DateTime2), 7, 20)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (19, CAST(N'2022-12-12T23:37:26.7620000' AS DateTime2), N'An Nguyen', 18, CAST(N'2022-12-12T23:37:26.7620000' AS DateTime2), 4, 21)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (20, CAST(N'2022-12-12T23:38:18.6050000' AS DateTime2), N'Le Công Minh', 21, CAST(N'2022-12-12T23:38:18.6050000' AS DateTime2), 8, 22)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (21, CAST(N'2022-12-12T23:40:16.7630000' AS DateTime2), N'Nguyen Canh Anh', 26, CAST(N'2022-12-12T23:40:16.7630000' AS DateTime2), 8, 24)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (22, CAST(N'2022-12-12T23:42:02.3130000' AS DateTime2), N'Nguyen Trung Nam', 23, CAST(N'2022-12-12T23:42:02.3130000' AS DateTime2), 7, 26)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (23, CAST(N'2022-12-14T22:46:48.9670000' AS DateTime2), N'Nguyen Canh Anh', 26, CAST(N'2022-12-14T22:46:48.9670000' AS DateTime2), 8, 27)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (24, CAST(N'2022-12-14T22:47:54.4120000' AS DateTime2), N'Nguyen Trung Hau', 22, CAST(N'2022-12-14T22:47:54.4130000' AS DateTime2), 2, 28)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (25, CAST(N'2022-12-14T22:50:51.5640000' AS DateTime2), N'Nguyen Trung Nam', 23, CAST(N'2022-12-14T22:50:51.5640000' AS DateTime2), 7, 31)
INSERT [dbo].[detail_evaluate] ([id], [create_at], [student_name], [student_id], [update_at], [offence_id], [schedule_evaluate_id]) VALUES (27, CAST(N'2022-12-15T13:21:23.2970000' AS DateTime2), N'Nguyen Trung Nam', 23, CAST(N'2022-12-15T13:21:23.2970000' AS DateTime2), 7, 34)
SET IDENTITY_INSERT [dbo].[detail_evaluate] OFF
GO
SET IDENTITY_INSERT [dbo].[mark] ON 

INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1, CAST(N'2022-10-16T15:47:14.6780000' AS DateTime2), 10, 1, 1, 3, CAST(N'2022-10-16T15:47:14.6790000' AS DateTime2), 1, 17)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (6, CAST(N'2022-10-17T21:41:20.8190000' AS DateTime2), 10, 1, 1, 3, CAST(N'2022-10-17T21:41:20.8190000' AS DateTime2), 2, 17)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (36, CAST(N'2022-10-18T11:51:41.7620000' AS DateTime2), 10, 1, 1, 3, CAST(N'2022-10-18T11:51:41.7620000' AS DateTime2), 2, 18)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1005, CAST(N'2022-12-15T08:50:01.0280000' AS DateTime2), 9, 1, 1, 4, CAST(N'2022-12-15T08:50:01.0280000' AS DateTime2), 2, 18)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1006, CAST(N'2022-12-15T08:50:08.7080000' AS DateTime2), 9, 1, 1, 4, CAST(N'2022-12-15T08:50:08.7080000' AS DateTime2), 2, 20)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1007, CAST(N'2022-12-15T08:50:13.5300000' AS DateTime2), 8, 1, 1, 4, CAST(N'2022-12-15T08:50:13.5300000' AS DateTime2), 2, 21)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1008, CAST(N'2022-12-15T08:50:18.8050000' AS DateTime2), 8, 1, 1, 4, CAST(N'2022-12-15T08:50:18.8050000' AS DateTime2), 2, 22)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1009, CAST(N'2022-12-15T08:50:32.1070000' AS DateTime2), 9, 1, 1, 4, CAST(N'2022-12-15T08:50:32.1070000' AS DateTime2), 2, 23)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1010, CAST(N'2022-12-15T08:50:37.0570000' AS DateTime2), 9, 1, 1, 4, CAST(N'2022-12-15T08:50:37.0570000' AS DateTime2), 2, 24)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1011, CAST(N'2022-12-15T08:50:41.8700000' AS DateTime2), 10, 1, 1, 4, CAST(N'2022-12-15T08:50:41.8700000' AS DateTime2), 2, 25)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1012, CAST(N'2022-12-15T08:50:46.6930000' AS DateTime2), 10, 1, 1, 4, CAST(N'2022-12-15T08:50:46.6930000' AS DateTime2), 2, 26)
INSERT [dbo].[mark] ([id], [create_at], [mark], [semester], [status], [subject_id], [update_at], [mark_type_id], [student_id]) VALUES (1013, CAST(N'2022-12-15T13:30:46.9890000' AS DateTime2), 9, 1, 1, 3, CAST(N'2022-12-15T13:30:46.9900000' AS DateTime2), 2, 20)
SET IDENTITY_INSERT [dbo].[mark] OFF
GO
SET IDENTITY_INSERT [dbo].[mark_type] ON 

INSERT [dbo].[mark_type] ([id], [create_at], [mark_number], [mark_type_name], [update_at]) VALUES (1, CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), 1, N'Đánh giá thường xuyên', CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[mark_type] ([id], [create_at], [mark_number], [mark_type_name], [update_at]) VALUES (2, CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), 2, N'Giữa kỳ', CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[mark_type] ([id], [create_at], [mark_number], [mark_type_name], [update_at]) VALUES (3, CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), 3, N'Cuối kỳ', CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[mark_type] OFF
GO
SET IDENTITY_INSERT [dbo].[offence] ON 

INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (1, CAST(N'2022-09-19T16:10:58.9100000' AS DateTime2), -5, N'Chửi thề, nói tục', 0, CAST(N'2022-09-19T16:10:58.9100000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (2, CAST(N'2022-09-19T16:13:26.5180000' AS DateTime2), -1, N'Về sớm', 0, CAST(N'2022-09-19T16:13:26.5180000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (3, CAST(N'2022-09-19T16:13:44.8450000' AS DateTime2), -5, N'Vắng', 0, CAST(N'2022-09-19T16:13:44.8450000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (4, CAST(N'2022-09-19T16:15:07.3240000' AS DateTime2), 1, N'Đóng góp ý kiến trong giờ học', 1, CAST(N'2022-09-19T16:46:24.3990000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (5, CAST(N'2022-09-19T16:15:42.0060000' AS DateTime2), 1, N'Trung thực có trách nhiệm trong lối sống', 1, CAST(N'2022-09-19T16:15:42.0070000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (6, CAST(N'2022-09-19T16:16:05.0300000' AS DateTime2), -1, N'Vi phạm đồng phục', 0, CAST(N'2022-09-19T16:16:05.0310000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (7, CAST(N'2022-09-19T16:16:25.7480000' AS DateTime2), -1, N'Nói chuyện trong tiết học', 0, CAST(N'2022-09-19T16:16:25.7480000' AS DateTime2))
INSERT [dbo].[offence] ([id], [create_at], [mark_offence], [offence_name], [status], [update_at]) VALUES (8, CAST(N'2022-09-19T16:18:04.7750000' AS DateTime2), 1, N'Tích cực Phát biểu ', 1, CAST(N'2022-09-19T16:50:32.2180000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[offence] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (18, CAST(N'2022-10-13T11:46:20.1520000' AS DateTime2), CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), 1, 1, N'Ôn tập nội dung ở bài 1.', 0, N'Sự hút nước và muối khoáng của rễ nhé', CAST(N'2022-10-15T15:42:33.2760000' AS DateTime2), 11, 283, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (19, CAST(N'2022-10-13T11:51:00.5430000' AS DateTime2), CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), 3, 1, N'- Ôn lại các từ vựng liên quan đến các loại chỗ ở.- Ôn lại chiến thuật làm bài đọc điền và chỗ trống và trả lời câu hỏi ngắn.- Chuẩn bị bài tập số 3, trang 9 sách giáo khoa (Mindset 2)', 0, N'WELCOME- GET TO KNOW', CAST(N'2022-10-14T00:41:05.6100000' AS DateTime2), 11, 283, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (20, CAST(N'2022-10-13T11:52:20.5210000' AS DateTime2), CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), 4, 2, N'- Ôn lại các từ vựng liên quan đến các loại chỗ ở.- Ôn lại chiến thuật làm bài đọc điền và chỗ trống và trả lời câu hỏi ngắn.- Chuẩn bị bài tập số 3, trang 9 sách giáo khoa (Mindset 2)', 0, N'UNIT 1: READING - EXAM SKILLS', CAST(N'2022-10-15T15:29:16.9440000' AS DateTime2), 11, 283, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (21, CAST(N'2022-10-13T11:54:57.3330000' AS DateTime2), CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), 6, 1, N'Học các thành phần của NNLT và các khái niệm liên quan', 0, N'Giới thiệu NNLT Python và phần mềm Pycharm', CAST(N'2022-10-15T15:35:01.5530000' AS DateTime2), 11, 283, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (23, CAST(N'2022-10-13T12:00:45.4300000' AS DateTime2), CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), 1, 1, N'Không', 0, N'Hàm số lượng giác (tiết 1)', CAST(N'2022-10-15T16:38:59.3520000' AS DateTime2), 11, 284, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (35, CAST(N'2022-10-24T16:33:09.7600000' AS DateTime2), CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), 1, 1, N'Ôn tập nội dung ở bài 1.', 0, N'Sự hút nước và muối khoáng của rễ.', CAST(N'2022-10-25T12:38:21.3160000' AS DateTime2), 11, 297, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (36, CAST(N'2022-10-24T16:34:30.8770000' AS DateTime2), CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), 3, 1, N'- Ôn lại các từ vựng liên quan đến các loại chỗ ở.- Ôn lại chiến thuật làm bài đọc điền và chỗ trống và trả lời câu hỏi ngắn.- Chuẩn bị bài tập số 3, trang 9 sách giáo khoa (Mindset 2)', 1, N'WELCOME- GET TO KNOW', CAST(N'2022-10-24T16:34:30.8770000' AS DateTime2), 11, 297, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (37, CAST(N'2022-10-24T16:35:41.3570000' AS DateTime2), CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), 4, 2, N'- Ôn lại các từ vựng liên quan đến các loại chỗ ở.- Ôn lại chiến thuật làm bài đọc điền và chỗ trống và trả lời câu hỏi ngắn.- Chuẩn bị bài tập số 3, trang 9 sách giáo khoa (Mindset 2)', 1, N'UNIT 1: READING - EXAM SKILLS', CAST(N'2022-10-24T16:35:41.3570000' AS DateTime2), 11, 297, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (38, CAST(N'2022-10-24T16:36:24.9950000' AS DateTime2), CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), 6, 1, N'Học các thành phần của NNLT và các khái niệm liên quan', 1, N'Giới thiệu NNLT Python và phần mềm Pycharm', CAST(N'2022-10-24T16:36:24.9950000' AS DateTime2), 11, 297, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (39, CAST(N'2022-10-24T16:36:59.8610000' AS DateTime2), CAST(N'2022-10-24T00:00:00.0000000' AS DateTime2), 8, 1, N'Học bài 1', 1, N'Bài 1. Sự tương phản về trình độ phát triển kinh tế - xã hội của các nhóm nước. Cuộc cách mạng khoa học và công nghệ hiện đại', CAST(N'2022-10-24T16:36:59.8610000' AS DateTime2), 11, 297, 6, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (40, CAST(N'2022-10-24T16:37:46.2950000' AS DateTime2), CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), 1, 1, N'Không', 0, N'Hàm số lượng giác (tiết 1)', CAST(N'2022-10-25T12:23:03.4550000' AS DateTime2), 11, 298, 5, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (41, CAST(N'2022-10-24T16:38:03.6430000' AS DateTime2), CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), 3, 2, N'Xem lí thuyết hoàn thành sơ đồ tư duy', 0, N'Hàm số lượng giác (tiết 2)', CAST(N'2022-10-25T12:59:56.8540000' AS DateTime2), 11, 298, 5, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (42, CAST(N'2022-10-24T17:05:45.4670000' AS DateTime2), CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), 6, 1, N'Học nội dung Bài 1.', 1, N'Bài 1. Tiêu chuẩn trình bày bản vẽ kỹ thuật', CAST(N'2022-10-24T17:05:45.4670000' AS DateTime2), 11, 298, 10, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (43, CAST(N'2022-10-24T17:11:51.6670000' AS DateTime2), CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), 8, 2, N'- Ôn tập lại từ vựng liên quan đến chủ đề khoảng cách thế hệ.', 1, N'UNIT 1: GETTING STARTED', CAST(N'2022-10-24T17:11:51.6670000' AS DateTime2), 11, 298, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (46, CAST(N'2022-10-25T11:03:01.9070000' AS DateTime2), CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), 1, 1, N'Học thuộc bài thơ và nội dung 1 phần đọc hiểu văn bản.', 1, N'Tự tình II (Hồ Xuân Hương)', CAST(N'2022-10-25T11:03:01.9070000' AS DateTime2), 11, 299, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (47, CAST(N'2022-10-25T11:03:59.5150000' AS DateTime2), CAST(N'2022-10-26T00:00:00.0000000' AS DateTime2), 3, 3, N'- Ôn lại từ vựng liên quan đến chủ đề.', 1, N'UNIT 1: READING - LEARNING STRATEGIES', CAST(N'2022-10-25T11:06:17.1820000' AS DateTime2), 11, 299, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (49, CAST(N'2022-11-02T23:16:11.0510000' AS DateTime2), CAST(N'2022-11-03T00:00:00.0000000' AS DateTime2), 1, 10, N'hoc bai bu', 0, N'UNIT 1: English with my friend', CAST(N'2022-11-03T10:23:36.4070000' AS DateTime2), 11, 307, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (50, CAST(N'2022-11-08T13:44:41.9330000' AS DateTime2), CAST(N'2022-11-09T00:00:00.0000000' AS DateTime2), 1, 4, N'Không', 1, N'UNIT 1: READING - LEARNING STRATEGIES', CAST(N'2022-11-08T13:44:53.9320000' AS DateTime2), 11, 313, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (51, CAST(N'2022-11-20T09:47:51.4170000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 1, 5, N'Không', 1, N'Khái niệm về phép dời hình. Hai hình bằng nhau', CAST(N'2022-11-20T09:47:51.4170000' AS DateTime2), 11, 325, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (52, CAST(N'2022-11-20T09:48:35.8570000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 2, 9, N'Làm bài trên OLM', 1, N'Phép vị tự', CAST(N'2022-11-20T09:48:35.8570000' AS DateTime2), 11, 325, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (53, CAST(N'2022-11-20T09:50:34.8760000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 3, 6, N'Học bài 5 (tiết 1 và phần I của tiết 2)', 1, N'Bài 5. Một số vấn đề của châu lục và khu vực (Tiết 2)', CAST(N'2022-11-20T09:50:34.8760000' AS DateTime2), 11, 325, 6, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (54, CAST(N'2022-11-20T09:54:21.8810000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 6, 9, N'Không', 1, N'Chủ đề: Rèn luyện kĩ năng phân tích thơ trung đại (Luyện tập thao tác lập luận phân tích)', CAST(N'2022-11-20T09:54:21.8810000' AS DateTime2), 11, 325, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (55, CAST(N'2022-11-20T09:54:51.1010000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 7, 10, N'Học thuộc toàn bộ nội dung phần đọc hiểu văn bản.', 1, N'Bài ca ngất ngưởng (Nguyễn Công Trứ)', CAST(N'2022-11-20T09:54:51.1010000' AS DateTime2), 11, 325, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (56, CAST(N'2022-11-20T09:55:28.5710000' AS DateTime2), CAST(N'2022-11-21T00:00:00.0000000' AS DateTime2), 8, 4, N'Học các kiểu dữ liệu và tìm hiểu cách khai báo biến', 1, N'Nhập liệu và kiểu dữ liệu (Tiết 2)', CAST(N'2022-11-20T09:55:28.5710000' AS DateTime2), 11, 325, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (57, CAST(N'2022-11-20T10:07:59.3090000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 1, 16, N'- Làm bài tập 14, trang 32, sách Mindset 2. - Chuẩn bị bài 2, trang 34, Writing.', 0, N'Unit 2: Reading skills (Learning strategies)', CAST(N'2022-11-22T11:17:41.2680000' AS DateTime2), 11, 326, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (58, CAST(N'2022-11-20T10:08:43.3610000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 2, 17, N'Không', 0, N'Unit 2: Reading (Language focus)', CAST(N'2022-11-22T11:23:08.1310000' AS DateTime2), 11, 326, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (62, CAST(N'2022-11-20T10:16:50.2460000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 6, 11, N'Học nội dung 2 và 3 phần đọc hiểu văn bản.', 0, N'Bài ca ngắn đi trên bãi cát', CAST(N'2022-11-22T11:28:23.1570000' AS DateTime2), 11, 326, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (63, CAST(N'2022-11-20T10:17:11.1920000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 7, 12, N'Tiếp  theo', 0, N'Bài ca ngắn đi trên bãi cát', CAST(N'2022-11-22T11:29:25.8810000' AS DateTime2), 11, 326, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (64, CAST(N'2022-11-20T10:26:28.5900000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 3, 7, N'Học Bài 4: Phản ứng trao đổi ion trong dung dịch chất điện li.', 0, N'Bài 4: Phản ứng trao đổi ion trong dung dịch chất điện li', CAST(N'2022-11-22T11:25:42.0610000' AS DateTime2), 11, 326, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (65, CAST(N'2022-11-20T10:27:08.1970000' AS DateTime2), CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), 4, 18, N'Không', 0, N'Unit 2: Reading skills (Exam skills)', CAST(N'2022-11-22T11:27:14.8460000' AS DateTime2), 11, 326, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (66, CAST(N'2022-11-20T10:32:15.6590000' AS DateTime2), CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), 6, 13, N'Học nội dung phần tác giả (Cuộc đời, sự nghiệp sáng tác)', 0, N'Văn tế nghĩa sĩ Cần Giuộc', CAST(N'2022-11-23T15:57:49.0700000' AS DateTime2), 11, 327, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (67, CAST(N'2022-11-20T10:32:34.5770000' AS DateTime2), CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), 7, 14, N'Học nội dung 1 phần đọc hiểu văn bản.', 0, N'Văn tế nghĩa sĩ Cần Giuộc', CAST(N'2022-11-23T15:58:24.3370000' AS DateTime2), 11, 327, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (68, CAST(N'2022-11-20T10:34:03.1290000' AS DateTime2), CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), 3, 4, N'Học thuộc bài 4', 0, N'Bài 4. Các nước Đông Nam Á (cuối thế kỉ XIX đến đầu thế kỉ XX).', CAST(N'2022-11-23T15:57:02.1200000' AS DateTime2), 11, 327, 3, 3, N'Nguyễn Quốc Sử')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (69, CAST(N'2022-11-20T10:35:34.3510000' AS DateTime2), CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), 1, 11, N'Không', 0, N'Phương trình bậc hai đối với một hàm số lượng giác (tiết 1) ', CAST(N'2022-11-23T15:55:22.1670000' AS DateTime2), 11, 327, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (70, CAST(N'2022-11-20T10:35:57.7230000' AS DateTime2), CAST(N'2022-11-23T00:00:00.0000000' AS DateTime2), 2, 12, N'Làm bài tập trên OLM', 0, N'Phương trình bậc hai đối với một hàm số lượng giác (tiết 2)', CAST(N'2022-11-23T15:56:08.8920000' AS DateTime2), 11, 327, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (71, CAST(N'2022-11-20T10:37:48.5040000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 1, 10, N'Bài 7: Nitơ', 1, N'Bài 7: Nitơ', CAST(N'2022-11-20T10:37:48.5040000' AS DateTime2), 11, 328, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (72, CAST(N'2022-11-20T10:38:30.7370000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 2, 4, N'Ôn tập nội dung bài 4, hoàn thành câu hỏi vận dụng và câu hỏi cuối bài.', 1, N'Vai trò của các nguyên tố khoáng	', CAST(N'2022-11-20T10:38:30.7370000' AS DateTime2), 11, 328, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (73, CAST(N'2022-11-20T10:39:24.8750000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 3, 8, N'Học câu điều kiện', 1, N'Câu lệnh điều kiện if (Tiết 2)	', CAST(N'2022-11-20T10:39:24.8750000' AS DateTime2), 11, 328, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (74, CAST(N'2022-11-20T10:40:12.6420000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 4, 11, N'Học cấu trúc lặp for', 1, N'Mảng một chiều - Cấu trúc lặp for (Tiết 1)	', CAST(N'2022-11-20T10:40:12.6420000' AS DateTime2), 11, 328, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (75, CAST(N'2022-11-20T10:40:57.6690000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 6, 15, N'Không', 1, N'LISTENING PRACTICE TEST	', CAST(N'2022-11-20T10:40:57.6690000' AS DateTime2), 11, 328, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (76, CAST(N'2022-11-20T10:42:59.0470000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 7, 16, N'Ôn lại từ vựng được học trong bài "Reading".', 1, N'Unit 2: Reading	', CAST(N'2022-11-20T10:42:59.0470000' AS DateTime2), 11, 328, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (77, CAST(N'2022-11-20T10:45:31.4340000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 8, 5, N'Không', 1, N'Bài 4. Mặt cắt. Hình cắt	Không có', CAST(N'2022-11-20T10:45:31.4340000' AS DateTime2), 11, 328, 10, 15, N'Nguyễn Thị Nghệ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (78, CAST(N'2022-11-20T10:45:50.3160000' AS DateTime2), CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), 9, 6, N'Không', 1, N'Bài 5. Hình chiếu trục đo', CAST(N'2022-11-20T10:45:50.3160000' AS DateTime2), 11, 328, 10, 15, N'Nguyễn Thị Nghệ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (79, CAST(N'2022-11-20T10:59:03.5420000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 1, 13, N'Không', 1, N'Phương trình bậc nhất đối với sinx và cosx (tiết 1)', CAST(N'2022-11-20T10:59:03.5420000' AS DateTime2), 11, 329, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (80, CAST(N'2022-11-20T10:59:32.5150000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 2, 14, N'Làm bài trên OLM', 1, N'Phương trình bậc nhất đối với sinx và cosx (tiết 2)', CAST(N'2022-11-20T10:59:32.5150000' AS DateTime2), 11, 329, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (81, CAST(N'2022-11-20T11:01:01.1690000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 3, 17, N' Ôn lại từ vựng liên quan đến "Leisure activities và hobbies".', 1, N'Teacher''s choice	', CAST(N'2022-11-20T11:01:22.6970000' AS DateTime2), 11, 329, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (82, CAST(N'2022-11-20T11:02:15.5570000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 7, 5, N'Ôn tập nội dung tiết 1 chủ đề dinh dưỡng Nitơ ở thực vật.', 1, N'Chủ đề: Dinh dưỡng Nitơ ở thực vật	', CAST(N'2022-11-20T11:02:15.5570000' AS DateTime2), 11, 329, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (83, CAST(N'2022-11-20T11:03:22.5960000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 8, 12, N'Không', 1, N'Mảng nhiều chiều - For lồng nhau (Tiết 2)', CAST(N'2022-11-20T11:03:22.5960000' AS DateTime2), 11, 329, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (84, CAST(N'2022-11-20T11:03:54.2790000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 9, 17, N'Tiết sau kiểm tra 15 phút', 1, N'Cấu trúc lặp While	', CAST(N'2022-11-20T11:03:54.2790000' AS DateTime2), 11, 329, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (85, CAST(N'2022-11-27T23:44:11.6980000' AS DateTime2), CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), 1, 8, N'Ôn tập kỹ các nội dung chuẩn bị kiểm tra giữa học kì 1.', 1, N'Ôn tập', CAST(N'2022-11-27T23:44:11.6980000' AS DateTime2), 11, 332, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (86, CAST(N'2022-11-27T23:45:10.6720000' AS DateTime2), CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), 2, 21, N'Không', 1, N'Nhị thức Newton (tiết 2)', CAST(N'2022-11-27T23:45:10.6720000' AS DateTime2), 11, 332, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (87, CAST(N'2022-11-27T23:45:34.5870000' AS DateTime2), CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), 3, 25, N'Không', 1, N'Phép thử và biến cố', CAST(N'2022-11-27T23:45:34.5870000' AS DateTime2), 11, 332, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (88, CAST(N'2022-11-27T23:47:33.1490000' AS DateTime2), CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), 6, 15, N'Học bài photpho', 1, N'PhotPho', CAST(N'2022-11-27T23:47:33.1490000' AS DateTime2), 11, 332, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (89, CAST(N'2022-11-27T23:48:42.0280000' AS DateTime2), CAST(N'2022-11-28T00:00:00.0000000' AS DateTime2), 7, 13, N'Học công thức Bài 8. Điện năng. Công suất điện', 1, N'Điện Năng. Công suất điện', CAST(N'2022-11-27T23:48:42.0280000' AS DateTime2), 11, 332, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (90, CAST(N'2022-11-27T23:50:56.1950000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 1, 29, N'CLMS: UNIT 3-WRITING SKILLS', 1, N'WRITING PRACTICE TEST', CAST(N'2022-11-27T23:50:56.1950000' AS DateTime2), 11, 333, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (91, CAST(N'2022-11-27T23:51:29.3690000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 2, 30, N'CLMS: UNIT 3-WRITING SKILLS tt', 1, N'WRITING PRACTICE TEST tt', CAST(N'2022-11-27T23:51:29.3690000' AS DateTime2), 11, 333, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (92, CAST(N'2022-11-27T23:52:11.0640000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 3, 15, N'Học đề cương tiết sau thi GKI', 1, N'Ôn tập', CAST(N'2022-11-27T23:52:11.0640000' AS DateTime2), 11, 333, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (93, CAST(N'2022-11-27T23:54:09.3260000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 4, 31, N'CLMS: UNIT 3-WRITING SKILLS tts', 1, N'WRITING PRACTICE TEST tts', CAST(N'2022-11-27T23:54:09.3260000' AS DateTime2), 11, 333, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (94, CAST(N'2022-11-27T23:55:06.8920000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 5, 2, N'Tiết sau thi GKI', 1, N'Thực hành 1: Thao trên phần mềm pycharm', CAST(N'2022-11-27T23:55:06.8920000' AS DateTime2), 11, 333, 9, 12, N'Trần Học Tin')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (95, CAST(N'2022-11-27T23:56:29.8770000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 6, 14, N'Không', 1, N'Bài 8. Điện năng. Công suất điện (tiếp theo)', CAST(N'2022-11-27T23:56:59.4840000' AS DateTime2), 11, 333, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (96, CAST(N'2022-11-27T23:58:09.8830000' AS DateTime2), CAST(N'2022-11-29T00:00:00.0000000' AS DateTime2), 7, 7, N'Học thuộc bài 7', 1, N'Bài 7. Những thành tựu văn hoá thời Cận đại.', CAST(N'2022-11-27T23:58:09.8830000' AS DateTime2), 11, 333, 3, 3, N'Nguyễn Quốc Sử')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (97, CAST(N'2022-11-27T23:59:57.0520000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 1, 27, N'Không', 1, N'Xác suất của biến cố (tiết 1)', CAST(N'2022-11-27T23:59:57.0520000' AS DateTime2), 11, 334, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (98, CAST(N'2022-11-28T00:00:13.0720000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 2, 28, N'Không', 1, N'Hai đường thẳng chéo nhau và hai đường thẳng song song (tiết 1)', CAST(N'2022-11-28T00:00:13.0720000' AS DateTime2), 11, 334, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (99, CAST(N'2022-11-28T00:01:00.6300000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 3, 17, N'Ôn tập ngữ pháp unit 1, 2, 3.', 1, N'REVIEW 1 (cont)', CAST(N'2022-11-28T00:01:00.6300000' AS DateTime2), 11, 334, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (100, CAST(N'2022-11-28T00:01:54.8750000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 6, 28, N'Học nội dung phần 1. Cảnh phố huyện lúc chiều tàn.', 1, N'Hai đứa trẻ (Thạch Lam)', CAST(N'2022-11-28T00:01:54.8750000' AS DateTime2), 11, 334, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (101, CAST(N'2022-11-28T00:02:16.3350000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 7, 29, N'Học nội dung 2. Cảnh phố huyện lúc đêm tối', 1, N'Hai đứa trẻ (Thạch Lam) tt', CAST(N'2022-11-28T00:02:27.8310000' AS DateTime2), 11, 334, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (102, CAST(N'2022-11-28T00:03:42.1710000' AS DateTime2), CAST(N'2022-11-30T00:00:00.0000000' AS DateTime2), 8, 11, N'Học bài 6 (Tiết 2)', 1, N'Bài 6. Hợp chủng quốc Hoa Kì (Tiết 2. Kinh tế).', CAST(N'2022-11-28T00:03:42.1710000' AS DateTime2), 11, 334, 6, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (103, CAST(N'2022-11-28T00:06:14.2550000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 1, 16, N'Hoàn thành và học nội dung ôn tập.', 1, N'Axit photphoric và muối photphat', CAST(N'2022-11-28T00:06:14.2550000' AS DateTime2), 11, 335, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (104, CAST(N'2022-11-28T00:08:10.2630000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 2, 32, N'Không', 1, N'Active speaking week 7', CAST(N'2022-11-28T00:08:10.2630000' AS DateTime2), 11, 335, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (105, CAST(N'2022-11-28T00:09:17.7590000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 3, 16, N'Ôn tập kiến thức chương I, II.', 1, N'Bài 9. Định luật Ôm đối với toàn mạch', CAST(N'2022-11-28T00:09:17.7590000' AS DateTime2), 11, 335, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (106, CAST(N'2022-11-28T00:10:47.4880000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 6, 33, N'Ôn tập từ vựng, ngữ pháp unit 1, 2', 1, N'Review for midterm test', CAST(N'2022-11-28T00:10:47.4880000' AS DateTime2), 11, 335, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (107, CAST(N'2022-11-28T00:11:11.1070000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 7, 34, N'Ôn tập từ vựng, ngữ pháp unit 1, 2 tt', 1, N'Review for midterm test tt', CAST(N'2022-11-28T00:11:11.1070000' AS DateTime2), 11, 335, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (108, CAST(N'2022-11-28T00:11:49.3770000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 1, 35, N'CLMS: UNIT3 - LISTENING AND SPEAKING SKILLS', 0, N'UNIT 4: READING SKILLS', CAST(N'2022-12-02T14:17:25.7420000' AS DateTime2), 11, 336, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (109, CAST(N'2022-11-28T00:12:18.3620000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 2, 36, N'Không', 1, N'UNIT 4: READING SKILLS tt', CAST(N'2022-11-28T00:12:18.3620000' AS DateTime2), 11, 336, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (110, CAST(N'2022-11-28T00:12:57.0800000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 4, 37, N'Không', 1, N'UNIT 4: READING SKILLS tts', CAST(N'2022-11-28T00:12:57.0800000' AS DateTime2), 11, 336, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (111, CAST(N'2022-11-28T00:13:43.5740000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 6, 30, N'Học lý thuyết bài ngữ cảnh.', 1, N'Ngữ cảnh', CAST(N'2022-11-28T00:13:43.5740000' AS DateTime2), 11, 336, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (112, CAST(N'2022-11-28T00:14:21.7810000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 7, 31, N'Xem lại tất cả lý thuyết đã ôn trên lớp.', 1, N'Ôn tập giữa kỳ I', CAST(N'2022-11-28T00:14:21.7810000' AS DateTime2), 11, 336, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (113, CAST(N'2022-11-28T00:15:05.3170000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 8, 19, N'Không', 1, N'Vật liệu cơ khí', CAST(N'2022-11-28T00:15:05.3170000' AS DateTime2), 11, 336, 10, 15, N'Nguyễn Thị Nghệ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (114, CAST(N'2022-11-28T00:15:31.4540000' AS DateTime2), CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), 9, 20, N'Ôn tập đề cương KT giữa HKI', 1, N'Công nghệ chế tạo phôi', CAST(N'2022-11-28T00:15:31.4540000' AS DateTime2), 11, 336, 10, 15, N'Nguyễn Thị Nghệ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (115, CAST(N'2022-12-02T14:16:22.7310000' AS DateTime2), CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), 1, 12, N'Không', 1, N'Đại Số', CAST(N'2022-12-02T14:16:22.7310000' AS DateTime2), 11, 337, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (117, CAST(N'2022-12-04T16:23:52.6470000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 1, 35, N'Unit 3: Writing Skills', 1, N'Unit 3: Writing Skills', CAST(N'2022-12-04T16:23:52.6470000' AS DateTime2), 11, 339, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (118, CAST(N'2022-12-04T16:24:48.6670000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 2, 36, N'Hoàn thành bài viết giáo viên yêu cầu.', 1, N'Unit 3: Writing Skills tt', CAST(N'2022-12-04T16:24:59.6050000' AS DateTime2), 11, 339, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (119, CAST(N'2022-12-04T16:28:01.5090000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 3, 8, N'Không', 1, N'Ôn tập kiểm tra giữa kỳ I', CAST(N'2022-12-04T16:28:01.5090000' AS DateTime2), 11, 339, 6, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (120, CAST(N'2022-12-04T22:55:47.1070000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 4, 37, N'Không', 1, N'Unit 3: Writing Skills', CAST(N'2022-12-04T22:55:47.1070000' AS DateTime2), 11, 339, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (121, CAST(N'2022-12-04T22:56:34.4000000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 6, 21, N'Ôn tập kiến thức kiểm tra giữa HKI', 1, N'Ôn tập kiểm tra giữa kì I', CAST(N'2022-12-04T22:56:34.4000000' AS DateTime2), 11, 339, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (122, CAST(N'2022-12-04T22:58:28.1420000' AS DateTime2), CAST(N'2022-12-05T00:00:00.0000000' AS DateTime2), 7, 11, N'Hoàn thành và học nội dung ôn tập.', 1, N'ÔN TẬP GK1	', CAST(N'2022-12-04T22:58:28.1420000' AS DateTime2), 11, 339, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (123, CAST(N'2022-12-04T22:59:59.7650000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 1, 38, N'Không', 1, N'Active Speaking Week 8', CAST(N'2022-12-04T22:59:59.7650000' AS DateTime2), 11, 340, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (124, CAST(N'2022-12-04T23:00:12.9590000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 2, 39, N'Không', 1, N'Active Speaking Week 9', CAST(N'2022-12-04T23:00:12.9590000' AS DateTime2), 11, 340, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (125, CAST(N'2022-12-04T23:01:10.8780000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 3, 8, N'Học bài 1,3 và 6 để kiểm tra giữa kỳ vào đầu tháng 11.', 1, N'Ôn tập kiểm tra giữa kỳ 1', CAST(N'2022-12-04T23:01:10.8780000' AS DateTime2), 11, 340, 3, 3, N'Nguyễn Quốc Sử')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (126, CAST(N'2022-12-04T23:02:07.1760000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 4, 40, N'không', 1, N'Active Speaking Week 11', CAST(N'2022-12-04T23:02:07.1760000' AS DateTime2), 11, 340, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (127, CAST(N'2022-12-04T23:02:41.1290000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 6, 28, N'Không', 1, N'Xác suất của biến cố (tiết 2)', CAST(N'2022-12-04T23:02:41.1290000' AS DateTime2), 11, 340, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (128, CAST(N'2022-12-04T23:03:03.4100000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 7, 27, N'Làm bài trong đề cương', 1, N'Xác suất của biến cố (tiết 3)', CAST(N'2022-12-04T23:03:03.4100000' AS DateTime2), 11, 340, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (129, CAST(N'2022-12-11T17:54:35.2390000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 1, 39, N'CLMS: UNIT 3 (LISTENING SKILLS)', 0, N'UNIT 3 - LISTENING SKILLS', CAST(N'2022-12-12T23:36:49.2630000' AS DateTime2), 11, 346, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (130, CAST(N'2022-12-11T17:55:02.2140000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 2, 40, N'Không', 0, N'UNIT 3 - LISTENING SKILLS tt', CAST(N'2022-12-12T23:37:55.3610000' AS DateTime2), 11, 346, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (131, CAST(N'2022-12-11T17:56:04.6360000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 3, 21, N'Không', 0, N'Bài 16. Công Nghệ chế tạo phôi (tiếp theo)', CAST(N'2022-12-12T23:39:03.1190000' AS DateTime2), 11, 346, 10, 15, N'Nguyễn Thị Nghệ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (132, CAST(N'2022-12-11T17:56:59.8270000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 6, 33, N'Ôn kỹ nội dung trong đề ôn để thi tốt', 0, N'Ôn tập kiểm tra giữa HK1', CAST(N'2022-12-12T23:40:06.6070000' AS DateTime2), 11, 346, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (133, CAST(N'2022-12-11T17:57:54.9840000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 7, 24, N'Ôn kỹ nội dung trong đề ôn để thi tốt', 0, N'Ôn tập kiểm tra giữa HK1 tt', CAST(N'2022-12-12T23:41:04.8270000' AS DateTime2), 11, 346, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (134, CAST(N'2022-12-11T17:58:37.7420000' AS DateTime2), CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 8, 9, N'Không', 0, N'Ôn tập kiểm tra giữa HK1 ', CAST(N'2022-12-12T23:41:47.1930000' AS DateTime2), 11, 346, 6, 9, N'Trần Thị Địa Lý ')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (135, CAST(N'2022-12-11T18:00:52.4990000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 1, 41, N'Không', 1, N'Active Speaking Week 9', CAST(N'2022-12-11T18:00:52.4990000' AS DateTime2), 11, 347, 8, 6, N'Nguyễn Quốc Anh')
GO
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (136, CAST(N'2022-12-11T18:01:44.1750000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 2, 42, N'Không', 1, N'Active Speaking Week 9 tt', CAST(N'2022-12-11T18:01:44.1750000' AS DateTime2), 11, 347, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (137, CAST(N'2022-12-11T18:02:42.4840000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 3, 10, N'HS ôn tập lại nội dung bài quang hợp.', 1, N'Quang hợp ở thực vật.', CAST(N'2022-12-11T18:02:42.4840000' AS DateTime2), 11, 347, 7, 11, N'Trần Thi Sinh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (138, CAST(N'2022-12-11T18:04:12.3850000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 6, 8, N'Không', 1, N'Kiểm tra giữa học kì 1', CAST(N'2022-12-11T18:06:34.1810000' AS DateTime2), 11, 347, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (139, CAST(N'2022-12-11T18:06:27.0280000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 7, 9, N'Không', 1, N'Dãy số (tiết 1)', CAST(N'2022-12-11T18:06:47.0890000' AS DateTime2), 11, 347, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (140, CAST(N'2022-12-11T18:08:54.6640000' AS DateTime2), CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), 1, 10, N'Không', 0, N'Phương pháp quy nạp toán học (tiết 1)', CAST(N'2022-12-14T22:46:28.6130000' AS DateTime2), 11, 348, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (141, CAST(N'2022-12-11T18:09:04.9310000' AS DateTime2), CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), 2, 11, N'BTVN trên OLM', 0, N'Phương pháp quy nạp toán học (tiết 2)', CAST(N'2022-12-14T22:47:28.8850000' AS DateTime2), 11, 348, 5, 5, N'Nguyễn Văn Toán')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (142, CAST(N'2022-12-11T18:10:43.3970000' AS DateTime2), CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), 3, 8, N'Chuẩn bị bài phân bón hóa học', 0, N'Luyện tập: Axit, bazơ và muối.', CAST(N'2022-12-14T22:48:59.7320000' AS DateTime2), 11, 348, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (143, CAST(N'2022-12-11T18:13:11.6930000' AS DateTime2), CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), 6, 10, N'Xem trước bài 9', 0, N'Bài 8. Ôn tập lịch sử thế giới cận đại.', CAST(N'2022-12-14T22:49:38.6220000' AS DateTime2), 11, 348, 3, 3, N'Nguyễn Quốc Sử')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (144, CAST(N'2022-12-11T18:13:58.5720000' AS DateTime2), CAST(N'2022-12-14T00:00:00.0000000' AS DateTime2), 7, 5, N'Xem lại công thức tính công, điện thế, hiệu điện thế giải BT OLM', 0, N'Bài tập. Định luật Cu lông. Điện trường. Cường độ điện trường	', CAST(N'2022-12-14T22:50:36.9570000' AS DateTime2), 11, 348, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (145, CAST(N'2022-12-11T18:17:25.4510000' AS DateTime2), CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), 1, 35, N'Chuẩn bị bài Hạnh phúc một tang gia.', 0, N'Kiểm tra giữa HKI', CAST(N'2022-12-15T08:48:14.5260000' AS DateTime2), 11, 349, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (146, CAST(N'2022-12-11T18:17:44.1350000' AS DateTime2), CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), 2, 36, N'Đọc trước phần tác giả và tác phẩm Hạnh phúc một tang gia.', 0, N'Kiểm tra giữa HKI', CAST(N'2022-12-15T08:48:47.1790000' AS DateTime2), 11, 349, 4, 7, N'Nguyễn Việt Văn')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (147, CAST(N'2022-12-11T18:20:46.7810000' AS DateTime2), CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), 3, 11, N'Không', 0, N'Kiểm tra giữa HKI', CAST(N'2022-12-15T13:20:46.9520000' AS DateTime2), 11, 349, 3, 3, N'Nguyễn Quốc Sử')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (148, CAST(N'2022-12-11T18:22:18.3160000' AS DateTime2), CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), 6, 43, N'Ôn tập từ vựng và ngữ pháp unit  1, 2, 3.', 1, N'REVIEW FOR MIDTERM TEST', CAST(N'2022-12-11T18:22:18.3160000' AS DateTime2), 11, 349, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (149, CAST(N'2022-12-11T18:22:43.3890000' AS DateTime2), CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), 7, 44, N'Luyện đọc và nghe các bài tập trong sách.', 1, N'REVIEW FOR MIDTERM TEST', CAST(N'2022-12-11T18:22:43.3890000' AS DateTime2), 11, 349, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (150, CAST(N'2022-12-11T18:23:31.2440000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 1, 45, N'Không', 1, N'REVIEW ', CAST(N'2022-12-11T18:23:31.2440000' AS DateTime2), 11, 350, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (151, CAST(N'2022-12-11T18:24:30.6170000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 2, 46, N'Không', 1, N'ENGLISH - MIDTERM TEST', CAST(N'2022-12-11T18:24:30.6170000' AS DateTime2), 11, 350, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (152, CAST(N'2022-12-11T18:25:24.5580000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 6, 18, N'Học bài phân bón hóa học', 1, N'Phân bón hóa học', CAST(N'2022-12-11T18:25:24.5580000' AS DateTime2), 11, 350, 12, 14, N'Dương Quá')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (153, CAST(N'2022-12-11T18:26:37.9630000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 7, 8, N'Không', 1, N'Bài tập . điện thế. công của lực điện', CAST(N'2022-12-11T18:26:37.9630000' AS DateTime2), 11, 350, 13, 8, N'Trần Công Lý')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (154, CAST(N'2022-12-15T13:19:15.3520000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 9, 123, N'khong', 1, N'Practice1', CAST(N'2022-12-15T13:19:15.3520000' AS DateTime2), 11, 350, 8, 6, N'Nguyễn Quốc Anh')
INSERT [dbo].[schedule] ([id], [create_at], [date_start], [lession], [lessionppct], [note], [status], [subject_content], [update_at], [clazz_id], [date_id], [subject_id], [id_teacher], [name_teacher]) VALUES (155, CAST(N'2022-12-15T13:25:49.9070000' AS DateTime2), CAST(N'2022-12-16T00:00:00.0000000' AS DateTime2), 5, 122, N'khong', 1, N'Bài 3: CHIẾN TRANH THẾ GIỚI THỨ HAI_TIẾT 1', CAST(N'2022-12-15T13:25:49.9070000' AS DateTime2), 11, 350, 3, 3, N'Nguyễn Quốc Sử')
SET IDENTITY_INSERT [dbo].[schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule_evaluate] ON 

INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (4, N'Ngoan', N'Học bài cũ', 9, 9, 9, 40)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (5, N'Tốt Ngoan', N'Xem bài cũ', 10, 10, 10, 35)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (7, N'Lớp chưa ngoan', N'Trả bài cũ', 8, 7, 7, 41)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (8, N'Tot', N'Xem Bai Cu', 10, 9, 10, 49)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (9, N'Lớp ngoan', N'Học bài cũ', 10, 9, 10, 57)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (10, N'Lớp chưa ngoan', N'Không', 8, 8, 4, 58)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (11, N'Lớp mất trật tự', N'Không', 10, 6, 10, 64)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (12, N'Lớp ngoan', N'Học bài cũ', 9, 9, 9, 65)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (13, N'Ngoan', N'Làm bài tập', 10, 10, 10, 62)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (14, N'Ngoan', N'Làm bài tập', 10, 10, 8, 63)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (15, N'Tốt', N'Xem bài cũ', 10, 10, 10, 69)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (16, N'Chưa Tốt', N'Xem bài cũ', 7, 7, 7, 70)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (17, N'Lớp ngoan', N'Trả bài cũ', 10, 10, 10, 68)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (18, N'Lớp ngoan', N'không', 9, 10, 9, 66)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (19, N'Lớp ngoan', N'không', 10, 10, 10, 67)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (20, N'Ngoan', N'Học bài cũ', 9, 9, 9, 108)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (21, N'Tốt', N'không', 10, 9, 10, 129)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (22, N'Ngoan', N'Không', 9, 9, 9, 130)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (23, N'Lớp ngoan', N'Học nội dung', 10, 9, 9, 131)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (24, N'Tốt', N'Học bài', 9, 9, 9, 132)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (25, N'Tốt', N'Học bài Kiểm tra', 9, 10, 9, 133)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (26, N'Chưa tốt', N'Xem đề cương ôn tập', 9, 7, 9, 134)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (27, N'Lớp Ngoan', N'trả bài ', 9, 9, 10, 140)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (28, N'Tốt', N'Xem bài mới', 10, 7, 10, 141)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (29, N'Lớp Ngoan', N'Trả bài', 10, 10, 10, 142)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (30, N'Ngoan', N'Có trả bài', 10, 10, 10, 143)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (31, N'Tốt', N'Làm bài tập', 10, 8, 10, 144)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (32, N'Tot', N'Xem bai moi', 10, 10, 9, 145)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (33, N'Tốt', N'Xem bài cũ', 10, 10, 10, 146)
INSERT [dbo].[schedule_evaluate] ([id], [evaluate_note], [home_work], [mark1], [mark2], [mark3], [schedule_id]) VALUES (34, N'Tốt', N'Xem bài cũ', 9, 9, 10, 147)
SET IDENTITY_INSERT [dbo].[schedule_evaluate] OFF
GO
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (17, N'Nguyễn Tất thành,TP Cà Mau', CAST(N'2003-06-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T15:46:30.5000000' AS DateTime2), N'annq@gmail.com', 1, N'Nguyen Quoc An', N'0917265263', 1, CAST(N'2022-10-11T15:46:30.5000000' AS DateTime2), 9, 25)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (18, N'3thang 2,TP Can Tho', CAST(N'2004-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T16:20:20.2240000' AS DateTime2), N'annq@gmail.com', 1, N'An Nguyen', N'0917586365', 1, CAST(N'2022-10-11T16:20:20.2240000' AS DateTime2), 11, 26)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (19, N'3thang 2,TP Can Tho', CAST(N'2004-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T16:21:54.8140000' AS DateTime2), N'minhlc@gmail.com', 1, N'Le Cong Minh', N'0917586365', 1, CAST(N'2022-10-11T16:21:54.8140000' AS DateTime2), 9, 27)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (20, N'Nguyễn Tất thành,TP Cà Mau', CAST(N'2000-06-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-14T23:45:11.3850000' AS DateTime2), N'songnk@gmail.com', 0, N'Nguyen Kim Song', N'0823438128', 1, CAST(N'2022-10-14T23:45:11.3850000' AS DateTime2), 11, 28)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (21, N'Thoi Binh Ca Mau', CAST(N'2000-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T10:51:06.1430000' AS DateTime2), N'minhlc@gmail.com', 1, N'Le Công Minh', N'0917265262', 1, CAST(N'2022-10-24T10:51:06.1430000' AS DateTime2), 11, 29)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (22, N'3thang 2,TP Can Tho', CAST(N'2000-06-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:13:46.7060000' AS DateTime2), N'haunt@gmail.com', 1, N'Nguyen Trung Hau', N'0917265263', 1, CAST(N'2022-10-24T16:13:46.7060000' AS DateTime2), 11, 30)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (23, N'3thang 2,TP Can Tho', CAST(N'2003-05-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:14:28.5460000' AS DateTime2), N'namnt@gmail.com', 1, N'Nguyen Trung Nam', N'0917265222', 1, CAST(N'2022-10-24T16:14:28.5460000' AS DateTime2), 11, 31)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (24, N'3thang 2,TP Can Tho', CAST(N'2003-05-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:15:19.8050000' AS DateTime2), N'huunq@gmail.com', 1, N'Nguyen Quoc Huu', N'0917265210', 1, CAST(N'2022-10-24T16:15:19.8050000' AS DateTime2), 11, 32)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (25, N'3thang 2,TP Can Tho', CAST(N'2003-05-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:16:09.7050000' AS DateTime2), N'canhnq@gmail.com', 1, N'Nguyen Huu Canh', N'0917265210', 1, CAST(N'2022-10-24T16:16:09.7050000' AS DateTime2), 11, 33)
INSERT [dbo].[student] ([id], [address], [birth_date], [create_at], [email], [gender], [name_student], [phone], [status], [update_at], [clazz_id], [student_family_id]) VALUES (26, N'3thang 2,TP Can Tho', CAST(N'2004-05-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-24T16:17:11.8210000' AS DateTime2), N'anhnc@gmail.com', 1, N'Nguyen Canh Anh', N'0917265210', 1, CAST(N'2022-10-24T16:17:11.8210000' AS DateTime2), 11, 34)
SET IDENTITY_INSERT [dbo].[student] OFF
GO
SET IDENTITY_INSERT [dbo].[student_family] ON 

INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (1, CAST(N'2022-09-18T11:01:53.8010000' AS DateTime2), N'Nhiem@gmail.com', N'Nguyễn Văn Nhiệm', N'Trần Thị Luyến', N'097899635', CAST(N'2022-09-18T11:01:53.8010000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (2, CAST(N'2022-09-18T11:24:58.9130000' AS DateTime2), N'ThanhF@gmail.com', N'Nguyễn Tiến ThànhF', N'Trần Thu Hoài', N'0917265289', CAST(N'2022-09-18T11:24:58.9130000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (3, CAST(N'2022-09-18T11:27:19.7010000' AS DateTime2), N'ThanhVTF@gmail.com', N'Võ Tiến Luật', N'Trần Thị Thảo', N'0917265245', CAST(N'2022-09-18T11:27:19.7010000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (4, CAST(N'2022-09-18T11:33:23.0750000' AS DateTime2), N'anh@gmail.com', N'Nguyễn Tiến Anh', N'Trần Thu Hoài', N'0917265263', CAST(N'2022-09-18T11:33:23.0750000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (5, CAST(N'2022-09-18T11:35:19.0080000' AS DateTime2), N'DungKienF@gmail.com', N'Nguyen Tien Dung', N'Tran Thi Thao', N'0917265289', CAST(N'2022-09-18T11:35:19.0080000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (6, CAST(N'2022-09-18T11:37:10.7330000' AS DateTime2), N'DucHT@gmail.com', N'Hà Tiến Đức', N'Trần Thị Thảo', N'0917265262', CAST(N'2022-09-18T11:37:10.7330000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (7, CAST(N'2022-09-18T11:38:32.3690000' AS DateTime2), N'luatNT1@gmail.com', N'Hà Tiến Luật', N'Tran Thi Dep', N'0917265267', CAST(N'2022-09-18T11:38:32.3690000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (10, CAST(N'2022-09-18T11:41:00.7120000' AS DateTime2), N'luatNT12@gmail.com', N'Nguyen Tien Luat', N'Trần Thu Hoài', N'0917265267', CAST(N'2022-09-18T11:41:00.7120000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (11, CAST(N'2022-09-18T11:55:03.7440000' AS DateTime2), N'Dung@gmail.com', N'Nguyen Tien Dung', N'Tran Thi Thao', N'0917265267', CAST(N'2022-09-18T11:55:03.7440000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (13, CAST(N'2022-09-18T11:56:53.0080000' AS DateTime2), N'DungNT1@gmail.com', N'Nguyen Tien Dung', N'Tran Thi Thao', N'0917265267', CAST(N'2022-09-18T11:56:53.0080000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (14, CAST(N'2022-09-18T12:02:31.9890000' AS DateTime2), N'TienN@gmail.com', N'Nguyen Tien', N'Tran Thi Thao', N'0917265266', CAST(N'2022-09-18T12:02:31.9890000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (15, CAST(N'2022-09-20T22:22:54.3280000' AS DateTime2), N'anhNH@gmail.com', N'Nguyễn Hồng Anh', N'Tran Thi Dao', N'0823438654', CAST(N'2022-09-20T22:22:54.3290000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (16, CAST(N'2022-09-20T22:23:01.0890000' AS DateTime2), N'anhNH1@gmail.com', N'Nguyễn Hồng Anh', N'Tran Thi Dao', N'0823438654', CAST(N'2022-09-20T22:23:01.0890000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (17, CAST(N'2022-09-20T22:23:15.1070000' AS DateTime2), N'anhNH11@gmail.com', N'Nguyễn Hồng Anh', N'Tran Thi Dao', N'0823438654', CAST(N'2022-09-20T22:23:15.1070000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (20, CAST(N'2022-09-20T22:25:33.5170000' AS DateTime2), N'QuangFT@gmail.com', N'Nguyen Van Te', N'Tran Thi Luu', N'0823438741', CAST(N'2022-09-20T22:25:33.5170000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (21, CAST(N'2022-09-20T23:07:27.7100000' AS DateTime2), N'TrongNV1@gmail.com', N'Nguyen Van Trong', N'Tran Thi Dao', N'0823438127', CAST(N'2022-09-20T23:07:27.7100000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (22, CAST(N'2022-09-20T23:14:32.4260000' AS DateTime2), N'TeoNQ@gmail.com', N'Nguyen QuocTeo', N'Tran Thi Luu', N'0823438127', CAST(N'2022-09-20T23:14:32.4260000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (23, CAST(N'2022-09-20T23:15:27.1890000' AS DateTime2), N'TeoNQ1@gmail.com', N'Nguyen Quoc Teo1', N'Tran Thi Luu', N'0823438127', CAST(N'2022-09-20T23:15:27.1890000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (24, CAST(N'2022-09-20T23:17:24.9610000' AS DateTime2), N'AnhNN@gmail.com', N'Nguyen Nha Anh', N'Tran Thi Luu', N'0823438127', CAST(N'2022-09-20T23:17:24.9610000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (25, CAST(N'2022-10-11T15:46:30.3170000' AS DateTime2), N'binhnq@gmail.com', N'Nguyen Quoc Binh', N'Tran Thi Dao', N'0917265262', CAST(N'2022-10-11T15:46:30.3170000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (26, CAST(N'2022-10-11T16:20:20.1160000' AS DateTime2), N'thiennv@gmail.com', N'Nguyen Van Thien', N'Tran Thi Be Hai', N'0823438127', CAST(N'2022-10-11T16:20:20.1160000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (27, CAST(N'2022-10-11T16:21:54.7520000' AS DateTime2), N'thienlv@gmail.com', N'Le Van Thien', N'Tran Thi Be Hai', N'0823438127', CAST(N'2022-10-11T16:21:54.7520000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (28, CAST(N'2022-10-14T23:45:11.1250000' AS DateTime2), N'sangnk@gmail.com', N'Nguyen Kim Sang', N'Tran Thi Dao', N'0823438127', CAST(N'2022-10-14T23:45:11.1250000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (29, CAST(N'2022-10-24T10:51:05.7080000' AS DateTime2), N'Conglva@gmail.com', N'Le Van Anh Cong', N'Tran Thi Be Hai', N'0823438127', CAST(N'2022-10-24T10:51:05.7090000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (30, CAST(N'2022-10-24T16:13:46.5980000' AS DateTime2), N'phant@gmail.com', N'Nguyen Trung Pha', N'Tran Thi Dao', N'0823438127', CAST(N'2022-10-24T16:13:46.5990000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (31, CAST(N'2022-10-24T16:14:28.5050000' AS DateTime2), N'phamnt@gmail.com', N'Nguyen Trung Pham', N'Tran Thi Anh', N'0823438177', CAST(N'2022-10-24T16:14:28.5050000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (32, CAST(N'2022-10-24T16:15:19.7690000' AS DateTime2), N'namnq@gmail.com', N'Nguyen Quoc Nam', N'Tran Thi Ha', N'0823438777', CAST(N'2022-10-24T16:15:19.7690000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (33, CAST(N'2022-10-24T16:16:09.6820000' AS DateTime2), N'namnh@gmail.com', N'Nguyen Huu Nam', N'Tran Thi Thu', N'0823438482', CAST(N'2022-10-24T16:16:09.6820000' AS DateTime2))
INSERT [dbo].[student_family] ([id], [create_at], [email1], [father_name], [mother_name], [phone1], [update_at]) VALUES (34, CAST(N'2022-10-24T16:17:11.8050000' AS DateTime2), N'namnc@gmail.com', N'Nguyen Canh Nam', N'Tran Thi Ha ', N'0823438482', CAST(N'2022-10-24T16:17:11.8050000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[student_family] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (3, N'Lịch Sử', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (4, N'Văn', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (5, N'Toán', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (6, N'Địa', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (7, N'Sinh học', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (8, N'Tiếng Anh', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (9, N'Tin học', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (10, N'Công nghệ', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (12, N'Hóa', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (13, N'Vật Lý', 1)
INSERT [dbo].[subject] ([id], [subject_name], [subject_status]) VALUES (14, N'Tất cả', 1)
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_roles] ON 

INSERT [dbo].[tbl_roles] ([id], [name]) VALUES (1, N' ROLE_ADMIN')
INSERT [dbo].[tbl_roles] ([id], [name]) VALUES (2, N' ROLE_USER')
INSERT [dbo].[tbl_roles] ([id], [name]) VALUES (3, N' ROLE_PM')
INSERT [dbo].[tbl_roles] ([id], [name]) VALUES (4, N'USER')
INSERT [dbo].[tbl_roles] ([id], [name]) VALUES (5, N'ADMIN')
SET IDENTITY_INSERT [dbo].[tbl_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (1, N'TP Cần Thơ, Quận Ninh Kiều,Đường Vĩnh Kiết ', CAST(N'2000-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-09-18T10:09:41.2450000' AS DateTime2), N'nhan@gmail.com', 0, N'$2a$10$XzjkmOvyKfz8.Y7mxneiB.5hgKjTUTffG1nwxx2cCflKBg.55I.oa', N'0917265221', 1, N'Nguyễn Hạnh Nhân', CAST(N'2022-10-31T15:41:51.3020000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (2, N'TP Cần Thơ, Quận Ninh Kiều,Đường 30/4 ', CAST(N'2000-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-09-18T10:11:30.3780000' AS DateTime2), N'admin@gmail.com', 0, N'$2a$10$Li61UvWk1.bp/VJdwqFXcOyZm7UFWS5xyt1u3ELLs4tCclWnFceXK', N'082323698', 1, N'Admin', CAST(N'2022-10-11T23:19:37.8060000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (3, N'TP Cần Thơ, Quận Ninh Kiều,Đường CMT8 ', CAST(N'2000-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-10T15:55:38.5320000' AS DateTime2), N'sunq@gmail.com', 1, N'$2a$10$y7fzkMP5/OovUdQBxySfAOUdYRaFvWrqwLIYuC193WY5JiwCJtRy6', N'0917265263', 1, N'Nguyễn Quốc Sử', CAST(N'2022-10-11T14:48:36.8660000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (4, N'Nguyễn Tất thành,TP Cà Mau', CAST(N'1995-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-10T23:52:28.2560000' AS DateTime2), N'nghiatt1@gmail.com', 1, N'$2a$10$ulFzfUjUst9.Fo0FylSa6OalTZtBtqSfxyP/WPKOaZXhEktWcP/Pq', N'0823438127', 1, N'Trần Trung Nghĩa', CAST(N'2022-10-11T14:48:03.6610000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (5, N'Nguyễn Tất thành,TP Cà Mau', CAST(N'1995-02-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T22:50:26.1980000' AS DateTime2), N'toannv@gmail.com', 1, N'$2a$10$QSk1Y/.Ni6QbQdKzcIarQeprq9pHsUVrIdSI4OTMjiDKK8ZyE3iGm', N'917852367', 1, N'Nguyễn Văn Toán', CAST(N'2022-10-11T22:50:26.1980000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (6, N'Nguyễn Tất thành,TP Cà Mau,P1', CAST(N'1990-02-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T22:51:17.2260000' AS DateTime2), N'anhnq@gmail.com', 1, N'$2a$10$qDC8P4yMlVwGl1TfziDAQeVUkVz2z/3.dj513YDxOEFhjc7dpx39C', N'0917568963', 1, N'Nguyễn Quốc Anh', CAST(N'2022-10-11T22:51:17.2260000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (7, N'Nguyễn Tất thành,TP Cà Mau,P2', CAST(N'1996-02-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T22:51:54.0640000' AS DateTime2), N'vannv@gmail.com', 1, N'$2a$10$XRxVZkDEfuKQLcuJZQiVReRlE.Kfh7eW0gV.W.Jwm95xqYeVBjtoq', N'092568635', 1, N'Nguyễn Việt Văn', CAST(N'2022-10-11T22:51:54.0640000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (8, N'Nguyễn Tất thành,TP Cà Mau,P3', CAST(N'1996-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T22:53:17.8590000' AS DateTime2), N'lytc@gmail.com', 1, N'$2a$10$R59dDBJdJYWE//eevl0Mj.wCEKCbYHo5nU2sO0COUXCgv8hSxfp/q', N'092568634', 1, N'Trần Công Lý', CAST(N'2022-10-11T22:53:17.8590000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (9, N'Ca Mau', CAST(N'2000-05-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T23:07:18.4930000' AS DateTime2), N'dantt@gmail.com', 0, N'$2a$10$FCnfFqS4Kr5AELlzsvPOt.AiKh7wHg6k23glOHONVNixC.qsHKYae', N'0823438128', 1, N'Trần Thị Địa Lý ', CAST(N'2022-10-13T11:57:49.2620000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (10, N'TP Cần Thơ, Quận Ninh Kiều,Đường CMT82', CAST(N'2000-02-02T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-11T23:14:55.9880000' AS DateTime2), N'thenq@gmail.com', 1, N'$2a$10$w5kZsn01hJN79nTNRo1sfejn/c3JFZklm1I2w2R3DaQ8NNBpiimZq', N'0917265263', 1, N'Nguyễn Quốc Thể', CAST(N'2022-10-11T23:14:55.9880000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (11, N'Thoi Binh Ca Mau', CAST(N'1995-02-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-13T11:44:47.4270000' AS DateTime2), N'sinhtt@gmail.com', 0, N'$2a$10$Y4jYTepCk3DUGp9j4CpHk.88kPXWNzFCFfgE.fF2WB//N2pA/yR0C', N'0823438144', 1, N'Trần Thi Sinh', CAST(N'2022-10-13T11:44:47.4270000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (12, N'Ca Mau', CAST(N'2000-02-05T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-13T11:54:15.2520000' AS DateTime2), N'tinth@gmail.com', 1, N'$2a$10$WT9FdI.78MxHW77Wz8abbe/ZbMSSMbUMTOtNOObH3oy5Ng66EzTvS', N'0823438187', 1, N'Trần Học Tin', CAST(N'2022-10-13T11:54:15.2520000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (13, N'3thang 2,TP Can Tho', CAST(N'1992-12-04T07:00:00.0000000' AS DateTime2), CAST(N'2022-10-31T15:15:28.2200000' AS DateTime2), N'danttt@gmail.com', 0, N'$2a$10$iuR/g0CW9NaqYAgewYR/cOvDuGDZGUIUY1BroX13JAWeDSu6Wh.Ty', N'0917265284', 1, N'Trần Thị Dân', CAST(N'2022-10-31T15:15:28.2200000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (14, N'Thoi Binh Ca Mau', CAST(N'2000-10-10T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T10:25:46.3030000' AS DateTime2), N'quad@gmail.com', 1, N'$2a$10$iTmxJU.IwoHTFevo4yMxqu3YQCDK2jGFRoikhFc.2OJbR4EcWtDcy', N'0822275564', 1, N'Dương Quá', CAST(N'2022-11-20T10:25:46.3030000' AS DateTime2))
INSERT [dbo].[teacher] ([id], [address], [birth_date], [create_at], [email], [gender], [password], [phone], [status], [teacher_name], [update_at]) VALUES (15, N'Thoi Binh Ca Mau', CAST(N'2000-10-20T07:00:00.0000000' AS DateTime2), CAST(N'2022-11-20T10:44:47.9710000' AS DateTime2), N'nghent@gmail.com', 0, N'$2a$10$kASiDWtSgVKo7IraktYAWu03mB/E9yzQN83Z6O7gQB/cYp3DQTFPi', N'017778811', 1, N'Nguyễn Thị Nghệ', CAST(N'2022-11-20T10:44:47.9710000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[teacher] OFF
GO
INSERT [dbo].[teacher_role] ([teacher_id], [role_id]) VALUES (1, 2)
INSERT [dbo].[teacher_role] ([teacher_id], [role_id]) VALUES (2, 1)
INSERT [dbo].[teacher_role] ([teacher_id], [role_id]) VALUES (2, 2)
GO
/****** Object:  Index [UK_70nxw721fbhmdka60fd034eri]    Script Date: 12/29/2022 12:05:20 PM ******/
ALTER TABLE [dbo].[schedule_evaluate] ADD  CONSTRAINT [UK_70nxw721fbhmdka60fd034eri] UNIQUE NONCLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKayoyo1k5x49tjef7snrwimuwi]    Script Date: 12/29/2022 12:05:20 PM ******/
ALTER TABLE [dbo].[student_family] ADD  CONSTRAINT [UKayoyo1k5x49tjef7snrwimuwi] UNIQUE NONCLUSTERED 
(
	[email1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK3kv6k1e64a9gylvkn3gnghc2q]    Script Date: 12/29/2022 12:05:20 PM ******/
ALTER TABLE [dbo].[teacher] ADD  CONSTRAINT [UK3kv6k1e64a9gylvkn3gnghc2q] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checkvp]  WITH CHECK ADD  CONSTRAINT [FK5a2c4oll7h5u7bwx0khe3o14l] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[checkvp] CHECK CONSTRAINT [FK5a2c4oll7h5u7bwx0khe3o14l]
GO
ALTER TABLE [dbo].[clazz_teacher]  WITH CHECK ADD  CONSTRAINT [FKe3qhyx959u7d3yxetyjno3etv] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[clazz] ([id])
GO
ALTER TABLE [dbo].[clazz_teacher] CHECK CONSTRAINT [FKe3qhyx959u7d3yxetyjno3etv]
GO
ALTER TABLE [dbo].[clazz_teacher]  WITH CHECK ADD  CONSTRAINT [FKm7jorhw3xw1gvkcb3ejg8e4dl] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teacher] ([id])
GO
ALTER TABLE [dbo].[clazz_teacher] CHECK CONSTRAINT [FKm7jorhw3xw1gvkcb3ejg8e4dl]
GO
ALTER TABLE [dbo].[detail_evaluate]  WITH CHECK ADD  CONSTRAINT [FK9tfv3h1i4ow4jcwpk27s353lq] FOREIGN KEY([offence_id])
REFERENCES [dbo].[offence] ([id])
GO
ALTER TABLE [dbo].[detail_evaluate] CHECK CONSTRAINT [FK9tfv3h1i4ow4jcwpk27s353lq]
GO
ALTER TABLE [dbo].[detail_evaluate]  WITH CHECK ADD  CONSTRAINT [FKnm62ln9co4h9gpcie8qqyrcfq] FOREIGN KEY([schedule_evaluate_id])
REFERENCES [dbo].[schedule_evaluate] ([id])
GO
ALTER TABLE [dbo].[detail_evaluate] CHECK CONSTRAINT [FKnm62ln9co4h9gpcie8qqyrcfq]
GO
ALTER TABLE [dbo].[mark]  WITH CHECK ADD  CONSTRAINT [FK31pgvperkvhwr6xfw5wr91vfe] FOREIGN KEY([mark_type_id])
REFERENCES [dbo].[mark_type] ([id])
GO
ALTER TABLE [dbo].[mark] CHECK CONSTRAINT [FK31pgvperkvhwr6xfw5wr91vfe]
GO
ALTER TABLE [dbo].[mark]  WITH CHECK ADD  CONSTRAINT [FKcwocngy0rfmqdhqwm3qlrfamx] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[mark] CHECK CONSTRAINT [FKcwocngy0rfmqdhqwm3qlrfamx]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK69oakeanwehikps300emu9sy4] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK69oakeanwehikps300emu9sy4]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FKjeawhx9lq4rihjcm6q757nn97] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[clazz] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FKjeawhx9lq4rihjcm6q757nn97]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FKokg910pdapfcxts0uggmjkpyv] FOREIGN KEY([date_id])
REFERENCES [dbo].[dates] ([date_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FKokg910pdapfcxts0uggmjkpyv]
GO
ALTER TABLE [dbo].[schedule_evaluate]  WITH CHECK ADD  CONSTRAINT [FKrv5rsw9smejklu8j4cr60f0dq] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[schedule] ([id])
GO
ALTER TABLE [dbo].[schedule_evaluate] CHECK CONSTRAINT [FKrv5rsw9smejklu8j4cr60f0dq]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FKmo5h5a7y79lubrbp0mkpyjgpv] FOREIGN KEY([student_family_id])
REFERENCES [dbo].[student_family] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FKmo5h5a7y79lubrbp0mkpyjgpv]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FKr6vhwx3i4blsfj07c5ttqwj9p] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[clazz] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FKr6vhwx3i4blsfj07c5ttqwj9p]
GO
ALTER TABLE [dbo].[teacher_role]  WITH CHECK ADD  CONSTRAINT [FK8ub02yshgcludq6h1bt4cegum] FOREIGN KEY([role_id])
REFERENCES [dbo].[tbl_roles] ([id])
GO
ALTER TABLE [dbo].[teacher_role] CHECK CONSTRAINT [FK8ub02yshgcludq6h1bt4cegum]
GO
ALTER TABLE [dbo].[teacher_role]  WITH CHECK ADD  CONSTRAINT [FKi0x0v4aq8o25mxtuk66o7axtu] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teacher] ([id])
GO
ALTER TABLE [dbo].[teacher_role] CHECK CONSTRAINT [FKi0x0v4aq8o25mxtuk66o7axtu]
GO
USE [master]
GO
ALTER DATABASE [Student_System_Api] SET  READ_WRITE 
GO
