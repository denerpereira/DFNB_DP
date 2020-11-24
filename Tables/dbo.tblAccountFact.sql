/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    dbo.tblAccountFact.sql
PURPOSE: Create dbo.tblAccountFact table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/22/2020 9:22:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccountFact]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccountFact]
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/22/2020 9:22:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountFact](
	[acct_as_of_date] [date] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
	[acct_id] [int] NOT NULL
) ON [PRIMARY]
GO


