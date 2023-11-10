DROP database IF exists demo;
CREATE database IF not exists demo;
USE demo;

CREATE TABLE Products
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    productCode        VARCHAR(4)     NOT NULL,
    productName        VARCHAR(255)   NOT NULL,
    productPrice       DECIMAL(10, 2) NOT NULL,
    productAmount      INT     DEFAULT 0,
    productDescription VARCHAR(255)   NOT NULL,
    productStatus      BOOLEAN DEFAULT TRUE
);

INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (1234, 'Air Conditional', 12.34, 5, 'productDescription', true),
       (5678, 'Fan Electric', 45.67, 3, 'anotherDescription', false),
       (9012, 'Laptop', 89.01, 10, 'yetAnotherDescription', true),
       (8311, 'Tivi', 89.01, 10, 'yetAnotherDescription', false);

# Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX unique_index
    ON Products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX composite_index
    ON Products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào 
-- So sánh câu truy vấn trước và sau khi tạo index
EXPLAIN analyze
SELECT *
FROM Products;

# Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW ViewProduct AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

SELECT *
FROM ViewProduct;

SELECT *
FROM Products;

-- Tiến hành sửa đổi view
UPDATE Products
SET productName = 'Smart Watch'
WHERE id = 4;

-- Tiến hành xoá view
DROP VIEW ViewProduct;

# Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;
CALL GetAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddProduct(a varchar(4) ,b varchar(255), c decimal(10,2), d int, e varchar(255), f boolean)
BEGIN
    INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (a, b, c, d, e , f);
END //
DELIMITER ;
CALL AddProduct ('6544', 'Computor', 87.15, 6, 'computor description', false );

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN productId INT,
    IN productName VARCHAR(100),
    IN productPrice DECIMAL(10, 2)
)
BEGIN
    UPDATE Products
    SET productName  = productName,
        productPrice = productPrice
    WHERE id = productId;
END //
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProduct(
    IN productId INT
)
BEGIN
    DELETE
    FROM Products
    WHERE id = productId;
END //
DELIMITER ;