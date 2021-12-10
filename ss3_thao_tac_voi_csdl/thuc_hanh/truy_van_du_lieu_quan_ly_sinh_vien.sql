use quan_ly_sinh_vien;

-- Hien thi danh sach tat ca hoc sinh.  
select * 
from student;

-- Hien thi danh sach hoc sinh dang theo hoc. 
select *
from student
where `status` = true;

-- Hien thi danh sach cac mon hoc co thoi gian hoc < 10. 
select *
from subject
where credit<10;

-- Hien thi danh sach hoc sinh lop A1.
select s.student_id, s.student_name, c.class_id
from student s join class c on s.class_id = c.class_id
where c.class_name = 'A1';

-- Hien thi diem mon CF cuar cac hocc vien.
select s.student_id, s.student_name, sub.subject_name, m.mark
from student s join mark m on s.student_id = m.student_id join subject sub on m.subject_id = sub.subject_id
where sub.subject_name = 'CF'; 