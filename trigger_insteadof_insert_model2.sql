CREATE TRIGGER insertSubCategory
ON SubCategory
INSTEAD OF INSERT
AS
BEGIN
    DECLARE 
    @CategoryID int, 
    @SubCategoryName nvarchar(100);

    -- Chèn dữ liệu, thay NULL bằng @cardiologyID
    INSERT INTO SubCategory(SubCategoryName, CategoryID)
    SELECT 
        SubCategoryName, 
        CategoryID
    FROM INSERTED;
END