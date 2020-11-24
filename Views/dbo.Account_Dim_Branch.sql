/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    dbo.Account_Dim_Branch
PURPOSE: Create dbo.Account_Dim_Branch
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create a view
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[Account_Dim_Branch]    Script Date: 11/23/2020 5:08:53 PM ******/
DROP VIEW [dbo].[Account_Dim_Branch]
GO

/****** Object:  View [dbo].[Account_Dim_Branch]    Script Date: 11/23/2020 5:08:53 PM ******/
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


