USE Hospital;
GO

-- Data types

CREATE TYPE dni_type FROM [varchar](10);
GO
CREATE TYPE matricula_type FROM [nvarchar](20);
GO
CREATE TYPE imagen_type FROM VARBINARY(MAX);
GO
CREATE TYPE nombre_type FROM NVARCHAR(30)
GO