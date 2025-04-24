SELECT
    CONCAT(sa.name, ': ', COUNT(cs.station_ID)) AS "service_area_name: charging_station_count"
FROM ChargingStation cs
    INNER JOIN (
        SELECT 
            s1.name AS name,
            s1.service_area_ID AS service_area_ID,
            s1.service_area_ID AS child_service_area_ID
        FROM ServiceArea s1
        WHERE s1.parent_area_ID IS NULL
        UNION
        SELECT 
            s1.name AS name,
            s1.service_area_ID AS service_area_ID,
            s2.service_area_ID AS child_service_area_ID
        FROM ServiceArea s1
            LEFT JOIN ServiceArea s2 ON s1.service_area_ID = s2.parent_area_ID
        WHERE s1.parent_area_ID IS NULL
            AND s2.service_area_ID IS NOT NULL
        UNION
        SELECT 
            s1.name AS name,
            s1.service_area_ID AS service_area_ID,
            s3.service_area_ID AS child_service_area_ID
        FROM ServiceArea s1
            LEFT JOIN ServiceArea s2 ON s1.service_area_ID = s2.parent_area_ID
            LEFT JOIN ServiceArea s3 ON s2.service_area_ID = s3.parent_area_ID
        WHERE s1.parent_area_ID IS NULL
            AND s3.service_area_ID IS NOT NULL
    ) sa ON cs.location_ID = sa.child_service_area_ID
GROUP BY sa.service_area_ID, sa.name
HAVING COUNT(cs.station_ID) >= 1
ORDER BY COUNT(cs.station_ID) DESC, sa.service_area_ID ASC;