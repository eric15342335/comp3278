SELECT m.member_ID, m.name, COUNT(*) AS rental_count
FROM Member m
INNER JOIN RentalTransaction rt ON rt.member_ID = m.member_ID
WHERE rt.status = 1
GROUP BY m.member_ID, m.name
HAVING rental_count >= 1
ORDER BY rental_count DESC, m.member_ID ASC;