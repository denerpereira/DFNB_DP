/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    dbo.CustomerperBranch
PURPOSE: Create dbo.CustomerperBranch

Q: How many customer each branch has, and how much it has increased over the years?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[CustomerperBranch]    Script Date: 11/23/2020 5:11:22 PM ******/
DROP VIEW [dbo].[CustomerperBranch]
GO

/****** Object:  View [dbo].[CustomerperBranch]    Script Date: 11/23/2020 5:11:22 PM ******/
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


