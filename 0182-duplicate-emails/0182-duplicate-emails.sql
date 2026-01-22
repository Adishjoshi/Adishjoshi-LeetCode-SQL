select 
Email 
from Person
group by email 
having Count(id) >= 2