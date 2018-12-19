-- this script is for database video #3
-- you can replace "database_script" with a different database name

CREATE DATABASE IF NOT EXISTS database_script CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE database_script;


-- creating all the tables we need

CREATE TABLE `ProductTypes` (
  `ProductType_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductType_ID`)
);

CREATE TABLE `Products` (
  `Product_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(200) NOT NULL,
  `Product_Price` int(7) NOT NULL,
  `ProductType_ID` int(11) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  FOREIGN KEY (`ProductType_ID`) REFERENCES ProductTypes(ProductType_ID)
);


CREATE TABLE `Customers` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
);

CREATE TABLE `Orders` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  FOREIGN KEY (`Customer_ID`) REFERENCES Customers(Customer_ID)
);

CREATE TABLE `OrderDetails` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`, `Product_ID`, `Customer_ID`),
  FOREIGN KEY (`Order_ID`) REFERENCES Orders(Order_ID),
  FOREIGN KEY (`Product_ID`) REFERENCES Products(Product_ID),
  FOREIGN KEY (`Customer_ID`) REFERENCES Customers(Customer_ID)
);


-- adding data to our database tables
-- data is exactly the same as used in video #2 regarding normalization

INSERT INTO ProductTypes (Product_Type) VALUES ('GPU');
INSERT INTO ProductTypes (Product_Type) VALUES ('CPU');
INSERT INTO ProductTypes (Product_Type) VALUES ('RAM');

INSERT INTO Customers (Name) VALUES ('Kjell Hansen');
INSERT INTO Customers (Name) VALUES ('Vidar Jensen');

INSERT INTO Orders (Order_ID, Customer_ID) VALUES (1,1);
INSERT INTO Orders (Order_ID, Customer_ID) VALUES (2,2);

INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('1080Ti', 6000, 1);
INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('7700k', 2000, 2);
INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('32GB', 4000, 3);
INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('1070', 4000, 1);
INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('8700k', 4000, 2);
INSERT INTO Products (Product_Name, Product_Price, ProductType_ID) VALUES ('16GB', 2500, 3);

INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (1, 1, 1);
INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (1, 2, 1);
INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (1, 3, 1);
INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (2, 4, 2);
INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (2, 5, 2);
INSERT INTO OrderDetails (Order_ID, Product_ID, Customer_ID) VALUES (2, 6, 2);
