select score, dense_rank() over (order by score desc) as 'rank' #add ' ' single quotes over rank as it is a sql function 
from Scores