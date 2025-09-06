CREATE TABLE Manufacturers(
    ManufacturerID INT PRIMARY KEY,
    ManufacturerAddress NVARCHAR(100),
    ManufacturerPhone VARCHAR(20),
    ManufacturerFax VARCHAR(20)
);

CREATE TABLE Laptops(
    LaptopSKU VARCHAR(10) PRIMARY KEY,
    LaptopName NVARCHAR(50),
    Price DECIMAL(8,2),
    [Description] NVARCHAR(500),
    ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
);

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerAddress NVARCHAR(100),
    CustomerPhone VARCHAR(20)
);

CREATE TABLE Purchase(
    [Date] DATETIME,
    Quantity INT,
    LaptopSKU VARCHAR(10) FOREIGN KEY REFERENCES Laptops(LaptopSKU),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    PRIMARY KEY (LaptopSKU, CustomerID, [Date])
);

---lưu ý date dù đề không yêu cầu nhưng có nó mới đúng logic, mới có điểm.
---Nên nhìn kĩ đề. Tuy nhiên, không nên làm thừa