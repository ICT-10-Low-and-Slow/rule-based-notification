CREATE TRIGGER trg_Transactions_Insert ON Transactions
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Transactions', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Transactions_Update ON Transactions
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Transactions', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Transactions_Delete ON Transactions
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Transactions', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO




CREATE TRIGGER trg_Partners_Insert ON Partners
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Partners', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Partners_Update ON Partners
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Partners', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Partners_Delete ON Partners
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Partners', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO


CREATE TRIGGER trg_AccountingDocuments_Insert ON AccountingDocuments
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingDocuments', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_AccountingDocuments_Update ON AccountingDocuments
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingDocuments', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_AccountingDocuments_Delete ON AccountingDocuments
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingDocuments', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO

CREATE TRIGGER trg_AccountingEntries_Insert ON AccountingEntries
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingEntries', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_AccountingEntries_Update ON AccountingEntries
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingEntries', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_AccountingEntries_Delete ON AccountingEntries
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'AccountingEntries', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO


CREATE TRIGGER trg_Invoices_Insert ON Invoices
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Invoices', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Invoices_Update ON Invoices
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Invoices', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Invoices_Delete ON Invoices
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Invoices', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO

CREATE TRIGGER trg_Accounts_Insert ON Accounts
AFTER INSERT
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Accounts', 'INSERT', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Accounts_Update ON Accounts
AFTER UPDATE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Accounts', 'UPDATE', Id, (SELECT * FROM INSERTED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM INSERTED
END;
GO

CREATE TRIGGER trg_Accounts_Delete ON Accounts
AFTER DELETE
AS
BEGIN
    INSERT INTO EventQueue (TableName, EventType, RecordID, EventData)
    SELECT 'Accounts', 'DELETE', Id, (SELECT * FROM DELETED FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
    FROM DELETED
END;
GO
