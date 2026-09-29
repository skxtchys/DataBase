CREATE TABLE SHIPMENT (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    ShipDate DATE NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    WareHouseLocation VARCHAR(255) NOT NULL,
    TrackingNumber VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Shipment PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT UQ_TrackingNumber UNIQUE (TrackingNumber)
);

INSERT INTO SHIPMENT (
    OrderID, ProductID, WarehouseID, Quantity, ShipDate,
    ProductName, WarehouseLocation, TrackingNumber
) VALUES
(101, 1, 50, 2, '2026-09-01', 'Ноутбук Lenovo', 'Склад №1, Москва', 'TRK100000001'),

(101, 2, 50, 1, '2026-09-01', 'Беспроводная мышь', 'Склад №1, Москва', 'TRK100000002'),

(102, 1, 51, 5, '2026-09-02', 'Ноутбук Lenovo', 'Склад №2, Санкт-Петербург', 'TRK100000003');
INSERT INTO SHIPMENT (
                      OrderID, ProductID, WarehouseID, Quantity, ShipDate, ProductName, WareHouseLocation, TrackingNumber)
VALUES
(201 , 5, 70, 1, '2026-09-01', 'macbook ', 'Склад №3','trc676767676')
INSERT INTO SHIPMENT (
                      OrderID, ProductID, WarehouseID, Quantity, ShipDate, ProductName, WareHouseLocation, TrackingNumber)
VALUES
(202 , 6, 70, 1, '2026-09-01', 'macbook ', 'Склад №3','trc76767676')
SELECT * FROM SHIPMENT


