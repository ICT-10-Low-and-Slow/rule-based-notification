
-- Table: Transactions
-- Stores payment and receipt transactions.
CREATE TABLE Transactions (
    Id INT PRIMARY KEY, -- Unique identifier for the transaction
    Type VARCHAR(10),   -- Type of transaction: 'Receive' or 'Pay'
    Amount DECIMAL(18,2), -- Transaction amount
    AccountId INT,      -- Foreign key to Accounts table
    PartnerId INT,      -- Foreign key to Partners table
    Description VARCHAR(255), -- Optional description of the transaction
    CreatedAt DATETIME  -- Date and time the transaction was created
);

-- Table: Partners
-- Represents customers and suppliers.
CREATE TABLE Partners (
    Id INT PRIMARY KEY,     -- Unique identifier for the partner
    Name VARCHAR(100),      -- Name of the partner
    Phone VARCHAR(20),      -- Phone number
    Email VARCHAR(100),     -- Email address
    Balance DECIMAL(18,2),  -- Current balance (negative means debt)
    CreatedAt DATETIME      -- Date and time the partner was registered
);

-- Table: AccountingDocuments
-- Stores main accounting documents.
CREATE TABLE AccountingDocuments (
    Id INT PRIMARY KEY,     -- Unique identifier for the document
    DocNumber VARCHAR(20),  -- Document number (e.g., manual or system-generated)
    Description VARCHAR(255), -- Optional description
    CreatedAt DATETIME      -- Date the document was created
);

-- Table: AccountingEntries
-- Stores the debit and credit lines for accounting documents.
CREATE TABLE AccountingEntries (
    Id INT PRIMARY KEY,         -- Unique identifier for the entry
    DocumentId INT,             -- Foreign key to AccountingDocuments
    AccountId INT,              -- Foreign key to Accounts
    Debit DECIMAL(18,2),        -- Debit amount
    Credit DECIMAL(18,2),       -- Credit amount
    Description VARCHAR(255)    -- Optional description for the entry
);

-- Table: Invoices
-- Stores issued invoices to partners.
CREATE TABLE Invoices (
    Id INT PRIMARY KEY,         -- Unique identifier for the invoice
    PartnerId INT,              -- Foreign key to Partners table
    Amount DECIMAL(18,2),       -- Total invoice amount
    Status VARCHAR(20),         -- Invoice status: 'Paid', 'Unpaid', 'Overdue'
    CreatedAt DATETIME          -- Date the invoice was issued
);

-- Table: Accounts
-- Represents bank or cash accounts used in transactions.
CREATE TABLE Accounts (
    Id INT PRIMARY KEY,         -- Unique identifier for the account
    Name VARCHAR(100),          -- Display name for the account
    BankName VARCHAR(100),      -- Name of the bank
    AccountNumber VARCHAR(50),  -- Bank account number
    IsBlacklisted BIT           -- 1 if flagged as blacklisted for security reasons
);
