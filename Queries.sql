#Update custorder
SET specialInstructions = Null
where orderNo = 9580;

#1 List all of the ingredients that will be expired by May 25, 2021 in #descending order by date.

Select IngredientName, ExpirationDate
From ingredients
Where ExpirationDate < '2021-05-25'
Order by ExpirationDate DESC;

#2 Show how many orders were fulfilled by Becky Wilson with special #instructions.

Select c.orderNo, c.specialInstructions, e.employeeFirst,e.employeeLast
From custorder c, employee e
Where e.employeeNo = 2;

#3 What's the sum of the cost of  bulk ingredients for Get Lit pizza?

Select sum(price), IngredientNo, ItemName
from menu
where ItemName = 'Get Lit';

#4 List the boss’s name along with the name and salary of employees who he or she manages.  MULTIPLE JOIN 

SELECT b.employeeFirst AS BossName, e.employeeFirst, e.salary FROM employee e, employee b
WHERE e.bossNo = b.employeeNo;

#5 What is the average supply order cost for each store location from the highest cost to the lowest?  GROUP BY AGGREGATE MULTIPLE JOIN

SELECT AVG(cost), s.storeNo, s.city FROM supplyorder so, store s
WHERE s.storeNo = so.storeNo
GROUP BY so.storeNo DESC;

#6 How many customers that made orders did not  have rewards accounts? COUNT AND IS NULL
SELECT COUNT(custNo)
FROM customers
WHERE RewardNo IS NULL;

#7 How many employees had first or last names that start with B? LIKE, Count
SELECT COUNT(employeeNo)
FROM employee
WHERE employeeLast
LIKE 'B%' OR employeeFirst LIKE 'B%';

#8 What is the expiration date of the ingredient items that are meat? IN
SELECT expirationDate
FROM ingredients
WHERE IngredientName IN ('Pepperoni', 'Italian Sausage', 'Roasted Chicken');

