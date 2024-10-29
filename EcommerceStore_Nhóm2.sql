use  EcommerceStore_Group2
-- Bảng Admin
CREATE TABLE AdminUser (
    AdminID INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    AdName NVARCHAR (50) NULL,
    RoleUser NVARCHAR (50) NULL,
    PasswordUser NCHAR (50) NULL
    
);
-- Bảng khách hàng
CREATE TABLE Customer (
    CustomerID INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
    Username nVARCHAR(50) NULL,
    Email NVARCHAR(100) NULL,
    PhoneNumber NVARCHAR(15) NULL,
    FullName nVARCHAR(100),
    PasswordHash nVARCHAR(255),
    Address TEXT
);
-- Bảng danh mục sản phẩm
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName nVARCHAR(50) NOT NULL
);
-- Bảng giỏ hàng
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    TotalPayment DECIMAL(10, 2),
    SelectedProductCount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

-- Bảng sản phẩm
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName nVARCHAR(100) NOT NULL,
    IsFavorite BIT DEFAULT 0,
    Price DECIMAL(10, 2) NOT NULL,
    Rating DECIMAL(3, 2),
    Version nVARCHAR(50),
    Description TEXT,
    ImageList NVARCHAR (50),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE
);

-- Bảng đơn hàng
CREATE TABLE OrderItem (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    MessageForSeller TEXT,
    ShippingAddress TEXT,
    TotalAmount DECIMAL(10, 2),
    ShippingFee DECIMAL(10, 2),
    GrandTotal DECIMAL(10, 2),
	Foreign key (CustomerID) References Customer(CustomerID) ON DELETE CASCADE
);



-- Bảng chi tiết giỏ hàng
CREATE TABLE CartDetail (
    CartDetailID INT PRIMARY KEY,
    ProductID INT,
    CartID INT,
    ProductType VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT DEFAULT 1,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE
);





-- Bảng chi tiết đơn hàng
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    ProductID INT,
    OrderID INT,
    ProductType VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT DEFAULT 1,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (OrderID) REFERENCES OrderItem(OrderID) ON DELETE CASCADE,
);

