SELECT 
  m.MenuItemID,
  m.Name,
  m.Category,
  SUM(CASE WHEN MONTH(o.OrderDate) = 10 AND YEAR(o.OrderDate) = 2024 THEN 1 ELSE 0 END) AS TotalQuantity,
  SUM(CASE WHEN MONTH(o.OrderDate) = 10 AND YEAR(o.OrderDate) = 2024 THEN od.Price ELSE 0 END) AS TotalAmount,
  COUNT(DISTINCT CASE WHEN MONTH(o.OrderDate) = 10 AND YEAR(o.OrderDate) = 2024 THEN o.CustomerID END) AS NumberOfCustomers
FROM MenuItems m
LEFT JOIN OrderDetails od ON od.MenuItemID = m.MenuItemID
LEFT JOIN Orders o ON o.OrderID = od.OrderID
WHERE m.Category = 'Main Course'
GROUP BY m.MenuItemID, m.Name, m.Category
ORDER BY m.MenuItemID;