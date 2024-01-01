# Write your MySQL query statement below
select e.name, b.bonus
From Employee as e
Left join Bonus as b
on e.empId = b.empId
where b.bonus < 1000 OR b.bonus is null