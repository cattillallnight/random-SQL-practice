SELECT TOP (5) first_name, last_name
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
)
ORDER BY first_name;

--Những người là manager của người khác 
-- tức là employee_id của họ xuất hiện trong cột manager_id của bảng employees.

