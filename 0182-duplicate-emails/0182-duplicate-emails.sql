select 
max(Email) as Email
from Person
group by Email
having count(id) > 1 