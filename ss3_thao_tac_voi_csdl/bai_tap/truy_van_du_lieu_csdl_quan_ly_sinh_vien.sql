use quan_ly_sinh_vien;

-- Hiển thị danh sách sinh viên có tên bắt đầu bằng chữ h.
select *
from student
where student_name like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class 
where start_date like "%-12-%";

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student 
set class_id = 2 
where student_name = "Hung";

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name, sub.subject_name, m.mark
from student s join mark m on s.student_id = m.student_id join `subject` sub on m.subject_id = sub.subject_id
order by m.mark desc, student_name asc;