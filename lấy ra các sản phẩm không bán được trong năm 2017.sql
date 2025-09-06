SELECT 
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS sum_of_quantity_in_stocks
FROM 
    products p
JOIN 
    stocks s ON p.product_id = s.product_id
WHERE 
    p.product_id NOT IN (
        SELECT DISTINCT oi.product_id
        FROM order_items oi
        JOIN orders o ON oi.order_id = o.order_id
        WHERE YEAR(o.order_date) = 2017
    )
GROUP BY 
    p.product_id, p.product_name;