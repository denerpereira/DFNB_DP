/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    [dbo].[v_TotalLoanPerBranch]
PURPOSE: Create a view [dbo].[v_TotalLoanPerBranch]

Q: How much of Loans each branch made last year?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[v_TotalLoanPerBranch]    Script Date: 12/17/2020 6:44:02 PM ******/
DROP VIEW [dbo].[v_TotalLoanPerBranch]
GO

/****** Object:  View [dbo].[v_TotalLoanPerBranch]    Script Date: 12/17/2020 6:44:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_TotalLoanPerBranch]
AS
     SELECT AD.branch_id AS BRANCH
          , BD.branch_desc
          , YEAR(AF.acct_as_of_date) AS 'YEAR'
          , SUM(AD.acct_loan_amt) AS TOTALLOAN
       FROM dbo.tblAccountDim AS AD
            INNER JOIN
            dbo.tblAccountFact AS AF ON AD.acct_id = AF.acct_id
            INNER JOIN
            dbo.tblBranchDim AS BD ON AD.branch_id = BD.branch_id
      GROUP BY AD.branch_id
          , BD.branch_desc
          , YEAR(AF.acct_as_of_date)
          ;
GO


