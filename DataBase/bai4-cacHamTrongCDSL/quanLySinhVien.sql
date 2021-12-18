create database QuanLySinhVien;
use QuanLySinhVien;
create table student(
studentID int auto_increment primary key,
studentName varchar(45),
age int ,
email varchar(255)
);
create table class(
classID int auto_increment primary key,
className varchar(100)
);
create table classStudent(
studentId int,
classId int ,
classStudentId int auto_increment primary key,
foreign key (studentID) references student(studentID),
foreign key (classId) references class(classID)
);
create table subjects(
subjectId int auto_increment primary key,
subjectName varchar(100)
);
create table marks(
markID int auto_increment primary key,
mark int,
subjectId int, studentId int,
foreign key (studentId) references student(studentID),
foreign key (subjectId) references subjects(subjectId)
);

-- Hien thi danh sach tat ca cac hoc vien 
select *from student;
-- Hien thi danh sach tat ca cac mon hoc
select *from subjects;
-- Tinh diem trung binh
select s.studentName, avg(m.mark) 
 from student s join marks m on s.studentId = m.studentId
 group by s.studentName;
 -- Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
 select sbj.subjectName , max(m.mark) as diemLonNhat
 from subjects sbj join marks m on sbj.subjectId = m.subjectId;
 -- Danh so thu tu cua diem theo chieu giam alter
 select m.markId,m.mark from marks m order by m.mark desc;
 
 -- Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
 alter table subjects 
 modify column subjectName varchar(50);
 
 -- Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi 
 -- tren cot SubjectName trong bang Subjects
 update subjects set subjectName = 'Day la mon hoc SQL ' where subjectID = 1;
 update subjects set subjectName = 'Day la mon hoc Java ' where subjectID = 2;
 update subjects set subjectName = 'Day la mon hoc C ' where subjectID = 3;
 update subjects set subjectName = 'Day la mon hoc Visual Sudio' where subjectID = 4;
 
 -- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
 alter table student 
 add check (age>15 and age<50);
 
 -- Loai bo tat ca quan he giua cac bang 
alter table classStudent drop foreign key classstudent_ibfk_1;

-- Xoa hoc vien co StudentID la 1
delete from student where studentId =1;

-- Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table student 
add column status bit default 1;

-- Cap nhap gia tri Status trong bang Student thanh 0
update student set status = 0 where studentId = 1;
