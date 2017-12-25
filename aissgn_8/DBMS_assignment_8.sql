/*1*/SELECT COUNT(ntEmpID) AS NumberOfEmployees, MIN(moSalary) AS MinimumSalary,
		 COUNT(DISTINCT(ntLevel)) AS TotalntLevels FROM [tblEmp].[dbo].[tblEmp];
/*2*/SELECT E.[ntEmpID], E.[vcName],E.[vcMobieNumer] FROM [tblEmp].[dbo].[tblEmp] E;
/*3*/SELECT E.[vcName], E.[vcMobieNumer], E.[ntLevel] FROM [tblEmp].[dbo].tblEmp E WHERE 
		(E.[vcMobieNumer] is NULL and E.[ntLevel] = 1) OR (E.[ntLevel] = 0); 
/*4*/SELECT * FROM [tblEmp].[dbo].tblEmp
		Order by case
			 WHEN vcSkills LIKE '%JavaScript%' THEN 1
		Else 2
		End,
		ntEmpID ;
/*5a*/SELECT TOP(1) * FROM [tblEmp].[dbo].tblEmp;
/*5b*/SELECT TOP(SELECT 3/2) * FROM [tblEmp].[dbo].tblEmp;
/*5c*/SELECT TOP(1) PERCENT * FROM [tblEmp].[dbo].tblEmp;
/*5d*/SELECT TOP(1) WITH TIES * FROM [tblEmp].[dbo].tblEmp ORDER BY ntLevel desc,vcName;
/*6a*/SELECT E.[vcName],count(E.[vcMobieNumer]) as PhoneNo FROM
		[tblEmp].[dbo].[tblEmp] E GROUP BY E.[vcName];
/*6a*/SELECT E.[vcName],E.[vcMobieNumer] FROM [tblEmp].[dbo].[tblEmp] E 
		WHERE E.[vcMobieNumer] IS NOT NULL  GROUP BY E.[vcName],E.[vcMobieNumer] ;
/*7*/SELECT E.[ntLevel],E.[vcName] FROM [tblEmp].[dbo].tblEmp E 
		WHERE E.[moSalary] >(SELECT AVG(E.[moSalary]) FROM
		[tblEmp].[dbo].tblEmp E);
--------------------------AdventureWorks DB--------------------------------
/*8*/SELECT COUNT(Suffix) FROM [AdventureWorks2012].[Person].[Person] WHERE
		Suffix IS NOT NULL;
/*9a*/SELECT concat(FirstName,' ',MiddleName,' ',LastName) AS FullName FROM
		[AdventureWorks2012].[Person].[Person] p
		JOIN
		[AdventureWorks2012].[Person].[BusinessEntityAddress] bea ON
		p.BusinessEntityID = bea.BusinessEntityID
		JOIN
		[AdventureWorks2012].[Person].[Address] a ON
		bea.AddressID = a.AddressID
		JOIN
		[AdventureWorks2012].[Person].[StateProvince] sp ON
		a.StateProvinceID = sp.StateProvinceID
		 AND sp.Name = 'Florida';
/*9b*/SELECT isnull(FirstName,'')+' '+isnull(MiddleName,'')+
		' '+isnull(LastName,'') AS FullName FROM
		[AdventureWorks2012].[Person].[Person] p 
		JOIN
		[AdventureWorks2012].[Person].[BusinessEntityAddress] bea ON
		p.BusinessEntityID = bea.BusinessEntityID
		JOIN
		[AdventureWorks2012].[Person].[Address] a ON
		bea.AddressID = a.AddressID
		JOIN
		[AdventureWorks2012].[Person].[StateProvince] sp ON
		a.StateProvinceID = sp.StateProvinceID
		AND sp.Name = 'Florida';
/*9c*/SELECT ltrim (coalesce(' ' + FirstName, '') +
		coalesce(' ' + MiddleName, '') + coalesce(' ' + LastName,''))
		AS FullName FROM [AdventureWorks2012].[Person].[Person] p 
		JOIN
		[AdventureWorks2012].[Person].[BusinessEntityAddress] bea ON
		p.BusinessEntityID = bea.BusinessEntityID
		JOIN
		[AdventureWorks2012].[Person].[Address] a ON
		bea.AddressID = a.AddressID
		JOIN
		[AdventureWorks2012].[Person].[StateProvince] sp ON
		a.StateProvinceID = sp.StateProvinceID
		AND sp.Name = 'Florida';
/*10a*/SELECT c.CompanyName FROM
		[AdventureWorks2012].[Person].[Company] c 
		INNER JOIN
		[AdventureWorks2012].[Person].[Person] p ON
		p.BusinessEntityID = c.BusinessEntityId
		WHERE (p.FirstName+' '+p.MiddleName+' '+p.LastName) = 'James D. Karmer';
/*10b*/SELECT c.CompanyName FROM
		[AdventureWorks2012].[Person].[Company] c 
		INNER JOIN
		[AdventureWorks2012].[Person].[Person] p ON
		p.BusinessEntityID = c.BusinessEntityId
		WHERE CONCAT(p.FirstName,' ',p.MiddleName,' ',p.LastName) = 'James D. Karmer';
/*11*/ SELECT SalesOrderID, UnitPrice FROM
		[AdventureWorks2012].[Sales].[SalesOrderDetail] 
		WHERE OrderQty = 1;
/*12*/SELECT pd.Description FROM
		[AdventureWorks2012].[Production].ProductDescription pd
		INNER JOIN 
		[AdventureWorks2012].[Production].ProductModelProductDescriptiONCulture pmpdc ON
		pmpdc.ProductDescriptionID = pd.ProductDescriptionID
		INNER JOIN
		[AdventureWorks2012].[Production].Product p ON
		p.ProductModelID = pmpdc.ProductModelID
		WHERE pmpdc.CultureID = 'fr' and p.ProductID = 736;
