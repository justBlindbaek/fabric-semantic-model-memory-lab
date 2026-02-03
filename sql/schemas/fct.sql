IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'fct')
    EXEC('CREATE SCHEMA fct');
GO