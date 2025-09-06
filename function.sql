create function F1
(@DepartmentID int)
returns int
as
begin
declare @num int
SELECT @num = count(appointments.PatientID)
from Appointments
join Doctors on Doctors.DoctorID = Appointments.DoctorID
where Doctors.DepartmentID = @DepartmentID
return @num
end
