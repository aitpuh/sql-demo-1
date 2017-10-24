SELECT *
FROM SalesLT.Customer;

SELECT *
FROM SalesLT.Address;

SELECT *
FROM SalesLT.CustomerAddress;

-- List of addresses for specific customer
SELECT
  Customer.FirstName,
  Customer.LastName,
  ADDRESS.*
FROM SalesLT.Customer
  INNER JOIN SalesLT.CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
  INNER JOIN SalesLT.Address ON CustomerAddress.AddressID = ADDRESS.AddressID
WHERE Customer.CustomerID = 29503;

-- Report showing customers that have more than one address
SELECT
  Customer.FirstName,
  Customer.LastName,
  COUNT(Address.AddressID) AS [NumAddress]
FROM SalesLT.Customer
  INNER JOIN SalesLT.CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
  INNER JOIN SalesLT.Address ON CustomerAddress.AddressID = Address.AddressID
GROUP BY Customer.CustomerID, Customer.FirstName, Customer.LastName
HAVING count(address.AddressID) > 1;