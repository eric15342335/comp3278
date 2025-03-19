SELECT cs.station_ID, cs.name, cs.available_pbs, sa.name AS ServiceArea
FROM ChargingStation cs
INNER JOIN ServiceArea sa ON cs.location_ID = sa.service_area_ID
ORDER BY cs.available_pbs DESC, cs.station_ID ASC;