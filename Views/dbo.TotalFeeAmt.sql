/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    [dbo].[TotalFeeAmt]
PURPOSE: Create a view [dbo].[TotalFeeAmt]

Q: What are the most lucrative transaction?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/


USE [DFNB2]
GO

/****** Object:  View [dbo].[TotalFeeAmt]    Script Date: 12/15/2020 10:44:38 PM ******/
DROP VIEW [dbo].[TotalFeeAmt]
GO

/****** Object:  View [dbo].[TotalFeeAmt]    Script Date: 12/15/2020 10:44:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TotalFeeAmt]
AS
     SELECT BD.branch_code
          , SUM(TF.tran_amt) AS 'Total Transfer Amount'
          , SUM(TF.tran_fee_amt) AS ' Total Fee Amount'
          , SUM(TF.tran_amt) + SUM(TF.tran_fee_amt) AS 'Total Amount Paid'
       FROM [dbo].[tblTransactFact] AS TF
            INNER JOIN
            dbo.tblBranchDim AS BD ON BD.branch_id = TF.branch_id
      GROUP BY BD.branch_code;
GO


