/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    dbo.tblBranchDim.sql
PURPOSE: Create dbo.tblBranchDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/22/2020 9:24:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblBranchDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblBranchDim]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/22/2020 9:24:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBranchDim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[add_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_tblBranchDim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


