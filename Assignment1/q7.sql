SELECT r.reservation_ID, r.member_ID, m.name AS member_name,
    r.station_ID, r.reservation_datetime, r.collect_datetime, m.email
FROM Reservation r
    INNER JOIN Member m ON r.member_ID = m.member_ID
WHERE r.status = 1 -- Active reservation
    AND (strftime('%s', r.collect_datetime) - strftime('%s', r.reservation_datetime)) / 60 <= 15
    -- we let strftime return the difference in seconds as %m will ignore the seconds unit
    -- so we need /60 to convert it to minutes
ORDER BY r.reservation_datetime ASC, r.reservation_ID DESC;