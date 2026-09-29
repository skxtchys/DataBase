CREATE TABLE CUSTOMERS (
    CustomerID    INT PRIMARY KEY,
    CustomerName  VARCHAR(100),
    CustomerEmail VARCHAR(100)
);

CREATE TABLE ORDERS (
    OrderID     INT PRIMARY KEY,
    CustomerID  INT NOT NULL,
    OrderDate   DATE,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
);

CREATE TABLE PRODUCTS (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price       DECIMAL(10,2)
);

CREATE TABLE WAREHOUSES (
    WarehouseID       INT PRIMARY KEY,
    WarehouseLocation VARCHAR(100),
    WarehouseManager  VARCHAR(100)
);

CREATE TABLE CONSIGNMENTS (
    OrderID        INT NOT NULL,
    ProductID      INT NOT NULL,
    WarehouseID    INT NOT NULL,
    Quantity       INT,
    ShipDate       DATE,
    TrackingNumber VARCHAR(50),
    PRIMARY KEY (OrderID, ProductID, WarehouseID),
    FOREIGN KEY (OrderID)     REFERENCES ORDERS(OrderID),
    FOREIGN KEY (ProductID)   REFERENCES PRODUCTS(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES WAREHOUSES(WarehouseID)
);