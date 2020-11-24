/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    [dbo].[AVGLoanperBranch]
PURPOSE: Create [dbo].[AVGLoanperBranch]

Q: What is the average loan per branch per year?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create a view
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  View [dbo].[AVGLoanperBranch]    Script Date: 11/23/2020 5:10:40 PM ******/
DROP VIEW [dbo].[AVGLoanperBranch]
GO

/****** Object:  View [dbo].[AVGLoanperBranch]    Script Date: 11/23/2020 5:10:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW	[dbo].[AVGLoanperBranch] AS

SELECT AVG(acct_loan_amt) AS AverageLoan
     , AD.branch_id AS Branch
     , YEAR(acct_as_of_date) AS Year
  FROM dbo.tblAccountDim AS AD
       JOIN
       dbo.tblAccountFact AS AF ON AD.acct_id = AF.acct_id
 GROUP BY AD.branch_id
        , YEAR(acct_as_of_date);
GO


