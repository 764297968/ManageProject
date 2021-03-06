USE [SuperDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017/8/21 13:29:49 ******/
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
/****** Object:  Table [dbo].[Address_City]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_City](
	[CityCode] [char](12) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[ProvinceCode] [char](12) NOT NULL,
 CONSTRAINT [PK_Address_City] PRIMARY KEY CLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address_County]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_County](
	[CountyCode] [char](12) NOT NULL,
	[CityCode] [char](12) NOT NULL,
	[CountyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address_County] PRIMARY KEY CLUSTERED 
(
	[CountyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address_Province]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_Province](
	[ProvinceCode] [char](12) NOT NULL,
	[ProvinceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address_Town]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_Town](
	[TownCode] [char](12) NOT NULL,
	[TownName] [nvarchar](50) NOT NULL,
	[CountyCode] [char](12) NOT NULL,
 CONSTRAINT [PK_Address_Town] PRIMARY KEY CLUSTERED 
(
	[TownCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address_Village]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_Village](
	[VillageCode] [char](12) NOT NULL,
	[VillageName] [nvarchar](50) NOT NULL,
	[TownCode] [char](12) NOT NULL,
 CONSTRAINT [PK_Address_Village] PRIMARY KEY CLUSTERED 
(
	[VillageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressBase]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressBase](
	[Code] [varchar](50) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_AddressBase] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[C__MigrationHistory]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[C__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_C__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Function]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Function](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[FunctionName] [nvarchar](50) NULL,
	[PageURL] [nvarchar](200) NULL,
	[OrderNo] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FunctionGroup]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionGroup](
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[ParentID] [int] NOT NULL,
	[GroupCode] [nvarchar](50) NULL,
	[OrderNo] [int] NOT NULL,
	[State] [smallint] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_FunctionGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MyLogger]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyLogger](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[Event_Type] [int] NULL,
	[TIMESTAMP] [nvarchar](50) NULL,
	[EventCategory] [nvarchar](50) NULL,
	[Event_ID] [int] NULL,
	[ComputerName] [nvarchar](50) NULL,
	[Mac_Address] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[SourceUrl] [nvarchar](100) NULL,
	[Source] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CollectDate] [datetime] NULL,
 CONSTRAINT [PK_MyLogger] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MyRoles]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_MyRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MyUsers]    Script Date: 2017/8/21 13:29:49 ******/
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
 CONSTRAINT [PK_MyUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleFunction]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleFunction](
	[FunctionID] [int] NOT NULL,
	[RoleID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_RoleFunction] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserClaim]    Script Date: 2017/8/21 13:29:49 ******/
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
 CONSTRAINT [PK_UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](max) NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaim_dbo.MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_dbo.UserClaim_dbo.MyUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserClaim_dbo_MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_dbo_UserClaim_dbo_MyUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogin_dbo.MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_dbo.UserLogin_dbo.MyUsers_IdentityUser_Id]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserLogin_dbo_MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_dbo_UserLogin_dbo_MyUsers_IdentityUser_Id]
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
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserRole_dbo_MyRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[MyRoles] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo_UserRole_dbo_MyRoles_IdentityRole_Id]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserRole_dbo_MyUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[MyUsers] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo_UserRole_dbo_MyUsers_IdentityUser_Id]
GO
/****** Object:  StoredProcedure [dbo].[Pr_FunctionGroupGetList]    Script Date: 2017/8/21 13:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>获取菜单
-- =============================================
CREATE PROCEDURE [dbo].[Pr_FunctionGroupGetList]
	 
AS
BEGIN
	 SELECT GroupID Id,GroupName Name,ParentID PId,'true' [open] FROM dbo.FunctionGroup g WHERE g.State=1
	 UNION all
	 SELECT f.FunctionID Id,f.FunctionName Name,f.GroupID PId,'true' [open] FROM dbo.[Function] f
	 INNER JOIN dbo.FunctionGroup g ON g.GroupID = f.GroupID WHERE f.Status=1
END

GO
