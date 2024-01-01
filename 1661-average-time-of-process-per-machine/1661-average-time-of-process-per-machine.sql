

SELECT a1.machine_id, round(avg(a2.timestamp-a1.timestamp),3) as processing_time
FROM Activity AS a1
INNER JOIN Activity AS a2
ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id
AND a1.activity_type = 'start' AND a2.activity_type = 'end'
group by a1.machine_id

