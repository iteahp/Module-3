create database quanlyhocvien;
use quanlyhocvien;
create table student (
Rn int auto_increment primary key,
Name varchar(20),
Age tinyint
);
create table test (
testId int auto_increment primary key,
tName varchar(20)
);
create table studentTest(
Rn int ,
TestId int ,
Date date,
mark float,
primary key(Rn,TestId),
foreign key (Rn ) references student(Rn),
foreign key (TestId) references test(TestID)
);
-- Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó
select s.*, t.tname,st.mark,st.date from student s
join studenttest st on s.rn = st.rn 
join test t on t.testid = st.testid ;

-- Hiển thị danh sách các bạn học viên chưa thi môn nào như hình sau:
select s.* from student s
left join studenttest st on s.rn = st.rn left join test t on t.testid = st.testid
where st.testid is null;

-- Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và 
-- điểm thi(điểm phải thi lại là điểm nhỏ hơn 5):
select s.name,t.tname,st.mark,st.date from student s
 join studenttest st on s.rn = st.rn  join test t on t.testid = st.testid
where st.mark <5;

-- Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi.
--  Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm)
select s.*,avg(st.mark) as DiemTB from student s
 join studenttest st on s.rn = st.rn  
 group by s.name
 order by DiemTB desc;

-- Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất 
select s.name,avg(st.mark) as DiemTB from student s
 join studenttest st on s.rn = st.rn
 group by s.name
 order by DiemTB desc
 limit 1;
 
create view timdiemtb as
 (select avg(st.mark) as DiemTB from student s
 join studenttest st on s.rn = st.rn
 group by s.name) ;
 

 select s.name ,avg(mark) as avgMax from student s join studenttest st on s.rn = st.rn 
 group by s.name 
 having avgMax = (select max(DiemTB)as max from (timdiemtb));

create view diemtbLonNhat as
(select max(DiemTB)as max from (timdiemtb))
;

 
 
 select max(tb)
from (select avg(Mark) AS tb
from student join studenttest on student.RN = studenttest.RN
group by Name) as avg;
 
 select avg(Mark) AS tb
from student join studenttest on student.RN = studenttest.RN
group by Name;
 
 -- Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học
 
 select t.tname ,max(st.mark) from test t  join studenttest st on t.testid = st.testid
group by t.tname;

-- Hiển thị danh sách tất cả các học viên và môn học mà các học viên 
-- đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null như sau:	
select s.name,t.tname from student s
left join studenttest st on s.rn = st.rn left join test t on t.testid = st.testid;

-- Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
update student 
set age = age+1 where rn>1;

-- Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
alter table student
change statuss statue varchar(30);

-- câu 11 :  Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, 
-- trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student 

update student 
set statue = (case when age<30 then 'helo' else 'ld' end);

-- câu lệnh tắt tính năng cập nhật an toàn .có thể cập nhập qua thuộc tính k phải khóa chính 
set sql_safe_updates =0;


-- câu 12 : Tạo view tên là vwStudentTestList hiển thị danh sách học viên và điểm thi
-- , dánh sách phải sắp xếp tăng dần theo ngày thi như sau:	[2.0]

create view wwStudentTestList as 
select s.name, t.tname,st.mark,st.date from student s
join studenttest st on s.rn = st.rn 
join test t on t.testid = st.testid 
order by st.date;

-- câu 13 : Tạo một trigger tên là tgSetStatus sao cho khi sửa tuổi của học viên thi
--  trigger này sẽ tự động cập nhật status theo quy tắc sau:	[2.5]
--  Nếu tuổi nhỏ hơn 30 thì Status=’Young’
--  Nếu tuổi lớn hơn hoặc bằng 30 thì Status=’Old’
drop trigger before_student_update1
;
delimiter //
create trigger before_student_update1
before update on student
for each row 
begin
set new.statue = (case when new.age<30 then 'young' else 'old' end);
end //;


-- câu 14 : Tạo một stored procedure tên là spViewStatus, stored procedure này nhận vào 2 tham số:	[2.5]
-- Tham số thứ nhất là tên học viên					
-- Tham số thứ 2 là tên môn học
-- Nếu tên học viên hoặc tên môn học không tìm thây trong cơ sở dữ liệu thì hiện ra màn hình thông báo: ‘Khong tim thay’
-- Trường hợp còn lại thi hiển thị trạng thái của học viên đó với môn học đó theo quy tắc sau:
-- Hiển thị ‘Chua thi’ nếu học viên đó chưa thi môn đó
-- Hiển thị ‘Do’ nếu đã thi rồi và điểm lơn hơn hoặc bằng 5
-- Hiển thị ‘Trượt’ nếu đã thi rồi và điểm thi nhỏ hơn 5

delimiter //
create procedure spVeiwStatustt(NameIn varchar(45),tNameIn varchar(45))
begin
	select Name,tName, (
    case when ww.Name = NameIn and ww.tName is null then 'chua thi' 
         when ww.Name = NameIn and ww.tName = tNameIn and mark >=5 then 'Do'
         when ww.Name = NameIn and ww.tName = tNameIn and mark <5 then 'truot'
       else 'khong tim thay' 
       end 
    )as mota from wwstudenttestlist ww;
end; //
call spVeiwStatustt ('Tuan Minh','EPC');
drop procedure wwstudenttestlist()                                        





















