/*****************************************************************************************************************
CREATOR: Dener Pereira
NAME:    [dbo].[BranchGoals]
PURPOSE: Create a view [dbo].[BranchGoals]

Q: What are the branch goals?

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DENERPEREIRA  1. Create a view 
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[BranchGoals]    Script Date: 12/17/2020 6:43:55 PM ******/
DROP VIEW [dbo].[BranchGoals]
GO

/****** Object:  View [dbo].[BranchGoals]    Script Date: 12/17/2020 6:43:55 PM ******/
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


