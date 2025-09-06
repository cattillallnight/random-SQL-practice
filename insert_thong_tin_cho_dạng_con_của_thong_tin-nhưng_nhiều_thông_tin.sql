
-- Bước 1: Chèn Category 'Sports' vào bảng Category
INSERT INTO CarCategories(CategoryName, RentalPricePerDay)
VALUES ('Sports', 100.3);

-- Bước 2: Chèn các SubCategory 'Tennis' và 'Football' vào bảng SubCategory
INSERT INTO Cars(Maker, Model, Year, LicensePlate, CurrentLocationID, Status, CategoryID)
VALUES 
    (
    'Chevrolet', 'Corvette Stingray', '2024', '555-72HU', null, 'available', 
    (SELECT CategoryID FROM CarCategories WHERE CategoryName = 'Sports')
    )

--Bạn không cần nhập trực tiếp CategoryID (vì nó tự sinh khi bạn thêm category).
--Nhưng bạn phải khai báo cột CategoryID trong phần INSERT INTO để biết chiếc xe này thuộc loại nào.