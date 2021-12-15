-- Bước 1: Tạo cơ sở dữ liệu demo
drop database if exists demo;
create database demo;
use demo;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table products(
	id int primary key,
    product_code int,
    product_name varchar(45),
    product_price double,
    product_amount int,
    product_description varchar(45),
    product_status bit
);

-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products
values 
(1, 1, 'Iphone11', 12000, 10, 'apple', 1),
(2, 2, 'Samsung Note 10', 10000, 100, 'korea', 1),
(3, 3, 'Sony Z3', 15000, 15, 'sony', 0);


/*
Bước 3:
Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
So sánh câu truy vấn trước và sau khi tạo index
*/
create unique index idx_products_code
on products(product_code);
explain select * from products where product_code = 1; 

create unique index idx_product_code_price
on products(product_code,product_price);
explain select * from products where product_code = 1 and product_price = 15000; 
show index from products;

/*
Bước 4:
Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
Tiến hành sửa đổi view
Tiến hành xoá view
*/
create view products_view as
select product_code,product_name,product_price,product_status
from products;
select * from products_view;

create or replace view products_view as
select product_code,product_name,product_price,product_amount
from products;
select * from products_view;

drop view products_view;

/*
Bước 5:
Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
Tạo store procedure thêm một sản phẩm mới
Tạo store procedure sửa thông tin sản phẩm theo id
Tạo store procedure xoá sản phẩm theo id
*/

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_product()
begin 
	select * from products;
end;
// delimiter ;
 call get_product();
 
 -- Tạo store procedure thêm một sản phẩm mới
 delimiter //
 create procedure insert_new_product(
	id int,
    product_code int,
    product_name varchar(45),
    product_price double,
    product_amount int,
    product_description varchar(45),
    product_status bit
    )
begin
	insert into products
    value
    (id, product_code, product_name, product_price, product_amount, product_description, product_status);
end;
// delimiter ;
call insert_new_product(4, 4, 'Sony Z3', 15000, 15, 'sony', 1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product_by_id (
	product_id int,
    `code` int,
    `name` varchar(45),
    price double,
    amount int,
    `description` varchar(45),
    `status` bit
    )
begin 
	update products
	set product_code =  `code`, product_name = `name`, product_price = price,
		product_amount = amount, product_description = `description`, product_status =  `status`
	where id = product_id;
end;
// delimiter ;
call edit_product_by_id(2, 2,'Oppo a30', 8000, 35,'china', 1);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id (id_product int)
begin
	delete 
    from products
    where id = id_product;
end;
// delimiter ;
call delete_product_by_id(2);
