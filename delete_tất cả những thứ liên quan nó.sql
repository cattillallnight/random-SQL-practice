DELETE FROM dependents
WHERE employee_id IN (
    SELECT employee_id
    FROM employees
    WHERE first_name = 'Karen'
);