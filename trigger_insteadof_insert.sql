CREATE TRIGGER insertDoctor
ON Doctors
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @cardiologyID INT;

    -- Lấy DepartmentID của khoa 'Cardiology'
    SELECT @cardiologyID = DepartmentID
    FROM Departments
    WHERE Name = 'Cardiology';

    -- Chèn dữ liệu, thay NULL bằng @cardiologyID
    INSERT INTO Doctors (DoctorID, FirstName, LastName, PhoneNumber, Email, DepartmentID)
    SELECT 
        DoctorID, 
        FirstName, 
        LastName, 
        PhoneNumber, 
        Email, 
        ISNULL(DepartmentID, @cardiologyID)
    FROM INSERTED;
END