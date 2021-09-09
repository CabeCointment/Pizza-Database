CREATE TABLE store(
    storeNo INT(250) NOT NULL,
    City VARCHAR (50) NOT NULL,
    State VARCHAR (2) NOT NULL,
    Address VARCHAR (100) NOT NULL,
    Phone INT (10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Zip INT(5) NOT NULL,
    PRIMARY KEY(storeNo)
);

CREATE TABLE hours(
    HoursID INT(50) NOT NULL,
    DayOfWeek VARCHAR(12) NOT NULL,
    'Open' TIME NOT NULL,
    'Close' TIME NOT NULL,
    storeNo INT(250),
    PRIMARY KEY(HoursID),
    FOREIGN KEY (storeNo) REFERENCES store(storeNo)
);

CREATE TABLE supplier(
    supplierNo INT (250) NOT NULL,
    supplierName VARCHAR (100) NOT NULL,
    Phone INT (10) NOT NULL,
    Email VARCHAR (100) NOT NULL,
    Address VARCHAR (100) NOT NULL,
    PRIMARY KEY(SupplierNo)
);

CREATE TABLE rewardcard(
        RewardNo INT(250) NOT NULL,
        Points INT(250) NOT NULL,
        PRIMARY KEY(RewardNo)
);

CREATE TABLE customers(
    CustNo INT(250) NOT NULL,
    CustName VARCHAR(20) NOT NULL,
    PaymentType VARCHAR(20) NOT NULL,
    Phone INT(9) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(100),
    RewardNo INT(250),
    PRIMARY KEY(CustNo),
    FOREIGN KEY (RewardNo) REFERENCES RewardCard(RewardNo)
);

CREATE TABLE employee(
    employeeNo INT(250) NOT NULL,
    employeeLast VARCHAR(100) NOT NULL,
    employeeFirst VARCHAR(100) NOT NULL,
    hireDate DATE NOT NULL,
    phone INT(9) NOT NULL,
    email VARCHAR(100) NOT NULL,
    SSN INT(8) NOT NULL,
    role VARCHAR(20) NOT NULL,
    Salary INT(10) NOT NULL,
    bossNo INT(250),
    storeNo INT(250), 
    PRIMARY KEY(employeeNo),
    FOREIGN KEY (StoreNo) REFERENCES store (StoreNo),
    FOREIGN KEY (bossNo) REFERENCES employee(employeeNo)
    
);

CREATE TABLE menu(
        ItemNo INT(250) NOT NULL,
        ItemName VARCHAR(30) NOT NULL,
        Price FLOAT(6, 2) NOT NULL,
        Size VARCHAR(10),
        ItemType VARCHAR(20),
        IngredientNo INT(100),
        PRIMARY KEY(ItemNo)
);

    
CREATE TABLE ingredients(
    IngredientNo INT (100) NOT NULL,
    IngredientName VARCHAR(20) NOT NULL,
    Price FLOAT(6,2) NOT NULL,
    Quantity INT(20) NOT NULL,
    ExpirationDate DATE NOT NULL,
    ShipDate DATE NOT NULL,
    ItemNo INT(250),
    PRIMARY KEY(IngredientNo),
    FOREIGN KEY (itemNo) REFERENCES menu(itemNo)
);

CREATE TABLE custorder(
    orderNo INT(250) NOT NULL,
    specialInstructions VARCHAR (150),
    orderTime TIME NOT NULL,
    orderDate DATE NOT NULL,
    itemNo INT(250),
    employeeNo INT(250),
    custNo INT(250),
    PRIMARY KEY (OrderNo),
    FOREIGN KEY (itemNo) REFERENCES Menu (itemNo),
    FOREIGN KEY (employeeNo) REFERENCES Employee (employeeNo),
    FOREIGN KEY (custNo) REFERENCES Customers (custNo)
    );

CREATE TABLE supplyorder(
    OrderNo INT(250) NOT NULL,
    dateOrder DATE NOT NULL,
    Cost FLOAT(10,2) NOT NULL,
    StoreNo INT(250),
    SupplierNo INT(250),
    PRIMARY KEY (OrderNo),
    FOREIGN KEY (StoreNo) REFERENCES Store (StoreNo),
    FOREIGN KEY (SupplierNo) REFERENCES Supplier (SupplierNo)
);

CREATE TABLE made(
    BatchNo INT(250) NOT NULL,
    madeDate DATE NOT NULL,
    IngredientNo INT(100),
    SupplierNo INT(250),
    PRIMARY KEY (BatchNo),
    FOREIGN KEY (IngredientNo) REFERENCES Ingredients(IngredientNo),
    FOREIGN KEY (SupplierNo) REFERENCES Supplier(SupplierNo)
);

INSERT INTO rewardcard(RewardNo, Points)
VALUES     
(000123, 150),
(000124, 375),
(000125, 50),
(000126, 827),
(000127, 634),
(000128, 0),
(000129, 242),
(000130,905),
(000131, 718),
(000132, 480);


INSERT INTO customers
    (CustNo, CustName, PaymentType, Phone, Email, Address, RewardNo)
VALUES 
    (1, 'Bob', 'Credit', 4856857354, 'bob@gmail.com', '333 Wood Court', 000123 ),
    (2, 'Carol', 'Cash', 234765555, 'carol@gmail.com', '667 First St', NULL),
    (3, 'Susan', 'Credit', 888663333, 'susan@gmail.com', '777 Love Lane', 000126),
    (4, 'Ralph', 'Cash', 3484339993, 'ralph@gmail.com', '343 Mill Road', 000127),
    (5, 'Jamal', 'Cash', 398754444, 'jamal@gmail.com', '111 First St', 000128),
    (6, 'Shandra', 'Credit', 555772222, 'shandra@gmail.com', '222 Second St', 000132),
    (7, 'Baker', 'Credit', 343990123, 'baker@gmail.com', '333 Third St', 000130),
    (8, 'Sam', ' Cash', 2259456481, 'sam@gmail.com', '777 Love Lane', 000124),
    (9, 'Tommy Lee', 'Cash', 2314224421, 'tommyleerightatya@yaman.net', '111 First St', 000125),
    (10, 'Soulja Boy', 'Cash', 6789998212, 'souljaboy@souljaworld.com', '343 Mill Road', 000129),
    (11, 'Tim', 'Credit', 41526814752, 'tim@aol.com', '667 First St', 000131),   
    (12, 'John', 'Credit', 9981126355, 'john@h.net', '222 Second St', NULL);       




INSERT INTO store
    (StoreNo, City, State, Address, Phone, Email, Zip)
VALUES 
    (1, 'Baton Rouge', 'LA', '1050 Tiger Lane', 2253348004, 'litbr@gmail.com', 70808),
    (2, 'New Orleans', 'LA', '5050 Claiborne Ave', 5043439087, 'litnola@gmail.com', 70118),
    (3, 'Dallas', 'TX', '1000 Main St', 4043905466, 'litdallas@gmail.com', 54678),
    (4, 'New York', 'NY', '3000 Times Square', 444557788, 'litnyc@gmail.com', 65498),
    (5, 'San Diego', 'CA', '500 Broadway St', 756234396, 'litsandiego@gmail.com', 39586);


SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO employee 
    (EmployeeNo, EmployeeLast, EmployeeFirst, HireDate, Phone, Email, SSN, Role, Salary, BossNo, StoreNo)
VALUES
    (1, 'Smith', 'Brad', '2000-08-23', 504383124, 'bigbrad@gmail.com', 345956875, 'cook', 30000,6, 1),
    (2, 'Wilson', 'Becky', '2010-02-03', 456938546, 'beckywilson@gmail.com', 349685745, 'cashier', 27000, 6, 1),
    (3, 'Johnson', 'Frank', '1999-01-15', 405968768, 'frankjohnson@gmail.com', 34596764, 'driver', 35000, 6, 1),
    (4, 'Howard', 'John', '2003-05-30', 343867530, 'johnhoward@gmail.com', 34523123, 'cook', 26000, 6, 1),
    (5, 'Boudreaux', 'Dave', '2011-03-20', 344123323, 'cory@gmail.com', 43874354, 'accounting', 40000, 7, 1),
    (6, 'Bond', 'James', '1992-02-13', 345566444, 'bond@gmail.com', 33344222, 'store manager', 50000, 7, 1),
    (7, 'James', 'Rick', '1985-03-24', 444555444, 'rick@gmail.com', 222331111, 'regional manager', 75000, NULL, 1);
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO hours
    (HoursID, DayOfWeeks, Opens, Closes, StoreNo)
VALUES
    (1, 'Monday', '11:00', '21:00', 1),
    (1, 'Tuesday', '11:00', '21:00', 1),
    (1, 'Wednesday', '11:00', '21:00', 1),
    (1, 'Thursday', '11:00', '21:00', 1),
    (1, 'Friday', '11:00', '22:00', 1),
    (1, 'Saturday', '11:00', '22:00', 1),
    (1, 'Sunday', '11:00', '21:00', 1),
    (2, 'Monday', '11:00', '21:00', 2),
    (2, 'Tuesday', '11:00', '21:00', 2),
    (2, 'Wednesday', '11:00', '21:00', 2),
    (2, 'Thursday', '11:00', '21:00', 2),
    (2, 'Friday', '11:00', '22:00', 2),
    (2, 'Saturday', '11:00', '22:00', 2),
    (2, 'Sunday', '11:00', '21:00', 2),
    (3, 'Monday', '11:00', '21:00', 3),
    (3, 'Tuesday', '11:00', '21:00', 3),
    (3, 'Wednesday', '11:00', '21:00', 3),
    (3, 'Thursday', '11:00', '21:00', 3),
    (3, 'Friday', '11:00', '22:00', 3),
    (3, 'Saturday', '11:00', '22:00', 3),
    (3, 'Sunday', '11:00', '21:00', 3),
    (4, 'Monday', '11:00', '21:00', 4),
    (4, 'Tuesday', '11:00', '21:00', 4),
    (4, 'Wednesday', '11:00', '21:00', 4),
    (4, 'Thursday', '11:00', '21:00', 4),
    (4, 'Friday', '11:00', '22:00', 4),
    (4, 'Saturday', '11:00', '22:00', 4),
    (4, 'Sunday', '11:00', '21:00', 4),
    (5, 'Monday', '11:00', '21:00', 5),
    (5, 'Tuesday', '11:00', '21:00', 5),
    (5, 'Wednesday', '11:00', '21:00', 5),
    (5, 'Thursday', '11:00', '21:00', 5),
    (5, 'Friday', '11:00', '22:00', 5),
    (5, 'Saturday','11:00', '22:00', 5),
    (5, 'Sunday', '11:00', '21:00', 5);

INSERT INTO menu (ItemNo,ItemName, Price, Size, ItemType, IngredientNo)
VALUES
    (1, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 001),
    (2, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 002),
    (3, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 004),
    (4, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 007),
    (5, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 011),
    (6, 'Get Lit', 8.50, 'Regular', 'Signature Pizza', 013),
    (7, 'LA Bbq Chicken', 8.50, 'Regular', 'Signature Pizza', 008),
    (8, 'Easy Caprese', 8.50, 'Regular', 'Signature Pizza', 004),
    (9, 'PESTO POLLO', 8.50, 'Regular', 'Signature Pizza', 009),
    (10, 'Greek', 9.00, 'Regular', 'Crafted Calzones', 013),
    (11, 'Stallion', 9.00, 'Regular', 'Crafted Calzones', 004),
    (12, 'Ultimate Lit', 9.00, 'Regular', 'Crafted Calzones', 002),
    (13, 'Super Veggie', 9.00, 'Regular', 'Crafted Calzones', 012),
    (14, 'Cheese', 6.00, 'Regular', 'Craft Your Own Pizza', 005),
    (15, 'Single Topping', 7.00, 'Regular', 'Craft Your Own Pizza', 004),
    (16, 'Two or More Toppings', 8.50, 'Regular', 'Craft Your Own Pizza', 010),
    (17, 'Caesar', 5.00, 'Regular', 'Salad', 013),
    (18, 'Green Lite', 6.00, 'Regular', 'Salad', 012),
    (19, 'Fountain Drinks', 2.50, 'Large', 'Drinks', 014 ),
    (20, 'Fresh Squeezed Lemonade', 3.50, 'Large', 'Drinks', 015);

INSERT INTO custorder (OrderNo, SpecialInstructions, OrderTime, OrderDate, ItemNo, EmployeeNo, CustNo)
VALUES
    (09576, 'Gluten Free Crust', '7:43', '2021-01-23', 10, 1, 1),
    (09577, 'No Onions Extra Cheese', '01:26', '2021-01-26', 8, 3, 2),
    (09578, 'Gluten Free Crust', '03:45', '2021-02-11', 7, 2, 3),
    (09579, 'No Jalapenos', '12:15', '2021-02-18', 6, 1, 4),
    (09580, NULL, '6:32', '2021-02-26', 2, 2, 5),
    (09581, 'No Mushrooms', '5:02', '2021-03-07', 12, 2, 6),
    (09582, 'No Tomatoes', '7:30', '2021-02-26', 1, 2, 7);




INSERT INTO ingredients (IngredientNo, IngredientName, Price, Quantity, ExpirationDate, ShipDate, ItemNo)
VALUES
    (001, 'Pepperoni', 100.00, 10 , '2021-04-17', '2021-03-24', 1),
    (002, 'Italian Sausage', 115.00, 10 , '2021-03-30', '2021-02-28', 7),
    (003, 'Roasted Chicken', 75.00, 10 , '2021-04-28', '2021-03-24', 4),
    (004, 'Mozzarella', 120.00, 20, '2021-05-25', '2021-03-24', 9),
    (005, 'Parmesan', 100.00, 15 , '2021-10-22', '2021-02-03', 9),
    (006, 'Feta', 75.00, 7, '2021-04-02', '2021-02-28', 5),
    (007, 'LIT Red Sauce', 90.00, 15 , '2021-06-14', '2021-02-03', 1),
    (008, 'Bbq Sauce', 50.00, 5, '2021-09-28', '2021-03-24', 2),
    (009, 'Pesto', 20.00, 1 , '2021-03-04', '2021-02-16', 4),
    (010, 'Habanero Honey', 30.00, 2 , '2022-12-02', '2021-02-16', 11),
    (011, 'Mushrooms', 20.00, 5 , '2021-03-28', '2021-03-02', 7),
    (012, 'Green Peppers', 15.00, 2 , '2021-03-15', '2021-03-02', 13),
    (013, 'Kalamata Olives', 20.00, 1 , '2021-10-11', '2021-02-03', 5),
    (014, 'Coke Syrup', 10.00, 5 , '2022-01-11', '2021-02-03', 14),
    (015, 'Lemons', 10.00, 3 , '2021-04-11', '2021-03-28', 15);


INSERT INTO supplier (SupplierNo, SupplierName, Phone, Email, Address)
VALUES
    (1, 'Texas Food Co', 404524666, 'texasfoodco@gmail.com', '200 Austin St'),
    (2, 'Sysco', 444921674, 'food@sysco.net', '2600 Washington St'),
    (3, 'Red Stick Eats', 225672913, 'redstickeats@gmail.com', '1242 Third Street'),
    (4, 'CaliFood', 756912833, 'califood@gmail.com', '1331 Broad Rd'),
    (5, 'Nawlins Ingredients', 504221321, 'nawlinsingredients@gmail.com', '6040 Clay Rd');



INSERT INTO supplyorder (OrderNo, DateOrder, Cost, StoreNo, SupplierNo)
VALUES
    (000681, '2021-01-28', 500, 1, 3),
    (000682, '2021-01-31', 1000, 2, 5),
    (000683, '2021-02-12', 1324, 5, 4),
    (000684, '2021-02-16', 1421, 3, 1),
    (000685, '2021-02-28', 1110, 4, 2),
    (000686, '2021-02-28', 932, 1, 3),
    (000687, '2021-03-03', 750, 2, 5);




INSERT INTO made (BatchNo, MadeDate, IngredientNo, SupplierNo)
VALUES
        (0047, '2021-01-15', 001, 5),
        (0048, '2021-01-20', 006, 3),
        (0049, '2021-02-21', 008, 2),
        (0050, '2021-02-18', 004, 2),    
        (0051, '2021-03-06', 005, 1),
        (0052, '2021-03-20', 007, 4),
        (0053, '2021-04-04', 001, 5),
        (0054, '2021-04-10', 009, 1);

/* Update custorder */
SET specialInstructions = Null
WHERE orderNo = 9580;

/* 1 List all of the ingredients that will be expired by May 25, 2021 in descending order by date. */

SELECT IngredientName, ExpirationDate
FROM ingredients
WHERE ExpirationDate < '2021-05-25'
ORDER by ExpirationDate DESC;

/* 2 Show how many orders were fulfilled by Becky Wilson with special instructions. */

SELECT c.orderNo, c.specialInstructions, e.employeeFirst,e.employeeLast
FROM custorder c, employee e
WHERE e.employeeNo = 2;

/* 3 What is the sum of the cost of  bulk ingredients for Get Lit pizza? */

SELECT sum(price), IngredientNo, ItemName
FROM menu
WHERE ItemName = 'Get Lit';

/* 4 List the boss’s name along with the name and salary of employees who he or she manages.  MULTIPLE JOIN */

SELECT b.employeeFirst AS BossName, e.employeeFirst, e.salary 
FROM employee e, employee b
WHERE e.bossNo = b.employeeNo;

/* 5 What is the average supply order cost for each store location from the highest cost to the lowest?  GROUP BY AGGREGATE MULTIPLE JOIN */

SELECT AVG(cost), s.storeNo, s.city 
FROM supplyorder so, store s
WHERE s.storeNo = so.storeNo
GROUP BY so.storeNo DESC;

/* 6 How many customers that made orders did not  have rewards accounts? COUNT AND IS NULL */

SELECT COUNT(custNo)
FROM customers
WHERE RewardNo IS NULL;

/* 7 How many employees had first or last names that start with B? LIKE, Count */

SELECT COUNT(employeeNo)
FROM employee
WHERE employeeLast
LIKE 'B%' OR employeeFirst LIKE 'B%';

/* 8 What is the expiration date of the ingredient items that are meat? IN */

SELECT expirationDate
FROM ingredients
WHERE IngredientName IN ('Pepperoni', 'Italian Sausage', 'Roasted Chicken');

