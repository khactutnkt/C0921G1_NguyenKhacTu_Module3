use quan_ly_sinh_vien;
 -- Hiển thị số lượng sinh viên ở từng nơi
 select address, count(*) 'số lượng học viên'
 from student
 group by address;
 
 -- Tính điểm trung bình các môn học của mỗi học viên
 select mark.student_id, student.student_name, avg(mark)
 from mark join student on mark.student_id = student.student_id
 group by mark.student_id;
 
 -- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 9
select mark.student_id, student.student_name, avg(mark)
from mark join student on mark.student_id = student.student_id
group by mark.student_id
having avg(mark) > 9;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select mark.student_id, student.student_name, avg(mark)
from mark join student on mark.student_id = student.student_id
group by mark.student_id
having avg(mark) >= all (
	select avg(mark)
    from mark
    group by student_id
    )
