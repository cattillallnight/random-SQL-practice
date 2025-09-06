-- Bước 1: Chèn Category 'Sports' vào bảng Category
INSERT INTO Category (CategoryName)
VALUES ('Sports');

-- Bước 2: Chèn các SubCategory 'Tennis' và 'Football' vào bảng SubCategory
INSERT INTO SubCategory (SubCategoryName, CategoryID)
VALUES 
    ('Tennis', (SELECT CategoryID FROM Category WHERE CategoryName = 'Sports')),
    ('Football', (SELECT CategoryID FROM Category WHERE CategoryName = 'Sports'));