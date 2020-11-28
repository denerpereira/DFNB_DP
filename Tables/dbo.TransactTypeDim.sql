/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:   dbo.TransactTypeDim
PURPOSE: Create dbo.TransactTypeDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/27/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  Table [dbo].[TransactTypeDim]    Script Date: 11/27/2020 11:36:50 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactTypeDim]') AND type in (N'U'))
DROP TABLE [dbo].[TransactTypeDim]
GO

/****** Object:  Table [dbo].[TransactTypeDim]    Script Date: 11/27/2020 11:36:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TransactTypeDim](
	[tran_type_id] [smallint] NOT NULL,
	[tran_type_code] [varchar](5) NOT NULL,
	[tran_type_desc] [varchar](100) NOT NULL,
	[tran_fee_prct] [decimal](4, 3) NOT NULL
) ON [PRIMARY]
GO


