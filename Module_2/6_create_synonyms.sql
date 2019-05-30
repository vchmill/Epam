CREATE DATABASE [education];
GO

USE [education];
GO

CREATE SCHEMA [V_Pereviazko] AUTHORIZATION [dbo]
GO

CREATE SYNONYM [V_Pereviazko].[SYN_AGENCY_ORDERS] FOR [V_Pereviazko_module_2].[dbo].[AGENCY_ORDERS]
GO

CREATE SYNONYM [V_Pereviazko].[SYN_COMPANY_ID] FOR [V_Pereviazko_module_2].[dbo].[COMPANY_ID]
GO

CREATE SYNONYM [V_Pereviazko].[SYN_CUSTOMER] FOR [V_Pereviazko_module_2].[dbo].[CUSTOMER]
GO

CREATE SYNONYM [V_Pereviazko].[SYN_CUSTOMER_OPERATIONS] FOR [V_Pereviazko_module_2].[dbo].[CUSTOMER_OPERATIONS]
GO

select * from [V_Pereviazko].[SYN_AGENCY_ORDERS]
GO

select * from [V_Pereviazko].[SYN_COMPANY_ID]
GO

select * from [V_Pereviazko].[SYN_CUSTOMER_OPERATIONS]
GO

select * from [V_Pereviazko].[SYN_CUSTOMER]
GO