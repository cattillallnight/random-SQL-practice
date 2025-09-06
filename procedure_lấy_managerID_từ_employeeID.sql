create procedure Get_ManagerID 
@in int,
@X int output
as
begin
select 
	@x = manager_id
from employees
where employee_id = @In;
end
-- lấy managerID từ employeeID