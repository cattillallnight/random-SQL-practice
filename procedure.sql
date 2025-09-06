create procedure prcgetDepartmentt
@X varchar(50) output,
@In varchar(100)
as
begin
select 
	@X = Department
from Students
where Name = @In;
end