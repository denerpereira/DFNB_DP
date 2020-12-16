/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    [dbo].[TransactPerBranch]
PURPOSE: Create a view [dbo].[TransactPerBranch]

Q: How many transactions we have per branch?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/



USE [DFNB2]
GO

/****** Object:  View [dbo].[TransactPerBranch]    Script Date: 12/15/2020 10:38:04 PM ******/
DROP VIEW [dbo].[TransactPerBranch]
GO

/****** Object:  View [dbo].[TransactPerBranch]    Script Date: 12/15/2020 10:38:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[TransactPerBranch] AS
     SELECT DISTINCT 
            TF.branch_id
          , BD.branch_code
          , BD.branch_desc AS 'Branch Name'
          , COUNT(TF.tran_date) AS 'Number of Transactions'
       FROM [dbo].[tblTransactFact] AS TF
            INNER JOIN
            dbo.tblBranchDim AS BD ON BD.branch_id = TF.branch_id
      GROUP BY TF.branch_id
             , BD.branch_code
             , BD.branch_desc;
GO


