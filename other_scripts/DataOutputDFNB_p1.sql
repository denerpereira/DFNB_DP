USE [DFNB2]
GO
/****** Object:  View [dbo].[Account_Dim_Branch]    Script Date: 11/23/2020 7:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Account_Dim_Branch]
AS
     SELECT DISTINCT 
            ad.[acct_id]
          , ad.[acct_open_date]
          , ad.[acct_close_date]
          , ad.[acct_loan_amt]
          , ad.[prod_id]
          , ad.[branch_id]
          , bd.[branch_code]
          , bd.[branch_desc]
          , bd.[region_id]
          , bd.[area_id]
          FROM [dbo].[tblAccountDim] AS ad
            INNER JOIN
            [dbo].[tblBranchDim]AS bd ON ad.branch_id = bd.branch_id;
GO
/****** Object:  View [dbo].[AccountsClosed]    Script Date: 11/23/2020 7:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountsClosed]
AS
     SELECT COUNT(acct_close_date) AS AccountsClosed
          , branch_id
          , YEAR(AD.acct_close_date) AS Yeardate
       FROM dbo.tblAccountDim AS AD
      WHERE YEAR(AD.acct_close_date) IN
                                       (
                                        2019
                                      , 2018
                                       )
      GROUP BY AD.branch_id
             , YEAR(AD.acct_close_date);
GO
/****** Object:  View [dbo].[AccountsOpen]    Script Date: 11/23/2020 7:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountsOpen]
AS
     SELECT COUNT(AD.acct_open_date) AS AccountsOpen
          , AD.branch_id
          , YEAR(AD.acct_open_date) AS YearOpen
       FROM dbo.tblAccountDim AS AD
      WHERE YEAR(AD.acct_open_date) IN
                                      (
                                       2019
                                     , 2018
                                      )
      GROUP BY AD.branch_id
             , YEAR(AD.acct_open_date);
GO
/****** Object:  View [dbo].[AVGLoanperBranch]    Script Date: 11/23/2020 7:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  View [dbo].[CustomerperBranch]    Script Date: 11/23/2020 7:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerperBranch]
AS
     SELECT cust_id
          , BD.branch_id
          , cust_since_date
          , branch_desc
       FROM dbo.tblCustomerDim AS CD
            INNER JOIN
            dbo.tblBranchDim AS BD ON BD.branch_id = CD.branch_id;
GO
