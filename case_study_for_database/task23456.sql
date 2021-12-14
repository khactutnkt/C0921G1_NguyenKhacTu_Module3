use furama_database;

-- Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự. 
select *
from nhan_vien
where (ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%") and char_length(ho_ten) <= 15 ; 

-- Task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Đà Nẵng”. 
select *
from khach_hang
where (datediff(curdate(), ngay_sinh)/365 between 18 and 50) and  (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");
    
-- Task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 
select kh.ma_khach_hang, kh.ma_loai_khach, kh.ho_ten, count(hd.ma_hop_dong) as so_lan_dat_phong
from loai_khach lk join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where lk.ten_loai_khach = "Diamond"
group by kh.ma_khach_hang
order by count(hd.ma_hop_dong) asc;

-- Task 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
count(hd.ma_hop_dong) as so_lan_dat_phong,
ifnull(dv.chi_phi_thue,0) + ifnull(dvdk.gia,0)* ifnull(hdct.so_luong,0)  as tong_tien
from khach_hang kh 
	left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
	left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
	left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
	left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
    left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    group by kh.ma_khach_hang
	order by kh.ma_khach_hang asc;

/* 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3). 
*/
select dv.ma_dich_vu 'mã dịch vụ', dv.ten_dich_vu 'tên dịch vụ', dv.dien_tich 'diện tích',
	dv.chi_phi_thue 'chi phí thuê', ldv.ten_loai_dich_vu 'tên loại dịch vụ'
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
	join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where ngay_lam_hop_dong not like '2021-%';

/* 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại
dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa
từng được khách hàng đặt phòng trong năm 2021. 
*/
select dv.ma_dich_vu 'mã dịch vụ', dv.ten_dich_vu 'tên dịch vụ', dv.dien_tich 'diện tích', dv.so_nguoi_toi_da 'số người tối đa',
	dv.chi_phi_thue 'chi phí thuê', ldv.ten_loai_dich_vu 'tên loại dịch vụ'
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
	join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (
		select dv.ma_dich_vu
		from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
			join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
		where ngay_lam_hop_dong like '2021-%'
		group by dv.ma_dich_vu
		)
group by dv.ma_dich_vu;

/*Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu
ho_ten không trùng nhau. 
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên. 
*/
-- cách 1:
select ho_ten
from khach_hang
group by ho_ten;

-- cách 2: 
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

/* 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng
trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. 
*/
select month(ngay_lam_hop_dong) 'tháng', count(*) 'số khách đặt phòng'
from hop_dong
where ngay_lam_hop_dong like '2021-%'
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);


/* 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem). 
*/
 select  hd.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, sum(so_luong) 'số lượng dịch vụ đi kèm'	
 from hop_dong hd
	join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

/* 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có
 ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
*/
select dvdk.*
from khach_hang kh 
	join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
    join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '% Quảng Ngãi');

/* 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ
đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021. */
select hd.*, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) 'số lượng dịch vụ đi kèm'
from hop_dong hd 
	join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
    join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
    join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
    join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
    join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where (month(ngay_lam_hop_dong) in (10,11,12) and year(ngay_lam_hop_dong) = 2020)
	and hd.ma_dich_vu not in (
		select ma_dich_vu
        from hop_dong
        where month(ngay_lam_hop_dong) in (1,2,3,4,5,6) and year(ngay_lam_hop_dong) = 2021
        )
group by dv.ma_dich_vu;

/* 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/
select dvdk.*, sum(hdct.so_luong)
from hop_dong_chi_tiet hdct
    join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) >= (
	select sum(hdct.so_luong)
    from hop_dong_chi_tiet hdct
    join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    group by hdct.ma_dich_vu_di_kem
    order by sum(hdct.so_luong) desc
    limit 1
    );


/*Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu,
ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). 
*/


