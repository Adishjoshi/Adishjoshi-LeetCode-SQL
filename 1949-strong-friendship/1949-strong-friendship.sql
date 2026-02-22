WITH cte AS (
    SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship
    UNION ALL
    SELECT user2_id AS user_id, user1_id AS friend_id FROM Friendship
)
SELECT 
    f.user1_id,
    f.user2_id,
    COUNT(*) AS common_friend
FROM Friendship f
JOIN cte a ON f.user1_id = a.user_id
JOIN cte b ON f.user2_id = b.user_id
    AND a.friend_id = b.friend_id
GROUP BY f.user1_id, f.user2_id
HAVING COUNT(*) >= 3
