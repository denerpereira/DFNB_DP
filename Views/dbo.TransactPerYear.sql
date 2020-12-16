/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    dbo.TransactPerYear
PURPOSE: Create a view dbo.TransactPerYear

Q: How many transactions we have in each branch per year?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  View [dbo].[TransactPerYear]    Script Date: 12/15/2020 10:15:11 PM ******/
DROP VIEW [dbo].[TransactPerYear]
GO

/****** Object:  View [dbo].[TransactPerYear]    Script Date: 12/15/2020 10:15:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[TransactPerYear]
AS
     SELECT DISTINCT 
            BD.branch_desc AS 'Branch Name'
          , TTD.tran_type_desc
          , COUNT(TF.tran_date) AS 'Count Transaction'
          , YEAR(TF.tran_date) AS 'Transaction Year'
       FROM [dbo].[tblTransactFact] AS TF
            INNER JOIN
            [dbo].[tblBranchDim] AS BD ON BD.branch_id = TF.branch_id
            INNER JOIN
            [dbo].[TransactTypeDim] AS TTD ON TF.tran_type_id = TTD.tran_type_id
      GROUP BY BD.branch_desc
             , TTD.tran_type_desc
             , YEAR(TF.tran_date);

GO


