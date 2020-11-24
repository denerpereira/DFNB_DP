/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    dbo.AccountsClosed
PURPOSE: Create dbo.AccountsClosed

Q: Which branch has more accounts closed over the past two years?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/21/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[AccountsClosed]    Script Date: 11/23/2020 5:09:55 PM ******/
DROP VIEW [dbo].[AccountsClosed]
GO

/****** Object:  View [dbo].[AccountsClosed]    Script Date: 11/23/2020 5:09:55 PM ******/
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


