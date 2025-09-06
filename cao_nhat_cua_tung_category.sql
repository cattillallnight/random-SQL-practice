SELECT 
    l.LocationID,
    l.Name AS LocationName,
    p.ProductID,
    p.Name AS ProductName,
    pi.Quantity
FROM ProductInventory pi
JOIN Product p ON pi.ProductID = p.ProductID
JOIN Location l ON pi.LocationID = l.LocationID
WHERE pi.Quantity = (
    SELECT MAX(Quantity)
    FROM ProductInventory
    WHERE LocationID = pi.LocationID
)
ORDER BY l.Name, p.Name;
