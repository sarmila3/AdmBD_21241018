CREATE TABLE `productlines` (
  `productLines` int PRIMARY KEY,
  `textDescription` varchar(255),
  `htmlDescription` varchar(255),
  `image` varchar(255)
);

CREATE TABLE `employees` (
  `employeeNumber` int PRIMARY KEY,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `extation` varchar(255),
  `email` varchar(255),
  `officeCode` varchar(255),
  `reportsTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `products` (
  `productCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productLine` varchar(255),
  `productScale` varchar(255),
  `productVendor` varchar(255),
  `productDescription` varchar(255),
  `quantitylnStock` varchar(255),
  `buyPrice` varchar(255),
  `MSRP` varchar(255)
);

CREATE TABLE `orderdetails` (
  `orderNumber` int PRIMARY KEY,
  `productCode` varchar(255),
  `quantityOrdered` varchar(255),
  `priceEach` varchar(255),
  `orderLineNumber` varchar(255)
);

CREATE TABLE `orders` (
  `orderNumber` int PRIMARY KEY,
  `orderDate` varchar(255),
  `requeredDate` varchar(255),
  `shippedDate` varchar(255),
  `status` varchar(255),
  `comments` varchar(255),
  `customerNumber` varchar(255)
);

CREATE TABLE `customers` (
  `customerNumber` int PRIMARY KEY,
  `customerName` varchar(255),
  `contactLastName` varchar(255),
  `contactFirstName` varchar(255),
  `phone` varchar(255),
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` varchar(255),
  `country` varchar(255),
  `salesRepEmployeeNumber` varchar(255),
  `creditLimit` varchar(255)
);

CREATE TABLE `payments` (
  `customerNumber` int PRIMARY KEY,
  `checkNumber` varchar(255),
  `paymentDate` varchar(255),
  `amount` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` varchar(255),
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postalCode` varchar(255),
  `territory` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderdetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `products` (`productLine`);

ALTER TABLE `orders` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderdetails` (`orderLineNumber`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `customers` ADD FOREIGN KEY (`postalCode`) REFERENCES `payments` (`customerNumber`);

ALTER TABLE `customers` ADD FOREIGN KEY (`customerName`) REFERENCES `employees` (`jobTitle`);

ALTER TABLE `employees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine2`);

ALTER TABLE `employees` ADD FOREIGN KEY (`employeeNumber`) REFERENCES `employees` (`reportsTo`);
