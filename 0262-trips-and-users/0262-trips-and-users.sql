SELECT t.request_at as 'Day',
    ROUND(
        (SUM(CASE WHEN t.status LIKE '%cancelled%' THEN 1 ELSE 0 END)) / COUNT(*), 
        2
    ) AS 'Cancellation Rate'
FROM Trips t
LEFT JOIN Users u1 ON t.client_id = u1.users_id
LEFT JOIN Users u2 ON t.driver_id = u2.users_id
WHERE u1.banned = 'No' AND u2.banned = 'No'
AND t.request_at between '2013-10-01' and '2013-10-03'
group by t.request_at
