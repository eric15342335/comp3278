SELECT c.coupon_ID, c.discount_value, c.member_ID, m.name, rt.payment_amount
FROM Coupon c
INNER JOIN Member m ON m.member_ID = c.member_ID
INNER JOIN RentalTransaction rt ON rt.coupon_ID = c.coupon_ID
WHERE redemption = 1
ORDER BY rt.payment_amount DESC, c.member_ID ASC;
