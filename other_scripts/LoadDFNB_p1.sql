--Load Table AccountCustomerDim

TRUNCATE TABLE dbo.tblAccountCustomerDim;

INSERT INTO dbo.tblAccountCustomerDim
SELECT DISTINCT 
       s.acct_id
	 , s.acct_cust_role_id
     , s.cust_id
       FROM dbo.stg_p1 AS s
 ORDER BY s.acct_id;

-- Load Table AccountCustomerRoleDim

TRUNCATE TABLE dbo.tblAccountCustomerRoleDim;

INSERT INTO dbo.tblAccountCustomerRoleDim
SELECT DISTINCT 
       s.acct_cust_role_id
  FROM dbo.stg_p1 AS s;

-- Load Table AccountDim

TRUNCATE TABLE dbo.tblAccountDim;

INSERT INTO dbo.tblAccountDim
SELECT DISTINCT 
      s.acct_id 
	  , s.open_date
	  , s.close_date
	  , s.loan_amt
	  , s.prod_id
	  , s.branch_id
      , s.pri_cust_id   
      , s.open_close_code        
  FROM dbo.stg_p1 AS s
  WHERE s.acct_cust_role_id <> 2
  ORDER BY s.acct_id;

--Load Table AccountFact

TRUNCATE TABLE dbo.tblAccountFact;

INSERT INTO dbo.tblAccountFact
SELECT DISTINCT 
		sp.as_of_date
       , sp.cur_bal
	   ,sp.acct_id
            FROM dbo.stg_p1 AS sp
 WHERE sp.acct_cust_role_id <> 2
 ORDER BY sp.acct_id
        , sp.as_of_date;

--Load Table AddressDim

TRUNCATE TABLE dbo.tblAddressDim;

INSERT INTO dbo.tblAddressDim
SELECT s.acct_branch_add_id AS add_id
     , s.acct_branch_add_type AS add_type
     , s.acct_branch_add_lat AS add_lat
     , s.acct_branch_add_lon AS add_lon
  FROM dbo.stg_p1 AS s
UNION
SELECT s.cust_add_id AS add_id
     , s.cust_add_type AS add_type
	 , s.cust_add_lat AS add_lat
     , s.cust_add_lon AS add_lon
  FROM dbo.stg_p1 AS s;

-- Load Table AreaDim

TRUNCATE TABLE dbo.tblAreaDim;

INSERT INTO dbo.tblAreaDim
SELECT DISTINCT 
       sp.acct_area_id AS area_id
  FROM dbo.stg_p1 AS sp;

--Load Table BranchDim

TRUNCATE TABLE dbo.tblBranchDim;

INSERT INTO dbo.tblBranchDim
SELECT DISTINCT 
       s.branch_id
     , s.acct_branch_code AS branch_code
     , s.acct_branch_desc AS branch_desc
     , s.acct_branch_add_id AS add_id
     , s.acct_area_id AS area_id
     , s.acct_region_id AS region_id
  FROM dbo.stg_p1 AS s;

--Loard Table CustomerDim
TRUNCATE TABLE dbo.tblCustomerDim;

INSERT INTO dbo.tblCustomerDim
SELECT DISTINCT 
       sp.cust_id
     , sp.first_name AS cust_first_name
	 , sp.last_name AS cust_last_name
	 , sp.gender AS cust_gender
	 , sp.birth_date AS cust_birth_date
	 , sp.cust_since_date
	 , sp.pri_branch_id AS branch_id
     , sp.cust_rel_id
   FROM dbo.stg_p1 AS sp;

--Load table ProductDim

TRUNCATE TABLE dbo.tblProductDim;

INSERT INTO dbo.tblProductDim
SELECT DISTINCT 
       sp.prod_id
      FROM dbo.stg_p1 AS sp;

-- Load Table RegionDim

TRUNCATE TABLE dbo.tblRegionDim;

INSERT INTO dbo.tblRegionDim
SELECT DISTINCT 
       sp.acct_region_id AS region_id
  FROM dbo.stg_p1 AS sp;