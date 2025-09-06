SELECT 
    departments.department_id, 
    departments.department_name, 
    max(employees.salary) AS [MAX(salary)]
FROM   departments 
INNER JOIN employees ON departments.department_id = employees.department_id 
group by 
    departments.department_id, 
    departments.department_name
order by max(employees.salary) desc