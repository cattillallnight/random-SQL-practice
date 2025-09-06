SELECT L.Name
FROM Locations L
JOIN Events E ON L.locationID = E.locationID
GROUP BY L.Name
HAVING COUNT(E.eventID) = (
    SELECT MAX(EventCount)
    FROM (
        SELECT COUNT(eventID) AS EventCount
        FROM Events
        GROUP BY locationID
    ) AS SubQuery
);