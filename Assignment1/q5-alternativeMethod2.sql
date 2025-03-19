SELECT 
    cs.station_ID, 
    cs.name AS station_name, 
    COUNT(r.reservation_ID) AS sum_of_completed_reservation
FROM ChargingStation cs
LEFT JOIN Reservation r ON cs.station_ID = r.station_ID AND r.status = 1
JOIN ServiceArea sa ON cs.location_ID = sa.service_area_ID
LEFT JOIN ServiceArea sa2 ON sa.parent_area_ID = sa2.service_area_ID
LEFT JOIN ServiceArea sa3 ON sa2.parent_area_ID = sa3.service_area_ID
WHERE 'Central and West' IN (sa.name, sa2.name, sa3.name)
GROUP BY cs.station_ID, cs.name
ORDER BY sum_of_completed_reservation DESC, cs.station_ID ASC;
