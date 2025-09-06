SELECT 
    A.SubcategoryID,
    A.Category,
    A.NumberOfProducts
FROM (
--b1: tinh so luong product theo tung subcategory
    select 
    p.SubcategoryID,
    ps.Category,
    count(distinct productid) as NumberOfProducts
    from Product p
    JOIN ProductSubcategory ps ON p.SubcategoryID = ps.SubcategoryID
    group by p.SubcategoryID, ps.Category
    ) A
    join(
--b2: tinh cao nhat cua tung subcategory
    select 
    Category,
    max(NumberOfProducts) as maxNum
    from  (
 select 
    p.SubcategoryID,
    ps.Category,
    count(distinct productid) as NumberOfProducts
    from Product p
    JOIN ProductSubcategory ps ON p.SubcategoryID = ps.SubcategoryID
    group by p.SubcategoryID, ps.Category
    ) B
    GROUP BY Category
) C ON A.Category = C.Category AND A.NumberOfProducts = C.maxNum
ORDER BY A.Category, A.SubcategoryID;