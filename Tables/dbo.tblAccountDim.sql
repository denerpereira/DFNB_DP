/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    dbo.tblAccountDim.sql
PURPOSE: Create dbo.tblAccountDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/22/2020 9:22:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccountDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccountDim]
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/22/2020 9:22:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountDim](
	[acct_id] [int] NOT NULL,
	[acct_open_date] [date] NOT NULL,
	[acct_close_date] [date] NOT NULL,
	[acct_loan_amt] [decimal](20, 4) NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_cust_id] [smallint] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblAccountDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


