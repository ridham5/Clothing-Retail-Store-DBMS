-- Sample data. Run after schema.sql. One INSERT per row so it works on every Oracle version.

-- Address
INSERT INTO Address (Address_ID, Country_Name, Province_Name, City_Name, Street_Address, Postal_Code)
VALUES (1, 'Canada', 'Ontario', 'Toronto', '126 Queen St', 'L3R 6Y6');
INSERT INTO Address (Address_ID, Country_Name, Province_Name, City_Name, Street_Address, Postal_Code)
VALUES (2, 'Canada', 'Ontario', 'Toronto', '344 King St', 'L3R 4K9');
INSERT INTO Address (Address_ID, Country_Name, Province_Name, City_Name, Street_Address, Postal_Code)
VALUES (3, 'Canada', 'Ontario', 'Markham', '51 Tangmere Cres', 'L3R 4J9');

-- Supplier
INSERT INTO Supplier (Supplier_ID, First_Name, Last_Name, Phone_Number, Delivery_Schedule, Address_ID)
VALUES (1, 'John', 'Doe', '4161231111', TO_DATE('2024-10-02', 'YYYY-MM-DD'), 1);
INSERT INTO Supplier (Supplier_ID, First_Name, Last_Name, Phone_Number, Delivery_Schedule, Address_ID)
VALUES (2, 'Jane', 'Smith', '6479084567', TO_DATE('2024-10-05', 'YYYY-MM-DD'), 2);
INSERT INTO Supplier (Supplier_ID, First_Name, Last_Name, Phone_Number, Delivery_Schedule, Address_ID)
VALUES (3, 'Emily', 'Davis', '9052945678', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 3);

-- Product
INSERT INTO Product (Product_ID, Product_Name, Product_Size, Product_Price, Stock_Quantity, Product_Category, Supplier_ID)
VALUES (1, 'T-shirt', 'Medium', 20, 150, 'Top', 1);
INSERT INTO Product (Product_ID, Product_Name, Product_Size, Product_Price, Stock_Quantity, Product_Category, Supplier_ID)
VALUES (2, 'Jeans', '32x30', 40, 100, 'Bottom', 2);
INSERT INTO Product (Product_ID, Product_Name, Product_Size, Product_Price, Stock_Quantity, Product_Category, Supplier_ID)
VALUES (3, 'Jacket', 'Large', 60, 75, 'Top', 3);

-- Customer
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Email_Address, Date_of_Birth, Address_ID)
VALUES (1, 'John', 'Doe', '555-555-1234', 'john.doe@example.com', TO_DATE('1985-05-10', 'YYYY-MM-DD'), 2);

-- Employee (must exist before the sale that references it)
INSERT INTO Employee (Employee_ID, FirstName, LastName, Salary, PhoneNumber, JobRole, EmailAddress)
VALUES (101, 'Alice', 'Johnson', 75000.00, '555-1234', 'Sales Associate', 'alice.johnson@example.com');

-- Sale
INSERT INTO Sale (Transaction_ID, Transaction_Date, Total_Amount, Payment_Method, Customer_ID, Employee_ID)
VALUES (1001, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 250.75, 'Credit Card', 1, 101);

-- Promotion
INSERT INTO Promotion (PromoCod, PromoName, ExpiryDate, PromotionPercent, PromotionAmount)
VALUES (1, 'Fall Discount', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 20.00, 10.00);

COMMIT;
