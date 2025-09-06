UPDATE Events
SET StartTime = DATEADD(HOUR, 2, StartTime)
WHERE eventID IN (
    SELECT eventID
    FROM workFor
    WHERE staffID = 2
);

--Câu này sử dụng DATEADD để cộng thêm 2 giờ vào StartTime 
--của những sự kiện mà nhân viên số 2 tham gia.