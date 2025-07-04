

select name as "Customers" from Customers
where Id not in (SELECT customerId 
FROM Orders 
WHERE id IS NOT NULL)
