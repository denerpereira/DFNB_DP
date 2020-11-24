USE [DFNB2]
GO
/****** Object:  Table [dbo].[tblAccountCustomerDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountCustomerDim](
	[acct_cust_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
	[cust_id] [smallint] NOT NULL,
 CONSTRAINT [PK__tblAccou__B5D18DE2CD39268C] PRIMARY KEY CLUSTERED 
(
	[acct_cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountCustomerRoleDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountCustomerRoleDim](
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountCustomerRoleDim] PRIMARY KEY CLUSTERED 
(
	[acct_cust_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountDim](
	[acct_id] [int] NOT NULL,
	[acct_open_date] [date] NOT NULL,
	[acct_close_date] [date] NOT NULL,
	[acct_loan_amt] [decimal](20, 4) NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_cust_id] [smallint] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblAccountDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountFact](
	[acct_as_of_date] [date] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
	[acct_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddressDim](
	[add_id] [int] NOT NULL,
	[add_type] [varchar](1) NOT NULL,
	[add_lat] [decimal](16, 12) NOT NULL,
	[add_lon] [decimal](16, 12) NOT NULL,
 CONSTRAINT [PK_tblAddressDim] PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAreaDim](
	[area_id] [int] NOT NULL,
 CONSTRAINT [PK_tblAreaDim] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranchDim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[add_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_tblBranchDim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerDim](
	[cust_id] [smallint] NOT NULL,
	[cust_first_name] [varchar](25) NOT NULL,
	[cust_last_name] [varchar](25) NOT NULL,
	[cust_gender] [varchar](1) NULL,
	[cust_birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblCustomerDim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductDim](
	[prod_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblProductDim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 11/23/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegionDim](
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_tblRegionDim] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