/*13*/SELECT OrderQty,Name,ListPrice FROM
		[AdventureWorks2012].[Production].[Product] AS Pp 
		INNER JOIN
		[AdventureWorks2012].[Sales].[SalesOrderDetail] Ssod ON
		Ssod.ProductID = Pp.ProductID  
		INNER JOIN
		[AdventureWorks2012].[Sales].[SalesOrderHeader] Ssoh ON
		Ssoh.SalesOrderID = Ssod.SalesOrderID
		INNER JOIN
		[AdventureWorks2012].[Sales].[Customer] Sc ON
		Sc.TerritoryID = Ssoh.TerritoryID 
		WHERE Sc.CustomerID = 635;
/*14*/SELECT COUNT(distinct(sod.ProductID)) AS TotalNumber FROM
		[AdventureWorks2012].[Sales].[SalesOrderHeader] soh
		INNER JOIN
		[AdventureWorks2012].[Person].[Address] a ON
		a.AddressID = soh.ShipToAddressID 
		INNER JOIN
		[AdventureWorks2012].[Sales].[SalesOrderDetail] sod ON
		sod.SalesOrderID = soh.SalesOrderID
		INNER JOIN
		[AdventureWorks2012].[Production].[Product] p ON
		p.ProductID = sod.ProductID
		INNER JOIN
		[AdventureWorks2012].[Production].[ProductSubcategory] psc ON
		psc.ProductSubcategoryID = p.ProductSubcategoryID 
		WHERE a.City = 'London' and psc.Name = 'Cranksets';
/*15*/ /*The CHAR data type:
	It is a fixed length data type.
	Used to store non-Unicode characters.
	Occupiers 1 byte of space for each character
	If the value provided to a variable of CHAR data type is shorter than the length 
	of a column of declared the size of the variable, then the value would be
	right-padded with blanks to match the size of column length. 
	EXAMPLE:
		DECLARE @string CHAR(20)  
		SET @string = 'Robin'  
		SELECT @string AS 'String', DATALENGTH(@string) AS 'Datalength' ,
		LEN(@string) AS 'Len'  
	When we find, the bytes occupied by the variable, it will be 20
	even though the length of the characters is 5.
	That means that irrespective of the character stored in the column,
	it will occupy all bytes to store the value.
	
	The VARCHAR data type:

	It is a variable length data type.
	Used to store non-Unicode characters.
	Occupies 1 byte of space for each character.
	EXAMPLE:
		DECLARE @string VARCHAR(20)  
		SET @string = 'Robin'  
		SELECT @string AS 'String', DATALENGTH(@string) AS 'Datalength' ,
		LEN(@string) AS 'Len'  
	As you can see above, it is showing DATALENGTH as 5 which means it will
	use only the number of bytes equal to the number of characters.
	This will allow me to avoid wasting database space.

	The NVARCHAR data type:

	It is a variable-length data type.
	Used to store Unicode characters.
	Occupies 2 bytes of space for each character
	Explain:
		DECLARE @string NVARCHAR(20)  
		SET @string = 'Robin'  
		SELECT @string AS 'String', DATALENGTH(@string) AS 'Datalength' ,
		LEN(@string) AS 'Len'  
	As in the output above, you will observe DATALENGTH column is showing
	ONly 10 as a value. That is because it occupies 2 bytes of space for
	each character and the data length is ONly 5 characters, therefore it
	will occupy 10 bytes of space in the database.*/
/*6*/--explanation--
/*a   b
		--------
		1   abc
		1   def
		1   ghi
		2   jkl
		2   mno
		2   pqr
		And I do the following query:

	SELECT a, b FROM T GROUP BY a
	The output should have two rows, one row WHERE a=1 and a second row WHERE a=2.
	But what should the value of b show on each of these two rows? There are three
	possibilities in each case, and nothing in the query makes it clear which value
	to choose for b in each group. It's ambiguous.
	This demonstrates the single-value rule, which prohibits the undefined results
	you get when you run a GROUP BY query, and you include any columns in the SELECT-list
	that are neither part of the grouping criteria, nor appear in aggregate functions
	(SUM, MIN, MAX, etc.).
	Fixing it might look like this:
	SELECT a, MAX(b) AS x FROM T GROUP BY a
		As,we want the following result:
		a   x
		--------
		1   ghi
		2   pqr
		Solutions:
			SELECT [vcName],count([vcMobieNumer]) as PhoneNo FROM [dbo].[tblEmp] GROUP BY [vcName];
			SELECT [vcName],[vcMobieNumer] FROM [dbo].[tblEmp] WHERE
				[vcMobieNumer] IS NOT NULL  GROUP BY [vcName],[vcMobieNumer] ;*/
/*5*/ -----explanation---------
/*Explain the TOP clause in the following sql queries?
    a. SELECT TOP(1) * FROM tblEmp :
		Ans: The SELECT TOP clause is used to specify the number of records to return.
	b. SELECT TOP(SELECT 3/2) * FROM tblEmp 
		Ans: since nothing is specified "3/2" will be computed to 1 i.e similar to
			"top(1)".
	c. SELECT TOP(1) PERCENT * FROM tblEmp 
		Ans: It will now return top 1% of the full result set.
				Fractional values are rounded up to the next integer value.
				PERCENT value can be from 0 to 100.
	d. SELECT TOP(1) WITH TIES * FROM tblEmp ORDER BY vcName
		Ans:It is used to retrieve all similar rows to base result set. 
			WITH TIES may cause more rows to be returned than the value
			specified in expression. For example, if expression is set
			to 5 but 2 additional rows match the values of the ORDER BY
			columns in row 5, the result set will contain 7 rows.*/