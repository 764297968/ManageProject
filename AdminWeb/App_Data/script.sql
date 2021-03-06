USE [master]
GO
/****** Object:  Database [SuperDB]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
CREATE DATABASE [SuperDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperDB.mdf', FILENAME = N'F:\项目\ManageProject\AdminWeb\App_Data\SuperDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperDB_log.ldf', FILENAME = N'F:\项目\ManageProject\AdminWeb\App_Data\SuperDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SuperDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SuperDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SuperDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SuperDB] SET  MULTI_USER 
GO
ALTER DATABASE [SuperDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SuperDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SuperDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SuperDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SuperDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Function]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Function](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[FunctionName] [nvarchar](50) NULL,
	[PageURL] [varchar](200) NULL,
	[OrderNo] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FunctionGroup]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FunctionGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[ParentID] [int] NOT NULL,
	[GroupCode] [varchar](50) NULL,
	[OrderNo] [int] NOT NULL,
	[State] [smallint] NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_FunctionGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyRoles]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MyRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyUsers]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.MyUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaim]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](max) NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityUser_Id]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityUser_Id] ON [dbo].[UserClaim]
(
	[IdentityUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityUser_Id]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityUser_Id] ON [dbo].[UserLogin]
(
	[IdentityUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityRole_Id]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityRole_Id] ON [dbo].[UserRole]
(
	[IdentityRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityUser_Id]    Script Date: 2017/7/24 星期一 下午 9:10:33 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityUser_Id] ON [dbo].[UserRole]
(
	[IdentityUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaim_dbo.MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_dbo.UserClaim_dbo.MyUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogin_dbo.MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_dbo.UserLogin_dbo.MyUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.MyRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[MyRoles] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.MyRoles_IdentityRole_Id]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.MyUsers_IdentityUser_Id]
GO
EXEC [SuperDB].sys.sp_addextendedproperty @name=N'ALTER DATABASE SuperDB COLLATE Chinese_PRC_CI_AS ', @value=N'' 
GO
USE [master]
GO
ALTER DATABASE [SuperDB] SET  READ_WRITE 
GO
