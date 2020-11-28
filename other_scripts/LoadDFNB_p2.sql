/*****************************************************************************************************************
CREATOR: Dener Pereira

NAME:    LoadDFNB_p2
PURPOSE: Load tables created for project 2

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/27/2020   DENERPEREIRA  1. Load tables created for project 2
RUNTIME: 
Approx. 1 min
******************************************************************************************************************/

-- Load tblTransactTypeDim

TRUNCATE TABLE [dbo].[TransactTypeDim];

INSERT INTO [dbo].[TransactTypeDim]
SELECT DISTINCT 
	[tran_type_id],
	[tran_type_code],
	[tran_type_desc],
	[tran_fee_prct]
  FROM dbo.stg_p2 AS stg2
 ORDER BY tran_type_id;
 

 -- Load tblTransactionFact
 TRUNCATE TABLE dbo.tblTransactionFact;

INSERT INTO dbo.tblTransactionFact
SELECT DISTINCT 
       sp2.acct_id
     , sp2.branch_id
     , sp2.tran_date
     , sp2.tran_time
     , sp2.tran_type_id
     , sp2.tran_amt
     , sp2.tran_fee_amt
  FROM dbo.stg_p2 AS stg2