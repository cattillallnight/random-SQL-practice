CREATE TRIGGER trgDelayEndSemester
ON Semesters
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE s
    SET s.Code = i.Code,
        s.Year = i.Year,
        s.BeginDate = i.BeginDate,
        s.EndDate = i.EndDate
    FROM Semesters s
    JOIN inserted i ON s.Id = i.Id
    WHERE i.EndDate >= s.EndDate;
END;