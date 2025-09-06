CREATE TRIGGER tr_insert_Product_Subcategory
ON Product
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Thực hiện chèn dữ liệu vào bảng Product
    INSERT INTO Product (ProductID, Name, Cost, Price, SubcategoryID, SellStartDate)
    SELECT ProductID, Name, Cost, Price, SubcategoryID, SellStartDate
    FROM inserted;

    -- Hiển thị dữ liệu vừa được chèn (các row trong inserted)
    SELECT 
        i.ProductID,
        i.Name AS ProductName,
        i.SubcategoryID,
        ps.Name AS SubcategoryName,
        ps.Category
    FROM inserted i
    JOIN ProductSubcategory ps ON i.SubcategoryID = ps.SubcategoryID;
END;