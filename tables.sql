CREATE TABLE store(
    storeNo INT(250) NOT NULL,
City VARCHAR (50) NOT NULL,
    State VARCHAR (2) NOT NULL,
    Address VARCHAR (100) NOT NULL,
    Phone  INT (10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Zip INT(5) NOT NULL,
PRIMARY KEY(storeNo)
);

CREATE TABLE hours(
    HoursID INT(50) NOT NULL,
    DayOfWeek VARCHAR(12) NOT NULL,
    Open TIME NOT NULL,
    Close TIME NOT NULL,
    StoreNo INT(250),
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

    
    CREATE TABLE Ingredients(
IngredientNo INT (100) NOT NULL,
IngredientName VARCHAR(20) NOT NULL,
Price FLOAT(6,2) NOT NULL,
Quantity INT(20) NOT NULL,
ExpirationDate DATE NOT NULL,
ShipDate DATE NOT NULL,
ItemNo INT(250),
           PRIMARY KEY(IngredientNo),
        FOREIGN KEY (itemNo) REFERENCES Menu(itemNo)
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
