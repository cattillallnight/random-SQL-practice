-- 1. Xóa các dòng liên quan trong bảng AppointmentTests
DELETE FROM AppointmentTests
WHERE TestID IN (
    SELECT TestID 
    FROM Tests
    WHERE Name IN ('MRI Scan', 'X-Ray')
);

-- 2. Xóa các dòng khỏi bảng Tests
DELETE FROM Tests
WHERE Name IN ('MRI Scan', 'X-Ray');