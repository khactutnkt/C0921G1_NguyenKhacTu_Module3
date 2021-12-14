use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
having credit >= (
	select credit
    from subject
    group by subject_id
    order by credit desc
    limit 1
    );
    
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from subject 
where subject_id = (
	select s.subject_id
    from subject s 
		join mark m on s.subject_id = m.subject_id
	order by mark desc
    limit 1
    );
    
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *, avg(mark) diem_trung_binh
from student s
	join mark m on s.student_id = m.student_id
group by s.student_id
order by diem_trung_binh desc
