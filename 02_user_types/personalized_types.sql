USE [HospitalInternaciones];
GO

-- Data types

CREATE TYPE [dbo].[Dni] FROM [varchar](10);
GO
CREATE TYPE [dbo].[Matricula] FROM [nvarchar](20);
GO
CREATE TYPE [dbo].[Img] FROM VARBINARY(MAX);
GO
CREATE TYPE [dbo].[Name] FROM NVARCHAR(30)
GO