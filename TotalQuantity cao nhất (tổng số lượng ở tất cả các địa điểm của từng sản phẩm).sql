--TotalQuantity cao nhất (tổng số lượng ở tất cả các địa điểm của từng sản phẩm)
SELECT TOP 1 
    p.ProductID, 
    p.Name, 
    SUM(pi.Quantity) AS TotalQuantity
FROM Product p
JOIN ProductInventory pi ON p.ProductID = pi.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY SUM(pi.Quantity) DESC;

--Viết truy vấn để hiển thị ProductID, Name, TotalQuantity của sản phẩm 
--có TotalQuantity cao nhất (tổng số lượng ở tất cả các địa điểm của từng sản phẩm).