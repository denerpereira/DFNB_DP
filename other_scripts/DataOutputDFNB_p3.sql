  
/*****************************************************************************************************************
NAME:    DataOutputDFNB_p3
PURPOSE: Create the output for all views created on project 03

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/17/2020   DENER PEREIRA  1. Creation of the Script for output
 
RUNTIME: 
Approx. 1 min
NOTES:
Creating of the script to run all views at once.
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  View [dbo].[v_TotalLoanPerBranch]    Script Date: 12/17/2020 6:51:20 PM ******/
DROP VIEW [dbo].[v_TotalLoanPerBranch]
GO

/****** Object:  View [dbo].[v_TotalLoanPerBranch]    Script Date: 12/17/2020 6:51:20 PM ******/
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


USE [DFNB2]
GO

/****** Object:  View [dbo].[BranchGoals]    Script Date: 12/17/2020 6:51:28 PM ******/
DROP VIEW [dbo].[BranchGoals]
GO

/****** Object:  View [dbo].[BranchGoals]    Script Date: 12/17/2020 6:51:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BranchGoals]
AS
     SELECT branch_id
          , branch_desc
          , year
          , loan_amt
          , goal
       FROM dbo.tblBranchGoalsDim;
GO