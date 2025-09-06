SELECT 
    M.Category,
    M.MenuItemID,
    M.Name,
    O.CustomerID,
    C.FullName,
    SUM(OD.Quantity) AS TotalQuantity
FROM OrderDetails OD
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN MenuItems M ON OD.MenuItemID = M.MenuItemID
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE EXISTS (
    SELECT 1
    FROM MenuItems M2
    JOIN OrderDetails OD2 ON M2.MenuItemID = OD2.MenuItemID
    WHERE M2.Category = M.Category
    GROUP BY M2.MenuItemID
    HAVING SUM(OD2.Quantity) = (
        SELECT MAX(SumQty)
        FROM (
            SELECT M3.MenuItemID, SUM(OD3.Quantity) AS SumQty
            FROM MenuItems M3
            JOIN OrderDetails OD3 ON M3.MenuItemID = OD3.MenuItemID
            WHERE M3.Category = M.Category
            GROUP BY M3.MenuItemID
        ) AS Sub
    )
    AND M2.MenuItemID = M.MenuItemID
)
GROUP BY M.Category, M.MenuItemID, M.Name, O.CustomerID, C.FullName
HAVING SUM(OD.Quantity) = (
    SELECT MAX(SumQty)
    FROM (
        SELECT O2.CustomerID, SUM(OD2.Quantity) AS SumQty
        FROM OrderDetails OD2
        JOIN Orders O2 ON OD2.OrderID = O2.OrderID
        WHERE OD2.MenuItemID = M.MenuItemID
        GROUP BY O2.CustomerID
    ) AS Sub2
)
ORDER BY TotalQuantity, MenuItemID