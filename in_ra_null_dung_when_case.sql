SELECT 
    d.DoctorID,
    d.FullName AS DoctorFullName,
    pr.PrescriptionID,
    pr.Medicine,
    pr.Dosage,
    pr.PrescriptionDate,
    CASE 
        WHEN pa.PatientID IS NOT NULL 
        THEN CONCAT(pa.FirstName, ' ', pa.LastName) 
        ELSE NULL 
    END AS PatientFullName
FROM Doctors d
LEFT JOIN Prescriptions pr 
    ON d.DoctorID = pr.DoctorID 
    AND pr.PrescriptionDate BETWEEN '2020-05-15' AND '2020-09-15'
LEFT JOIN Patients pa 
    ON pr.PatientID = pa.PatientID
ORDER BY 
    d.FullName ASC,
    pr.PrescriptionDate ASC;