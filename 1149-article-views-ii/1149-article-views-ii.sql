
SELECT 
DISTINCT VIEWER_ID AS ID
FROM VIEWS
GROUP BY VIEW_DATE, VIEWER_ID
HAVING COUNT(DISTINCT ARTICLE_ID) >=  2
ORDER BY ID