Use NoRealData;

CREATE TABLE Classes (
Class_ID Varchar(50) CONSTRAINT PK_Classes PRIMARY KEY,
Class_Name Varchar(50) NOT NULL,
Class_Size_Limit Int NOT NULL
);


CREATE TABLE People_Addresses (
Address_ID Varchar(50) CONSTRAINT PK_People_Addresses PRIMARY KEY,
State Varchar(2) NOT NULL,
ZIP int NOT NULL,
City Varchar(50) NOT NULL,
Street Varchar(50) NOT NULL
);


CREATE TABLE Products (
Product_ID Varchar(50) CONSTRAINT PK_Products PRIMARY KEY,
Product Varchar(75) NOT NULL,
Description Varchar(100),
Cost int NOT NULL
);


CREATE TABLE Agency (
  Agency_ID Varchar(50) CONSTRAINT PK_Agency PRIMARY KEY,
  Grant_Amount int NOT NULL,
  Agency_Name Varchar(50) NOT NULL
);


CREATE TABLE Instructors_Students (
  Ins_Student_ID Varchar(50) CONSTRAINT PK_Instructors_Students PRIMARY KEY,
  First_Name Varchar(20) NOT NULL,
  Last_Name Varchar(20) NOT NULL,
  Address_ID Varchar(50) NOT NULL CONSTRAINT FK_Ins_Stu FOREIGN KEY REFERENCES People_Addresses(Address_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
  Personal_Phone Varchar(10),
  Title Varchar(50) NOT NULL
);


CREATE TABLE Grants (
Grant_ID Varchar(50) CONSTRAINT PK_Grants PRIMARY KEY,
Agency_ID Varchar(50) NOT NULL CONSTRAINT FK_Grants FOREIGN KEY REFERENCES Agency (Agency_ID)  ON DELETE NO ACTION ON UPDATE CASCADE,
Year_Granted int,
Expiration int
);


CREATE TABLE Research (
  Research_ID Varchar(50) CONSTRAINT PK_Research PRIMARY KEY,
  Department Varchar(50),
  Topic Varchar(50),
  Grant_ID Varchar(50) CONSTRAINT FK_Research FOREIGN KEY REFERENCES Grants (Grant_ID) ON DELETE SET NULL ON UPDATE NO ACTION
);


CREATE TABLE Research_Class (
  Research_Class_ID Varchar(50) CONSTRAINT PK_Research_Class PRIMARY KEY,
  Class_ID Varchar(50) NOT NULL CONSTRAINT FK_Research_Class FOREIGN KEY REFERENCES Classes (Class_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Research_ID Varchar(50) CONSTRAINT FK_Research_Class_Two FOREIGN KEY REFERENCES Research (Research_ID) ON DELETE SET NULL ON UPDATE NO ACTION
);

CREATE TABLE Class_People (
  Class_People_ID Varchar(50) CONSTRAINT PK_Class_People PRIMARY KEY,
  Class_ID Varchar(50) NOT NULL CONSTRAINT FK_Class_People FOREIGN KEY REFERENCES Classes (Class_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Ins_Student_ID Varchar(50) NOT NULL CONSTRAINT FK_Class_People_Two FOREIGN KEY REFERENCES Instructors_Students (Ins_Student_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Grade DECIMAL(3,2) NOT NULL
);


CREATE TABLE People_Credit_Card (
  P_Creditcard_ID Varchar(50) CONSTRAINT PK_People_Credit_Card PRIMARY KEY,
  Ins_Student_ID Varchar(50) NOT NULL CONSTRAINT FK_People_Credit_Card FOREIGN KEY REFERENCES Instructors_Students (Ins_Student_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  Card_number Varchar(20),
  Expiration_Date Varchar(5),
  CSV_Code Varchar(3)
);


CREATE TABLE People_Purchases (
  P_Purchase_ID Varchar(50) CONSTRAINT PK_People_Purchases PRIMARY KEY,
  P_Creditcard_ID Varchar(50) NOT NULL CONSTRAINT FK_People_Purchases FOREIGN KEY REFERENCES People_Credit_Card (P_Creditcard_ID) ON DELETE CASCADE ON UPDATE NO ACTION,
  Order_Date Varchar(10) NOT NULL
);


CREATE TABLE Purchases_Products (
  Purchase_Products_ID Varchar(50) CONSTRAINT PK_Purchases_Products PRIMARY KEY,
  P_Purchase_ID Varchar(50) NOT NULL CONSTRAINT FK_Purchases_Products FOREIGN KEY REFERENCES People_Purchases (P_Purchase_ID) ON DELETE CASCADE ON UPDATE NO ACTION,
  Product_ID Varchar(50) NOT NULL CONSTRAINT FK_Purchases_Products_Two FOREIGN KEY REFERENCES Products (Product_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  Quantity int NOT NULL,
  Review Varchar(100)
);
