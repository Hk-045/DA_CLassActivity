create database Salesbd;
drop database Salesbd;

create database Salesdb;
use Salesdb;

create table productlines(
productLine VARCHAR(50) PRIMARY KEY,
textDescription Varchar(400),
htmlDescription mediumtext,
image mediumblob );

drop table products;
create table products(
productCode Varchar(15) Primary key,
productName Varchar(70) not null,
productLine VARCHAR(50),
constraint product_key foreign key(productLine)
references productlines(productLine),
productScale VARCHAR(10) NOT NULL,
productVendor VARCHAR(50) NOT NULL,
productDescription TEXT NOT NULL,
quantityInStock SMALLINT NOT NULL,
buyPrice DECIMAL(10, 2) NOT NULL,
MSRP DECIMAL(10, 2) NOT NULL);

create table employees(
employeeNumber INT PRIMARY KEY,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
officeCode VARCHAR(10),
constraint foreign key(officeCode)
references offices(officeCode),
reportsTo INT,
constraint foreign key(reportsTo)
references employees(employeeNumber),
jobTitle VARCHAR(50) NOT NULL);

create table offices(
officeCode VARCHAR(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL);

create table customers(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT, 
constraint foreign key(salesRepEmployeeNumber)
references employees(employeeNumber),
creditLimit DECIMAL(10, 2));


create table orders(
orderNumber INT PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE,
status VARCHAR(15) NOT NULL,
comments TEXT,
customerNumber INT, 
constraint foreign key(customerNumber)
references customers(customerNumber));

create table orderdetails(
orderNumber INT, 
constraint foreign key(orderNumber)
references orders(orderNumber),
productCode VARCHAR(15),
constraint foreign key(productCode)
references products(productCode),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL,
Primary Key  (orderNumber, productCode));

create table payments(
customerNumber INT, 
constraint foreign key(customerNumber)
references customers(customerNumber),
checkNumber VARCHAR(50) PRIMARY KEY,
paymentDate DATE NOT NULL);
