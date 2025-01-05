-- Drop the OnlineShopdb database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OnlineShopdb')
BEGIN
    DROP DATABASE OnlineShopdb;
END;
GO

-- Create the OnlineShopdb database
CREATE DATABASE OnlineShopdb;
GO

-- Switch to the OnlineShopdb database
USE OnlineShopdb;
GO

-- Drop the [USER] table if it exists
IF OBJECT_ID('dbo.[USER]', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.[USER];
END;

-- Drop the [PRODUCT] table if it exists
IF OBJECT_ID('dbo.[PRODUCT]', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.[PRODUCT];
END;

-- Drop the [PRODUCT_SIZE] table if it exists
IF OBJECT_ID('dbo.[PRODUCT_SIZE]', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.[PRODUCT_SIZE];
END;

-- Drop the [ORDER] table if it exists
IF OBJECT_ID('dbo.[ORDER]', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.[ORDER];
END;

-- Drop the [ORDER_ITEM] table if it exists
IF OBJECT_ID('dbo.[ORDER_ITEM]', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.[ORDER_ITEM];
END;

CREATE TABLE [USER] (
    UserID INT PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    PostalCode NVARCHAR(20)
);
CREATE TABLE [PRODUCT] (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Brand NVARCHAR(100),
    Description NVARCHAR(MAX),
    ImageURL NVARCHAR(MAX)
);
CREATE TABLE [PRODUCT_SIZE] (
    ProductSizeID INT PRIMARY KEY,
    Size INT NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    Quantity INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES [PRODUCT](ProductID)
);
CREATE TABLE [ORDER] (
    OrderID INT PRIMARY KEY,
    OrderDateTime DATETIME NOT NULL,
    TotalPrice DECIMAL(18, 2) NOT NULL,
    OrderStatus NVARCHAR(20) NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [USER](UserID)
);
CREATE TABLE [ORDER_ITEM] (
    OrderItemID INT PRIMARY KEY,
    Quantity INT NOT NULL,
    OrderID INT NOT NULL,
    ProductSizeID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [ORDER](OrderID),
    FOREIGN KEY (ProductSizeID) REFERENCES [PRODUCT_SIZE](ProductSizeID)
);

