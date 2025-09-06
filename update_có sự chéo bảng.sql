-- Cập nhật GenreID cho sách "The Castle" dựa trên GenreName là 'Romance'
UPDATE Books
SET GenreID = (
    -- Truy vấn GenreID tương ứng với thể loại Romance trong bảng Genres
    SELECT GenreID FROM Genres WHERE GenreName = 'Romance'
)
-- Chỉ áp dụng với sách có tiêu đề là "The Castle"
WHERE Title = 'The Castle';