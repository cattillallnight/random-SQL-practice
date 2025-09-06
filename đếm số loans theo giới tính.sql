SELECT 
    A.AuthorID,
    A.AuthorName,
    COUNT(CASE WHEN M.Sex = 'Female' THEN 1 END) AS NumberOfLoansByFemaleMembers,
    COUNT(CASE WHEN M.Sex = 'Male' THEN 1 END) AS NumberOfLoansByMaleMembers
FROM Authors A
LEFT JOIN Books B ON A.AuthorID = B.AuthorID
LEFT JOIN BookCopies BC ON B.BookID = BC.BookID
LEFT JOIN LoanDetails LD ON BC.CopyID = LD.CopyID
LEFT JOIN Loans L ON LD.LoanID = L.LoanID
LEFT JOIN Members M ON L.MemberID = M.MemberID
GROUP BY A.AuthorID, A.AuthorName
ORDER BY A.AuthorID;