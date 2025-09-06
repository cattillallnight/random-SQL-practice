create procedure proc_Staffs
	@StaffID int, 
	@NewPhone varchar(15)
as
begin
	update Staffs
	set Phone =@NewPhone
	where staffID = @StaffID;
end