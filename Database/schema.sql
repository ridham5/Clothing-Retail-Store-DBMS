CREATE TABLE Address(
    Address_ID NUMBER PRIMARY KEY,
    Country_Name VARCHAR2(50) NOT NULL,
    Province_Name VARCHAR2(50) NOT NULL,
    City_Name VARCHAR2(15) NOT NULL,
    Street_Address VARCHAR2(100) NOT NULL,
    Postal_Code VARCHAR2(100) NOT NULL
);

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Phone_Number VARCHAR2(15) UNIQUE,
    Email_Address VARCHAR2(100) UNIQUE,
    Date_of_Birth DATE,
    Address_ID NUMBER DEFAULT 1,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);

CREATE TABLE Sale (
    Transaction_ID NUMBER PRIMARY KEY,
    Transaction_Date DATE,
    Total_Amount NUMBER(10, 2),
    Payment_Method VARCHAR2(50),
    Customer_ID NUMBER,
    Employee_ID NUMBER,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Supplier (
    Supplier_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Phone_Number VARCHAR2(15) UNIQUE,
    Delivery_Schedule DATE,
    Address_ID NUMBER,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);

CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(50) NOT NULL,
    Product_Size VARCHAR2(25) NOT NULL,
    Product_Price VARCHAR2(5) NOT NULL,
    Stock_Quantity VARCHAR2(15) NOT NULL,
    Product_Category VARCHAR2(15) NOT NULL,
    Supplier_ID NUMBER,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Salary DECIMAL(10, 2),
    PhoneNumber VARCHAR2(15),
    JobRole VARCHAR2(50),
    EmailAddress VARCHAR2(100) UNIQUE
);

CREATE TABLE Promotion (
    PromoCod INT PRIMARY KEY,
    PromoName VARCHAR2(100) NOT NULL,
    ExpiryDate DATE NOT NULL,
    PromotionPercent DECIMAL(5, 2),
    PromotionAmount DECIMAL(10, 2)
);

