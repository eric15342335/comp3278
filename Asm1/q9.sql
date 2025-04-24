SELECT
    r.reservation_ID,
    r.member_ID,
    r.reservation_datetime,
    m.name,
    m.email,
    m.contact_number
FROM Member m
    INNER JOIN Reservation r
        ON r.station_ID = 3 -- required by the question, will change
        AND r.status = 1
        AND r.member_ID = m.member_ID
ORDER BY r.reservation_datetime ASC, r.member_ID ASC;