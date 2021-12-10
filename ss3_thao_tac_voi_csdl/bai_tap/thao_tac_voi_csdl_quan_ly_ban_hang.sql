use quan_ly_ban_hang;

-- Thêm dữ liệu vào các bảng
insert into customer
value 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into `order`
value
(1, 1, '2021-12-15', null),
(2, 2, '2021-12-21', null),
(3, 1, '2021-12-25', null);

insert into product
value
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into order_detail
value
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_id, c.customer_name, p.product_id, p.product_name, p.product_price
from customer c join `order` o on c.customer_id = o.customer_id 
join order_detail od on o.order_id = od.order_id join product p on od.product_id = p.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- caau truy vaans con, not in, not exists	


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)

select o.order_id, o.order_date , od.total_price = od.order_detail_quantity * p.product_price
from `order` o join order_detail od on o.order_id = od.order_id join product p on od.product_id = p.product_id