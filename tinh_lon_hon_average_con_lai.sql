SELECT 
    e.EmployeeID,
    e.FullName,
    e.Role,
    COUNT(o.OrderID) AS OrderCount
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FullName, e.Role
HAVING COUNT(o.OrderID) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY EmployeeID
    ) AS AvgTable
)
ORDER BY OrderCount DESC, e.FullName ASC;
