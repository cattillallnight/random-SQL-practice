CREATE PROCEDURE insertAuthor
    @authorID INT,
    @authorName NVARCHAR(100),
    @country NVARCHAR(100),
    @sex NVARCHAR(10),
    @yearOfBirth INT
AS
BEGIN
    -- Kiểm tra xem AuthorID đã tồn tại chưa
    IF NOT EXISTS (
        SELECT 1 FROM Authors WHERE AuthorID = @authorID
    )
    BEGIN
        INSERT INTO Authors (AuthorID, AuthorName, Country, Sex, YearOfBirth)
        VALUES (
            @authorID,
            @authorName,
            @country,
            @sex,
            @yearOfBirth
        );
    END
    -- ELSE: Không làm gì nếu đã tồn tại
END;