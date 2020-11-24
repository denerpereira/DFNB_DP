--Q1: By Order Quantity, what were the five most popular products sold in 2014?

SELECT TOP 5 YEAR(soh.OrderDate) AS Orderdateyear
           , p.ProductID
           , p.Name AS ProductName
           , p.ProductNumber
           , p.Color
           , COUNT(sod.SalesOrderID) AS SalesOrderID
           , SUM(sod.OrderQty) AS OrderQuantity
           , SUM(sod.LineTotal) AS LineTotal
  FROM((Production.Product AS p
        INNER JOIN
        Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID)
        INNER JOIN
        Sales.SalesOrderHeader AS soh ON soh.SalesOrderID = sod.SalesOrderID)
 WHERE soh.OrderDate = '2014'
 GROUP BY YEAR(soh.OrderDate)
        , p.ProductID
        , p.Name
        , p.ProductNumber
        , p.Color
 ORDER BY 7 DESC;


 -- Q2: How long are the 7 longest Person names and to whom do they belong? 
 --Rank by Full Name length, Last Name Length, First Name Length

SELECT p.BusinessEntityID
     , CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS FullName
     , LEN(CONCAT(p.FirstName, p.MiddleName, p.LastName)) AS FullNamLength
     , p.FirstName
     , LEN(p.FirstName) AS FirstNamLength
     , p.MiddleName
     , p.LastName
     , LEN(p.LastName) AS lastNamLengt
  FROM Person.Person AS p
 ORDER BY FullNamLength DESC;


  -- Q3: Which Department pays its female workers on average the most per year?

SELECT d.DepartmentID
     , d.Name AS DepartmentName
	 , e.Gender
     , e.BusinessEntityID
     , e.SalariedFlag
     , eph.rate
     , eph.payfrequency
     , ed.businessentityID
  FROM HumanResources.Department AS d
       JOIN
       HumanResources.EmployeeDepartmentHistory AS ed ON d.DepartmentID = ed.DepartmentID
       JOIN
       HumanResources.EmployeePayHistory AS eph ON ed.BusinessEntityID = eph.BusinessEntityID
       JOIN
       HumanResources.Employee AS e ON ed.BusinessEntityID = e.BusinessEntityID
 WHERE NOT e.Gender = 'M'
 ORDER BY eph.Rate DESC 