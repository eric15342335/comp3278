WITH RECURSIVE AreaHierarchy AS (
    SELECT service_area_ID
    FROM ServiceArea
    WHERE name = 'Central and West'
    UNION ALL -- Don't remove duplicates
    SELECT sa.service_area_ID
    FROM ServiceArea sa
    JOIN AreaHierarchy ah ON sa.parent_area_ID = ah.service_area_ID
)
SELECT 
    cs.station_ID, 
    cs.name AS station_name, 
    COUNT(r.reservation_ID) AS sum_of_completed_reservation
FROM ChargingStation cs
LEFT JOIN Reservation r ON cs.station_ID = r.station_ID AND r.status = 1
JOIN ServiceArea sa ON cs.location_ID = sa.service_area_ID
WHERE cs.location_ID IN (SELECT service_area_ID FROM AreaHierarchy)
GROUP BY cs.station_ID, cs.name
ORDER BY sum_of_completed_reservation DESC, cs.station_ID ASC;
