SELECT 
    A.RentalYear AS Year,
    A.RentalMonth AS Month,
    A.NumberOfRentals
FROM (
    -- Bước 1: Tính số lượt thuê theo từng tháng trong mỗi năm
    SELECT 
        YEAR(RentalDate) AS RentalYear,
        MONTH(RentalDate) AS RentalMonth,
        COUNT(*) AS NumberOfRentals
    FROM Rentals
    GROUP BY YEAR(RentalDate), MONTH(RentalDate)
) A
JOIN (
    -- Bước 2: Với mỗi năm, tìm số lượt thuê cao nhất (MAX)
    SELECT 
        RentalYear,
        MAX(NumberOfRentals) AS MaxRentals
    FROM (
        -- Subquery này giống bước 1, để chuẩn bị dữ liệu cho MAX
        SELECT 
            YEAR(RentalDate) AS RentalYear,
            MONTH(RentalDate) AS RentalMonth,
            COUNT(*) AS NumberOfRentals
        FROM Rentals
        GROUP BY YEAR(RentalDate), MONTH(RentalDate)
    ) AS Sub
    GROUP BY RentalYear
) B 
-- Bước 3: Lọc ra các tháng có số lượt thuê = MAX trong năm đó
ON A.RentalYear = B.RentalYear AND A.NumberOfRentals = B.MaxRentals

-- Bước 4: Sắp xếp theo yêu cầu
ORDER BY A.RentalYear, A.RentalMonth;
