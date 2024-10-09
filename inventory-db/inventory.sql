CREATE TABLE productlines (
  productLine VARCHAR(50) PRIMARY KEY,
  textDescription VARCHAR(4000) DEFAULT NULL,
  htmlDescription TEXT,
  image BYTEA
);

CREATE TABLE products (
  productCode VARCHAR(15) PRIMARY KEY,
  productName VARCHAR(70) NOT NULL,
  productLine VARCHAR(50) NOT NULL REFERENCES productlines (productLine),
  productScale VARCHAR(10) NOT NULL,
  productVendor VARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  buyPrice DECIMAL(10,2) NOT NULL,
  MSRP DECIMAL(10,2) NOT NULL
);

CREATE TABLE offices (
  officeCode VARCHAR(10) PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) DEFAULT NULL,
  state VARCHAR(50) DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  postalCode VARCHAR(15) NOT NULL,
  territory VARCHAR(10) NOT NULL
);

CREATE TABLE employees (
  employeeNumber SERIAL PRIMARY KEY,
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  officeCode VARCHAR(10) NOT NULL REFERENCES offices (officeCode),
  reportsTo INT DEFAULT NULL REFERENCES employees (employeeNumber),
  jobTitle VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
  customerNumber SERIAL PRIMARY KEY,
  customerName VARCHAR(50) NOT NULL,
  contactLastName VARCHAR(50) NOT NULL,
  contactFirstName VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) DEFAULT NULL,
  postalCode VARCHAR(15) DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INT DEFAULT NULL REFERENCES employees (employeeNumber),
  creditLimit DECIMAL(10,2) DEFAULT NULL
);

CREATE TABLE payments (
  customerNumber INT NOT NULL REFERENCES customers (customerNumber),
  checkNumber VARCHAR(50) NOT NULL,
  paymentDate DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (customerNumber, checkNumber)
);

CREATE TABLE orders (
  orderNumber SERIAL PRIMARY KEY,
  orderDate DATE NOT NULL,
  requiredDate DATE NOT NULL,
  shippedDate DATE DEFAULT NULL,
  status VARCHAR(15) NOT NULL,
  comments TEXT,
  customerNumber INT NOT NULL REFERENCES customers (customerNumber)
);

CREATE TABLE orderdetails (
  orderNumber INT NOT NULL REFERENCES orders (orderNumber),
  productCode VARCHAR(15) NOT NULL REFERENCES products (productCode),
  quantityOrdered INT NOT NULL,
  priceEach DECIMAL(10,2) NOT NULL,
  orderLineNumber SMALLINT NOT NULL,
  PRIMARY KEY (orderNumber, productCode)
);

