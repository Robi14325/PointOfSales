
Create Database PointOfSale
-------- 
		--Employee
--------
Create table Employee
(
	EmpId		int primary key identity(10101,1),
	FirstName	varchar(100),
	LastName	varchar(100) not null,
	Picture		image not null,
	PicPath		varchar(250),
	DOB			date not null,
	Gender		varchar(6) not null,
	NID			varchar(50) not null,
	PresentAddress	varchar(100) not null,
	ParmanentAddress	varchar(100),
	City		varchar(50) not null,
	"State"		varchar(50) not null,
	PostalCode		nchar(50) not null,
	Nationality	varchar(50) not null,
	Email		nchar(100) not null,
	Mobile		nchar(14) not null,
	EmployeeType	varchar(50) not null,
	EntryDate	date default getdate(),
	JoiningDate	date not null,
	Salary		decimal(10, 2) not null
)
go

-------- 
		--Customer
--------
Create table Customer
(
	CustId		int primary key identity(111,1),
	FirstName	varchar(100),
	LastName	varchar(100) not null,
	Picture		image not null,
	PicPath		varchar(250),
	DOB			date not null,
	Gender		varchar(6) not null,
	NID			varchar(50) not null,
	PresentAddress	varchar(100) not null,
	ParmanentAddress	varchar(100),
	City		varchar(50) not null,
	"State"		varchar(50) not null,
	PostalCode		nchar(50) not null,
	Nationality	varchar(50) not null,
	Email		nchar(100) not null,
	Mobile		nchar(14) not null,
	CreaditLimit	decimal(10,2) not null,
	Deu			decimal(10, 2)
)
go

-------- 
		--Catagorie
--------
Create table Catagorie
(
	CataId		int primary key identity(1010,10),
	CataName	varchar(100)not null
)
go

-------- 
		--Product
--------
Create table Product
(
	ProdId		int primary key identity(101,1),
	CataId		int references Catagorie(CataId),
	ProdName	varchar(100) not null,
	PicPath		varchar(250),
	Picture		image not null,
	"Desc"		varchar(150),
	IsAvailable	bit not null,
	PurchaseDate	date,
	PurchasePrice	decimal(10,2),
	SalePrice		decimal(10,2) not null,
	Quantity		int not null

)
go

-------- 
		--Supplier
--------
Create table Supplier
(
	SuppId		int primary key identity(1001,10),
	SuppName	varchar(100) not null,
	Picture		image not null,
	PicPath		varchar(250),
	SuppAddress		varchar(150) not null,
	SuppCity		varchar(50) not null,
	SuppState		varchar(50)not null,
	PostalCode		nchar(10)not null,
	Email			nchar(100) not null,
	Mobile			int not null
)
go

-------- 
		--Purchase
--------
Create table Purchase
(
	PurchaseId		int primary key identity,
	SupplierId		int references Supplier(SuppId),
	ProdId			int references Product(ProdId),
	PurchaseDate	date default getdate(),
	PurchasePrice	decimal(10,2) not null,
	Quantity		int not null
)
go

-------- 
		--Store
--------
Create table Store
(
	StoreId		int primary key identity,
	ProductId	int references Product(ProdId),
	PurchaseID	int references Purchase(PurchaseId),
	StoreDate	date default getdate(),
	TotalOfProduct		int,
	
)
go


-------- 
		--Payment
--------
Create table Payment
(
	PaymentId		int primary key identity,
	CustId			int references Customer(CustId),
	PaymentMethod	varchar(100)not null,
	PaymentDate		date default getdate(),
	TransactionId	varchar(50),
	BankName		varchar(50),
	Cash			decimal(10, 2),
	Amount			decimal(10, 2)
)
go

-------- 
		--Delivery
--------
Create table Delivery
(
	DeliveryId		int primary key identity,
	EmpId			int references Employee(EmpId),
	DeliveryDate	date,
	DeliveryTime	datetime default getdate()
)
go

-------- 
		--Order Details
--------
Create table OrderDetail
(
	OrderDetailId		int primary key identity,
	ProdID				int references Product(ProdId),
	Quantity			int not null,
	Total				decimal(10, 2)
)
go

-------- 
		--Order Master
--------
Create table OrderMaster
(
	OrderMasterId	int primary key identity,
	OrderDetailId	int references OrderDetail(OrderDetailId),
	CustId			int references Customer(CustId),
	Discount		decimal(5, 2),
	Vat				decimal(5,2),
	GrossTotal		decimal(10, 2),
	PaymentId		int references	Payment(PaymentId),
	DeliverID		int references Delivery(DeliveryId),
	EmpId			int references Employee(EmpID),
	OrderDate		date default getdate(),
);
go
