-- Bước 1: Chèn Category 'Sports' vào bảng Category
DECLARE @CategoryID INT;

INSERT INTO Category (CategoryName)
OUTPUT INSERTED.CategoryID INTO @CategoryID
VALUES ('Sports');

-- Bước 2: Chèn các SubCategory 'Tennis' và 'Football' vào bảng SubCategory
INSERT INTO SubCategory (SubCategoryName, CategoryID)
VALUES ('Tennis', @CategoryID),
       ('Football', @CategoryID);