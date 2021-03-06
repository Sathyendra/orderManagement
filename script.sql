USE [ORDERPROJECT]
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[FNAME] [varchar](20) NULL,
	[LNAME] [varchar](20) NULL,
	[AddressLine1] [varchar](20) NULL,
	[AddressLine2] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](10) NULL,
	[Zip] [varchar](5) NULL,
	[MobileNo] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERS](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[CID] [int] NULL,
	[Quantity] [int] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](20) NULL,
	[Description] [varchar](20) NULL,
	[UnitPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[UserType] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[CUSTOMERS] ([CID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[PRODUCTS] ([PID])
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCustomer](@FirstName Varchar(20), @LastName Varchar(20), @Address1 Varchar(20), @Address2 Varchar(20), @City Varchar(20), @State Varchar(10), @ZipCode Varchar(5), @Mobile Char(10))
AS
BEGIN
INSERT INTO CUSTOMERS VALUES (@FirstName, @LastName, @Address1, @Address2, @City, @State, @ZipCode, @Mobile)
END
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrder](@PID int, @CID int, @Qty int, @Status Varchar(20))
AS
BEGIN
INSERT INTO ORDERS VALUES(@PID,@CID,@Qty,@Status)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct](@ProductName Varchar(20), @Desc Varchar(20), @UnitPrice varchar(20))
as
begin
INSERT INTO PRODUCTS VALUES(@ProductName, @Desc, @UnitPrice)
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser](@LoginName Varchar(20), @Password Varchar(20), @UserType CHAR(1))
AS
BEGIN
INSERT INTO USERS VALUES (@LoginName, @Password, @UserType)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCustomers]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetAllCustomers]
as
begin
select * from CUSTOMERS
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
as
begin
SELECT * FROM PRODUCTS
end
GO
/****** Object:  StoredProcedure [dbo].[GetUnitPrice]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnitPrice](@PID int)
as
begin
select UnitPrice from Products where PID=@PID
end
GO
/****** Object:  StoredProcedure [dbo].[IsValidUser]    Script Date: 08-11-2016 02:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsValidUser](@LoginName Varchar(20), @Password Varchar(20))
AS
BEGIN
SELECT COUNT(*) FROM USERS WHERE LoginName=@LoginName and Password=@Password
END
GO
