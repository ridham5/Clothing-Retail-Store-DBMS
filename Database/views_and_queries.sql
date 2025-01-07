-- Create a view to display customer orders
CREATE VIEW CustomerOrdersView AS
SELECT c.Customer_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer_Name,
       c.Email_Address,
       COUNT(s.Transaction_ID) AS Total_Transactions,
       SUM(s.Total_Amount) AS Total_Spent
FROM Customer c
JOIN Sale s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.First_Name, c.Last_Name, c.Email_Address;

-- Create a view for supplier product details
CREATE VIEW SupplierProductView AS
SELECT s.Supplier_ID,
       s.First_Name || ' ' || s.Last_Name AS Supplier_Name,
       p.Product_Category,
       COUNT(p.Product_ID) AS Product_Count,
       SUM(TO_NUMBER(p.Stock_Quantity)) AS Total_Stock
FROM Supplier s
JOIN Product p ON s.Supplier_ID = p.Supplier_ID
GROUP BY s.Supplier_ID, s.First_Name, s.Last_Name, p.Product_Category;

-- Create a view for employee sales performance
CREATE VIEW EmployeeSalesPerformanceView AS
SELECT e.Employee_ID,
       e.FirstName || ' ' || e.LastName AS Employee_Name,
       e.JobRole,
       COUNT(s.Transaction_ID) AS Transactions_Handled,
       SUM(s.Total_Amount) AS Total_Sales_Amount
FROM Employee e
JOIN Sale s ON e.Employee_ID = s.Employee_ID
GROUP BY e.Employee_ID, e.FirstName, e.LastName, e.JobRole;

-- Query to calculate average product price
SELECT Product_ID, AVG(TO_NUMBER(Product_Price)) AS Average_Product_Price
FROM Product
GROUP BY Product_ID;

-- Query to find unsupplied products
SELECT Product_ID, Product_Name
FROM Product
MINUS
SELECT Product_ID, Product_Name
FROM Product
WHERE Supplier_ID IS NOT NULL;

-- Query to find suppliers providing multiple product categories
SELECT s.Supplier_ID,
       s.First_Name || ' ' || s.Last_Name AS Supplier_Name,
       COUNT(DISTINCT p.Product_Category) AS Category_Count
FROM Supplier s
JOIN Product p ON s.Supplier_ID = p.Supplier_ID
GROUP BY s.Supplier_ID, s.First_Name, s.Last_Name
HAVING COUNT(DISTINCT p.Product_Category) > 1;


