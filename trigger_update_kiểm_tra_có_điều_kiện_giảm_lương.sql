CREATE TRIGGER Salary_Not_Decrease
ON employees
INSTEAD OF UPDATE
AS
BEGIN
    -- Kiểm tra xem có bản ghi nào bị giảm lương không
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.employee_id = d.employee_id
        WHERE i.salary < d.salary
    )
    BEGIN
        PRINT 'Salary update rejected: Cannot decrease salary.';
        RETURN; -- Hủy bỏ không cập nhật gì hết
    END

    -- Nếu không có giảm lương, thì thực hiện update như bình thường
    UPDATE employees
    SET salary = i.salary
    FROM employees e
    JOIN inserted i ON e.employee_id = i.employee_id;
END;
