/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:   dbo.TransactFact
PURPOSE: Create dbo.TransactFact table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/27/2020   DENERPEREIRA  1. Create table
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblTransactFact]    Script Date: 11/27/2020 11:39:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTransactFact]') AND type in (N'U'))
DROP TABLE [dbo].[tblTransactFact]
GO

/****** Object:  Table [dbo].[tblTransactFact]    Script Date: 11/27/2020 11:39:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTransactFact](
	[tran_id] [int] IDENTITY(100,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[cur_cust_req_ind] [varchar](1) NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL,
 CONSTRAINT [PK_t_tran_fact] PRIMARY KEY CLUSTERED 
(
	[tran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


