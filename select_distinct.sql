SELECT distinct
    Authors.AuthorID, 
    Authors.AuthorName, 
    Authors.Country, 
    Authors.Sex, 
    Authors.YearOfBirth
FROM   Authors 
INNER JOIN Books ON Authors.AuthorID = Books.AuthorID
INNER JOIN BookCopies ON Books.BookID = BookCopies.BookID 
INNER JOIN LoanDetails ON BookCopies.CopyID = LoanDetails.CopyID 
WHERE (Authors.Country = N'United Kingdom' OR
             Authors.Country = N'United States')
ORDER BY Authors.Country, Authors.AuthorName DESC