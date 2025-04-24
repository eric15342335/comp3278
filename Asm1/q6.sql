SELECT cs.station_ID, cs.name AS station_name,
    SUM(rt.payment_amount) AS rental_income
FROM ChargingStation cs
    INNER JOIN RentalTransaction rt ON cs.station_ID = rt.station_ID
WHERE rt.end_datetime >= '2024-02-01 00:00:00' AND
    rt.end_datetime < '2024-03-01 00:00:00' AND
    rt.status = 1 -- Completed transaction
GROUP BY cs.station_ID, cs.name
ORDER BY rental_income DESC, cs.station_ID ASC;
