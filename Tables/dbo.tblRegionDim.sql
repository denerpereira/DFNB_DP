/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    dbo.tblRegionDim.sql
PURPOSE: Create dbo.tblRegionDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 11/22/2020 9:29:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRegionDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblRegionDim]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 11/22/2020 9:29:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRegionDim](
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_tblRegionDim] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


