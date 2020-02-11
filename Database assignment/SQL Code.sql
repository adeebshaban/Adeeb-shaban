CREATE TABLE Guitar_Store (

	Guitar_Store_ID int (10) NOT NULL,
	Store_Name VARCHAR (50) NOT NULL,

	PRIMARY KEY (Guitar_Store_ID)
);

CREATE TABLE Employee (

	Employee_ID int (10) NOT NULL,
	Employee_First_Name CHAR (50) NOT NULL,
	Employee_Last_Name CHAR (50) NOT NULL,
	Employee_Date_of_Birth date NOT NULL,
	Employee_Phone_Number VARCHAR (50) NOT NULL,
	Employee_Email VARCHAR (50) NOT NULL,
	Guitar_Store_ID int (10) NOT NULL,

	PRIMARY KEY (Employee_ID),
	FOREIGN KEY (Guitar_Store_ID) REFERENCES Guitar_Store(Guitar_Store_ID)

);

CREATE TABLE Customer (

	Customer_ID int (10) NOT NULL,
	Customer_First_Name CHAR (50) NOT NULL,
	Customer_Last_Name CHAR (50) NOT NULL,
	Customer_Date_of_Birth date NOT NULL,
	Customer_Phone_Number VARCHAR (50) NOT NULL,
	Customer_Email VARCHAR (50) NOT NULL,
	Guitar_Store_ID int (10) NOT NULL,

	PRIMARY KEY (Customer_ID),
	FOREIGN KEY (Guitar_Store_ID) REFERENCES Guitar_Store(Guitar_Store_ID)

);


CREATE TABLE Invoice(

	Invoice_ID int (10) NOT NULL,
	Employee_ID int (10) NOT NULL,
	Customer_ID int (10) NOT NULL,
	Invoice_Number int (10) NOT NULL,
	Invoice_Price DECIMAL (13,2) NOT NULL,
	PRIMARY KEY (Invoice_ID),
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)

);

CREATE TABLE Brand(

	Brand_ID int (10) NOT NULL,
	Brand_Name CHAR (50) NOT NULL,
	Guitar_Store_ID int (10) NOT NULL,
	PRIMARY KEY (Brand_ID),
	FOREIGN KEY (Guitar_Store_ID) REFERENCES Guitar_Store(Guitar_Store_ID)
);

CREATE TABLE Sold_Guitar(

	Sold_Guitar_ID int (10) NOT NULL,
	Invoice_ID int (10) NOT NULL,
	Guitar_Store_ID int (10) NOT NULL,
	Brand_ID int(10) NOT NULL,
	Price Decimal (13,2) NOT NULL,
	PRIMARY KEY (Sold_Guitar_ID),
	FOREIGN KEY (Guitar_Store_ID) REFERENCES Guitar_Store(Guitar_Store_ID),
	FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID),
	FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID)
);

CREATE TABLE In_Store_Guitar(

	In_Store_Guitar_ID int (10) NOT NULL,
	Guitar_Store_ID int (10) NOT NULL,
	Brand_ID int(10) NOT NULL,
	Price Decimal (13,2) NOT NULL,
	PRIMARY KEY (In_Store_Guitar_ID),
	FOREIGN KEY (Guitar_Store_ID) REFERENCES Guitar_Store(Guitar_Store_ID),
	FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID)
);


---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `Guitar_Store` (`Guitar_Store_ID`, `Store_Name`) VALUES ('1', 'Guitar Center');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `Employee` (`Employee_ID`, `Employee_First_Name`, `Employee_Last_Name`,`Employee_Date_of_Birth`, `Employee_Phone_Number`, `Employee_Email`, `Guitar_Store_ID`)
 VALUES ('00001', 'Adeeb', 'Shaban', '2000-01-01', '+962795152698', 'adeebonsteam@gmail.com', '1'), ('00002', 'Saaed', 'Sallah', '2000-02-02', '+962775236598', 'saaeeds@gmail.com', '1');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Customer` (`Customer_ID`, `Customer_First_Name`, `Customer_Last_Name`,`Customer_Date_of_Birth`, `Customer_Phone_Number`, `Customer_Email`, `Guitar_Store_ID`)
 VALUES ('00001', 'Majd', 'Shaban', '2000-04-04', '+962795148698', 'majdonsteam@gmail.com', '1'), ('00002', 'Saaed', 'Sameh', '2000-05-04', '+962775125598', 'saaeedsameh@gmail.com', '1');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `Brand` (`Brand_ID`, `Brand_Name`, `Guitar_Store_ID`) VALUES ('1', 'LTD', '1'), ('2', 'DEAN', '1'), ('3','Fender','1');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `In_Store_Guitar` (`In_Store_Guitar_ID`, `Guitar_Store_ID`,`Brand_ID`,`Price`) VALUES ('1', '1','1','1000'), ('2','1','2','600');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `Invoice` (`Invoice_ID`, `Employee_ID`, `Customer_ID`, `Invoice_Number`, `Invoice_Price`) VALUES ('1', '00001', '1', '1', '500'), ('2', '00002', '2', '2','800');

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `Sold_Guitar` (`Sold_Guitar_ID`, `Invoice_ID`, `Guitar_Store_ID`,`Brand_ID`,`Price`) VALUES ('1', '1', '1','3','500'), ('2', '2', '1','3','800');


CREATE USER 'manager'@'localhost' IDENTIFIED BY 'adeebshaban2015'
CREATE USER 'adeeb.shaban'@'localhost' IDENTIFIED BY '0000'

GRANT ALL PRIVILEGES ON `Guitar\_shop`.* TO 'manager'@'localhost' WITH GRANT OPTION;

CREATE USER 'khakled.ahmad'@'%' IDENTIFIED VIA mysql_native_password USING '***';
GRANT USAGE ON *.* TO 'khakled.ahmad'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;


GRANT INSERT,DELETE,VIEW PRIVILEGES ON invoice to 'khaled.ahmad'@'localhost'
GRANT INSERT,DELETE,VIEW PRIVILEGES ON country 'khaled.ahmad'@'localhost'
GRANT INSERT,DELETE,VIEW PRIVILEGES ON customer to 'khaled.ahmad'@'localhost'
GRANT INSERT,DELETE,VIEW PRIVILEGES ON in_store_guitar to 'khaled.ahmad'@'localhost'
GRANT INSERT,DELETE,VIEW PRIVILEGES ON brand to 'khaled.ahmad'@'localhost'



CREATE VIEW `Sales` AS SELECT In_Store_Guitar.In_Store_Guitar_ID,In_Store_Guitar.Guitar_Store_ID,In_Store_Guitar.Price,Brand.Brand_Name FROM In_Store_Guitar INNER JOIN Brand ON Brand.Brand_ID=In_Store_Guitar.Brand_ID;
