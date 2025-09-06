SELECT 
    rl.RentalLocationID, 
    rl.LocationName, 
    cc.CategoryID, 
    cc.CategoryName, 
    COUNT(c.CarID) AS NumberOfCars
FROM CarCategories cc
CROSS JOIN (
    SELECT * 
    FROM RentalLocations 
    WHERE LocationName IN ('Downtown Office', 'Northside Branch', 'Airport Terminal')
) rl
LEFT JOIN Cars c 
    ON c.CategoryID = cc.CategoryID 
    AND c.CurrentLocationID = rl.RentalLocationID
GROUP BY 
    rl.RentalLocationID, 
    rl.LocationName, 
    cc.CategoryID, 
    cc.CategoryName
ORDER BY 
    rl.LocationName DESC, 
    cc.CategoryName ASC;
