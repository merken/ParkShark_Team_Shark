USE [ParkShark]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 15/11/2018 8:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](255) NOT NULL,
	[StreetNumber] [varchar](50) NOT NULL,
	[PostalCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allocations]    Script Date: 15/11/2018 8:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allocations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonMemberId] [int] NOT NULL,
	[LicensePlateId] [int] NOT NULL,
	[ParkingLotId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[Status] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Allocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingTypes]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_BuildingTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divisions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[OriginalName] [varchar](255) NOT NULL,
	[PersonDirectorId] [int] NOT NULL,
	[ParentDivisionId] [int] NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicensePlates]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicensePlates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LicensePlate] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LicensePlates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberShipLevels]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberShipLevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[MaxAllocationTime] [decimal](2, 0) NOT NULL,
	[AllocationPriceReduction] [decimal](2, 0) NULL,
	[MonthlyCost] [decimal](2, 0) NULL,
 CONSTRAINT [PK_MemberShipLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkingLots]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingLots](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DivisionId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[BuildingTypeId] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[ContactPersonId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[PricePerHour] [decimal](2, 0) NOT NULL,
 CONSTRAINT [PK_ParkingLots] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[MobilePhone] [varchar](100) NULL,
	[Phone] [varchar](100) NULL,
	[EmailAdress] [varchar](255) NOT NULL,
	[AdressId] [int] NOT NULL,
	[LicensePlateId] [int] NOT NULL,
	[MembershipId] [int] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostalCodes]    Script Date: 15/11/2018 8:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalCodes](
	[PostalCode] [varchar](50) NOT NULL,
	[Label] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PostalCodes] PRIMARY KEY CLUSTERED 
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_PostalCodes] FOREIGN KEY([PostalCode])
REFERENCES [dbo].[PostalCodes] ([PostalCode])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_PostalCodes]
GO
ALTER TABLE [dbo].[Allocations]  WITH CHECK ADD  CONSTRAINT [FK_Allocations_LicensePlates] FOREIGN KEY([LicensePlateId])
REFERENCES [dbo].[LicensePlates] ([ID])
GO
ALTER TABLE [dbo].[Allocations] CHECK CONSTRAINT [FK_Allocations_LicensePlates]
GO
ALTER TABLE [dbo].[Allocations]  WITH CHECK ADD  CONSTRAINT [FK_Allocations_ParkingLot] FOREIGN KEY([ParkingLotId])
REFERENCES [dbo].[ParkingLots] ([ID])
GO
ALTER TABLE [dbo].[Allocations] CHECK CONSTRAINT [FK_Allocations_ParkingLot]
GO
ALTER TABLE [dbo].[Allocations]  WITH CHECK ADD  CONSTRAINT [FK_Allocations_Persons] FOREIGN KEY([PersonMemberId])
REFERENCES [dbo].[Persons] ([ID])
GO
ALTER TABLE [dbo].[Allocations] CHECK CONSTRAINT [FK_Allocations_Persons]
GO
ALTER TABLE [dbo].[Divisions]  WITH CHECK ADD  CONSTRAINT [FK_Division_ParentDivision] FOREIGN KEY([ParentDivisionId])
REFERENCES [dbo].[Divisions] ([ID])
GO
ALTER TABLE [dbo].[Divisions] CHECK CONSTRAINT [FK_Division_ParentDivision]
GO
ALTER TABLE [dbo].[Divisions]  WITH CHECK ADD  CONSTRAINT [FK_DivisionsDirector_PersonID] FOREIGN KEY([PersonDirectorId])
REFERENCES [dbo].[Persons] ([ID])
GO
ALTER TABLE [dbo].[Divisions] CHECK CONSTRAINT [FK_DivisionsDirector_PersonID]
GO
ALTER TABLE [dbo].[ParkingLots]  WITH CHECK ADD  CONSTRAINT [FK_ParkingLots_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[ParkingLots] CHECK CONSTRAINT [FK_ParkingLots_Addresses]
GO
ALTER TABLE [dbo].[ParkingLots]  WITH CHECK ADD  CONSTRAINT [FK_ParkingLots_BuildingTypes] FOREIGN KEY([BuildingTypeId])
REFERENCES [dbo].[BuildingTypes] ([ID])
GO
ALTER TABLE [dbo].[ParkingLots] CHECK CONSTRAINT [FK_ParkingLots_BuildingTypes]
GO
ALTER TABLE [dbo].[ParkingLots]  WITH CHECK ADD  CONSTRAINT [FK_ParkingLots_Divisions] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([ID])
GO
ALTER TABLE [dbo].[ParkingLots] CHECK CONSTRAINT [FK_ParkingLots_Divisions]
GO
ALTER TABLE [dbo].[ParkingLots]  WITH CHECK ADD  CONSTRAINT [FK_ParkingLots_Persons] FOREIGN KEY([ContactPersonId])
REFERENCES [dbo].[Persons] ([ID])
GO
ALTER TABLE [dbo].[ParkingLots] CHECK CONSTRAINT [FK_ParkingLots_Persons]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Adressess] FOREIGN KEY([AdressId])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Adressess]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_LicensePlate] FOREIGN KEY([LicensePlateId])
REFERENCES [dbo].[LicensePlates] ([ID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_LicensePlate]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_MemberShipLevel] FOREIGN KEY([MembershipId])
REFERENCES [dbo].[MemberShipLevels] ([ID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_MemberShipLevel]
GO
