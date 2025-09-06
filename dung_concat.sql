SELECT 
    concat(employees.first_name, ', ' ,employees.last_name) as full_name, 
    jobs.job_title, 
    departments.department_name, 
    employees.salary
FROM   departments INNER JOIN
             employees ON departments.department_id = employees.department_id INNER JOIN
             jobs ON employees.job_id = jobs.job_id
WHERE (employees.salary > 7000) AND (jobs.job_id = 16)
order by employees.salary