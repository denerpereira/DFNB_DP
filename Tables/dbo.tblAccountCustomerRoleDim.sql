/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    dbo.tblAccountCustomerRoleDim.sql
PURPOSE: Create dbo.tblAccountCustomerRoleDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblAccountCustomerRoleDim]    Script Date: 11/22/2020 9:21:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccountCustomerRoleDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccountCustomerRoleDim]
GO

/****** Object:  Table [dbo].[tblAccountCustomerRoleDim]    Script Date: 11/22/2020 9:21:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountCustomerRoleDim](
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountCustomerRoleDim] PRIMARY KEY CLUSTERED 
(
	[acct_cust_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


