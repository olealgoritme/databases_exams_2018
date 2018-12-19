-- SET YOUR DATABASE HERE =)
USE database_videos;

CREATE TABLE `Products` (
  `Product_ID` int,
  `Name` varchar(100),
  `Details` text,
  `PurchasePrice` int,
  `SalesPrice` int,
  `ProductType` int,
  `PaymentType` int,
  PRIMARY KEY (`Product_ID`),
  KEY `FK` (`ProductType`, `PaymentType`)
);

CREATE TABLE `PaymentTypes` (
  `Type_ID` int,
  `Type` varchar(50),
  PRIMARY KEY (`Type_ID`)
);

CREATE TABLE `Customers` (
  `Customer_ID` int,
  `FirstName` varchar(50),
  `LastName` varchar(50),
  `Address` varchar(200),
  `Phone` varchar(20),
  `Email` varchar(100),
  PRIMARY KEY (`Customer_ID`)
);

CREATE TABLE `ProductTypes` (
  `Type_ID` int,
  `Type` varchar(50),
  PRIMARY KEY (`Type_ID`)
);

CREATE TABLE `OrderDetails` (
  `Order_ID` int,
  `Product_ID` int,
  `TotalPrice` int,
  `PurchaseDate` Date,
  KEY `PK,FK` (`Order_ID`, `Product_ID`)
);

CREATE TABLE `Orders` (
  `Order_ID` int,
  `Product_ID` int,
  `Customer_ID` int,
  `PaymentType` int,
  PRIMARY KEY (`Order_ID`),
  KEY `FK` (`Product_ID`, `Customer_ID`, `PaymentType`)
);
