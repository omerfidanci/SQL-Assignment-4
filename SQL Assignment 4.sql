CREATE DATABASE [Manufacturer]

/****** Object:  Table [dbo].[Comp_Supp]  ******/

CREATE TABLE [dbo].[Comp_Supp](
	[supp_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	CONSTRAINT [PK_Comp_Supp] PRIMARY KEY CLUSTERED 
	(
		[supp_id] ASC,
		[comp_id] ASC
	) 
)


/****** Object:  Table [dbo].[Component]  ******/

CREATE TABLE [dbo].[Component](
	[comp_id] [int] NOT NULL,
	[comp_name] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[quantity_comp] [int] NOT NULL,
	CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
	(
		[comp_id] ASC
	) 
)


/****** Object:  Table [dbo].[Prod_Comp]  ******/

CREATE TABLE [dbo].[Prod_Comp](
	[prod_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
	[quantity_comp] [int] NOT NULL,
	CONSTRAINT [PK_Prod_Comp] PRIMARY KEY CLUSTERED 
	(
		[prod_id] ASC,
		[comp_id] ASC
	) 
)


/****** Object:  Table [dbo].[Product]  ******/

CREATE TABLE [dbo].[Product](
	[prod_id] [int] NOT NULL,
	[prod_name] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
	(
		[prod_id] ASC
	)
)


/****** Object:  Table [dbo].[Supplier]   ******/

CREATE TABLE [dbo].[Supplier](
	[supp_id] [int] NOT NULL,
	[supp_name] [varchar](50) NOT NULL,
	[supp_location] [varchar](50) NOT NULL,
	[supp_country] [varchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
	CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
	(
		[supp_id] ASC
	)
)

ALTER TABLE [dbo].[Comp_Supp]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Supp_Component] FOREIGN KEY([comp_id])
REFERENCES [dbo].[Component] ([comp_id])
GO
ALTER TABLE [dbo].[Comp_Supp] CHECK CONSTRAINT [FK_Comp_Supp_Component]
GO
ALTER TABLE [dbo].[Comp_Supp]  WITH CHECK ADD  CONSTRAINT [FK_Comp_Supp_Supplier] FOREIGN KEY([supp_id])
REFERENCES [dbo].[Supplier] ([supp_id])
GO
ALTER TABLE [dbo].[Comp_Supp] CHECK CONSTRAINT [FK_Comp_Supp_Supplier]
GO
ALTER TABLE [dbo].[Prod_Comp]  WITH CHECK ADD  CONSTRAINT [FK_Prod_Comp_Component] FOREIGN KEY([comp_id])
REFERENCES [dbo].[Component] ([comp_id])
GO
ALTER TABLE [dbo].[Prod_Comp] CHECK CONSTRAINT [FK_Prod_Comp_Component]
GO
ALTER TABLE [dbo].[Prod_Comp]  WITH CHECK ADD  CONSTRAINT [FK_Prod_Comp_Product] FOREIGN KEY([prod_id])
REFERENCES [dbo].[Product] ([prod_id])
GO
ALTER TABLE [dbo].[Prod_Comp] CHECK CONSTRAINT [FK_Prod_Comp_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Supplier] FOREIGN KEY([supp_id])
REFERENCES [dbo].[Supplier] ([supp_id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Supplier]
GO
