-- SET YOUR DATABASE HERE =)
USE database_videos;

CREATE TABLE `ProductTypes` (
  `Type_ID` int(3) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type_ID`)
) ENGINE=InnoDB;

CREATE TABLE `PaymentTypes` (
  `Type_ID` int (3) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Type_ID`)
) ENGINE=InnoDB;

CREATE TABLE `Customers` (
  `Customer_ID` int (15) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(200),
  `Phone` varchar(20),
  `Email` varchar(100),
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB;

CREATE TABLE `Products` (
  `Product_ID` int(15) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Details` text,
  `PurchasePrice` int(6) NOT NULL,
  `SalesPrice` int(6) NOT NULL,
  `ProductType` int(3) NOT NULL,
  `PaymentType` int(3) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  FOREIGN KEY (`ProductType`) REFERENCES ProductTypes(Type_ID),
  FOREIGN KEY (`PaymentType`) REFERENCES PaymentTypes(Type_ID)
) ENGINE=InnoDB;

CREATE TABLE `Orders` (
  `Order_ID` int(15) NOT NULL AUTO_INCREMENT,
  `Product_ID` int(15) NOT NULL,
  `Customer_ID` int(15) NOT NULL,
  `PaymentType` int(3) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  FOREIGN KEY (`PaymentType`) REFERENCES PaymentTypes(Type_ID),
  FOREIGN KEY (`Product_ID`) REFERENCES Products(Product_ID),
  FOREIGN KEY (`Customer_ID`) REFERENCES Customers(Customer_ID)
) ENGINE=InnoDB;

CREATE TABLE `OrderDetails` (
  `Order_ID` int(15) NOT NULL,
  `Product_ID` int(15) NOT NULL,
  `TotalPrice` int(10) NOT NULL,
  `PurchaseDate` Date NOT NULL,
  PRIMARY KEY (`Order_ID`, `Product_ID`),
  FOREIGN KEY (`Order_ID`) REFERENCES Orders(Order_ID),
  FOREIGN KEY (`Product_ID`) REFERENCES Products(Product_ID)
) ENGINE=InnoDB;
