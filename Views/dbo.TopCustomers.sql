/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    dbo.TopCustomers
PURPOSE: Create a view dbo.TopCustomers

Q: What are the top 10 customers?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  View [dbo].[TopCustomers]    Script Date: 12/15/2020 10:32:50 PM ******/
DROP VIEW [dbo].[TopCustomers]
GO

/****** Object:  View [dbo].[TopCustomers]    Script Date: 12/15/2020 10:32:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TopCustomers]
AS
     SELECT TOP 10 CD.cust_first_name + ' ' + CD.cust_last_name AS 'Customer Name'
                 , COUNT(TF.tran_date) AS 'Number of Transactions'
       FROM [dbo].[tblTransactFact] AS TF
            JOIN
            dbo.tblAccountDim AS AD ON TF.acct_id = AD.acct_id
            JOIN
            dbo.tblCustomerDim AS CD ON AD.acct_cust_id = CD.cust_id
            JOIN
            dbo.tblBranchDim AS BD ON AD.branch_id = BD.branch_id
      GROUP BY CD.cust_first_name
             , CD.cust_last_name
      ORDER BY COUNT(TF.tran_date) DESC;
GO


