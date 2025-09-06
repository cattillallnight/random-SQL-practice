-- Tạo một trigger có tên là deleteGenres
CREATE TRIGGER deleteGenres
-- Kích hoạt sau khi có thao tác DELETE trên bảng Genres
ON Genres
AFTER DELETE
AS
BEGIN
    -- Cập nhật các dòng trong bảng Books
    -- Nếu sách nào có GenreID nằm trong danh sách GenreID vừa bị xóa (trong bảng tạm DELETED),
    -- thì cập nhật GenreID của sách đó thành NULL
    UPDATE Books
    SET GenreID = NULL
    WHERE GenreID IN (
        SELECT GenreID FROM DELETED -- DELETED là bảng ảo chứa các dòng đã bị xóa khỏi bảng Genres
    );
END;