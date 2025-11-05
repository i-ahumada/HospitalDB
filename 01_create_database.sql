USE master
GO

-- Create DB if it doesn't exist

IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Hospital'
)
CREATE DATABASE [Hospital]
GO
