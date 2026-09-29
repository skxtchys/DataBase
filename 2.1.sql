CREATE TABLE CUSTOMER (
    CustomerID       INT PRIMARY KEY,
    FirstName        VARCHAR(50) NOT NULL,
    LastName         VARCHAR(50) NOT NULL,
    Email            VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE NOT NULL
);

CREATE TABLE ADDRESS (
    CustomerID  INT NOT NULL,
    AddressID   INT NOT NULL,
    AddressType VARCHAR(10) CHECK (AddressType IN ('Billing','Shipping')),
    Street      VARCHAR(100),
    City        VARCHAR(50),
    State       VARCHAR(50),
    ZipCode     VARCHAR(10),
    PRIMARY KEY (CustomerID, AddressID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE
);

CREATE TABLE VENDOR (
    VendorID     INT PRIMARY KEY,
    VendorName   VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100)
);

CREATE TABLE CATEGORY (
    CategoryID       INT PRIMARY KEY,
    CategoryName     VARCHAR(50) NOT NULL,
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES CATEGORY(CategoryID)
);

CREATE TABLE PRODUCT (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    Description TEXT,
    Price       DECIMAL(10,2) NOT NULL,
    CategoryID  INT,
    VendorID    INT,
    FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID),
    FOREIGN KEY (VendorID)   REFERENCES VENDOR(VendorID)
);

CREATE TABLE INVENTORY (
    ProductID      INT PRIMARY KEY,
    QuantityOnHand INT NOT NULL DEFAULT 0,
    ReorderLevel   INT,
    LastRestocked  DATE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);

CREATE TABLE "ORDER" (
    OrderID           INT PRIMARY KEY,
    CustomerID        INT NOT NULL,
    OrderDate         DATE NOT NULL,
    OrderStatus       VARCHAR(20),
    ShippingAddressID INT,
    BillingAddressID  INT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

CREATE TABLE ORDERITEM (
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL CHECK (Quantity > 0),
    PriceAtOrder DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID)   REFERENCES "ORDER"(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE REVIEW (
    ReviewID   INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID  INT NOT NULL,
    Rating     INT CHECK (Rating BETWEEN 1 AND 5),
    Comment    TEXT,
    ReviewDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (ProductID)  REFERENCES PRODUCT(ProductID)
);