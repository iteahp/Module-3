create database quanly_diem_sinh_vien;
use quanly_diem_sinh_vien;

create table sinhvien(
maSV int auto_increment primary key,
hoTen varchar(45),
gioiTinh varchar(10),
ngaySinh date,
maLop int ,
hocBong double,
tinh varchar(45),
foreign key (maLop) references lop(maLop)
);
create table lop(
maLop int auto_increment primary key ,
tenLop varchar(45),
maKhoa int,
foreign key (maKhoa)references khoa(maKhoa)
);
create table khoa(
maKhoa int auto_increment primary key,
tenKhoa varchar(45),
soCBGD int
);
create table monHoc(
maMH int auto_increment primary key,
tenMH varchar (45),
soTiet int 
);
create table ketQua(
maSV int ,
maMH int ,
diemThi double,
primary key(maSV,maMH),
foreign key (maSV)references sinhvien(maSV),
foreign key (maMH)references monHoc(maMH)
);


-- Câu 1: Liệt kê danh sách các lớp của khoa, thông tin cần Malop, TenLop, MaKhoa
	select*from lop;
    
 -- Câu 2: Lập danh sách sinh viên gồm: MaSV, HoTen, HocBong
   select maSV,hoten,hocbong from sinhvien;
   
   -- Câu 3: Lập danh sách sinh viên có học bổng. Danh sách cần MaSV, gioiTinh, HocBong
    select maSv,gioitinh,hocbong from sinhvien where hocbong is not null;
    
	-- Câu 5: Lập danh sách sinh viên có ten ‘duy’
    select * from sinhvien where hoten like '%duy%';
	
    -- Câu 6: Lập danh sách sinh viên nữ có học bổng
    select*from sinhvien where gioitinh = 'nu' and hocbong is not null;
    -- Câu 7: Lập danh sách sinh viên nữ hoặc danh sách sinh viên có học bổng
	select*from sinhvien where gioitinh = 'nu' or hocbong is not null;
    -- Câu 8: Lập danh sách sinh viên có năm sinh từ 1990 đến 2000. Danh sách cần các thuộc tính của quan hệ SinhVien
    select*from sinhvien where year(ngaysinh)>=1990 and year(ngaysinh)<=2000;
    
--   Câu 9: Liệt kê danh sách sinh viên được sắp xếp tăng dần theo MaSV
	select*from sinhvien order by masv;
  --  Câu 10: Liệt kê danh sách sinh viên được sắp xếp giảm dần theo HocBong
  select*from sinhvien order by  hocbong desc;
  
  -- cau  12: Lập danh sách sinh viên có học bổng của khoa CNTT. Thông tin cần: MaSV,hoten,tenKhoa,hocbong
  select sinhvien.masv,sinhvien.hoten,khoa.tenkhoa,sinhvien.hocbong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  where hocbong is not null and tenkhoa = 'cong nghe thong tin'
;
-- Câu 15: Cho biết số lượng sinh viên của mỗi khoa.
 select khoa.tenkhoa,count(maSV)as soluongsinhvien from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  group by tenkhoa;
  
  -- Câu 16: Cho biết số lượng sinh viên nữ của mỗi khoa 
  select khoa.tenkhoa,count(maSV)as soluongsinhvienNu from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  where sinhvien.gioitinh = 'nu'
  group by tenkhoa;
  
 -- Câu 17: Cho biết tổng tiền học bổng của mỗi lớp
  select lop.tenlop , sum(hocbong)as tonghocbong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  group by lop.tenlop;
 --  Câu 18: Cho biết tổng số tiền học bổng của mỗi khoa
	select khoa.tenkhoa , sum(hocbong)as tonghocbong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  group by khoa.tenkhoa;
  
 --  Câu 19: Lập danh sánh những khoa có nhiều hơn 2 sinh viên. Danh sách cần: MaKhoa, TenKhoa, Soluong
  create view soluong_sinhvien_moiKhoa as
  select khoa.tenkhoa, count(maSv) as soluong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa group by khoa.makhoa;
  
  select tenkhoa,soluong from (soluong_sinhvien_moikhoa)
  where soluong>2;

-- 	Câu 20: Lập danh sánh những khoa có nhiều hơn 50 sinh viên nữ. Danh sách cần: MaKhoa, TenKhoa, Soluong
  create view soluong_sinhvienNu_moiKhoa as
  select khoa.tenkhoa, count(masv) as soluong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  where sinhvien.gioitinh = 'nu'
  group by khoa.makhoa;
  
   select tenkhoa,soluong from (soluong_sinhvienNu_moikhoa);
   
  --  Câu22: Lập danh sách sinh viên có học bổng cao nhất
	select * from sinhvien 
    having sinhvien.hocbong = (select max(hocbong)from sinhvien);
-- Câu 23: Lập danh sách sinh viên có điểm thi môn triet1 cao nhất
    
    create view danhsachdiemMontriet1 as
    select sinhvien.hoten,monhoc.tenmh,diemthi from sinhvien join ketqua on sinhvien.masv = ketqua.masv 
    join monhoc on ketqua.mamh = monhoc.mamh 
    where monhoc.tenmh = 'triet1' ;
    
    select sinhvien.hoten,monhoc.tenmh,diemthi from sinhvien join ketqua on sinhvien.masv = ketqua.masv 
    join monhoc on ketqua.mamh = monhoc.mamh 
    where monhoc.tenmh = 'triet1' and diemthi = (select max(diemthi) from danhsachdiemMontriet1);
    
    -- Câu 25: Cho biết những khoa nào có nhiều sinh viên nhất
		
 select khoa.tenkhoa ,count(masv) as soluong from
  sinhvien join lop on sinhvien.malop=lop.malop 
  join khoa on lop.makhoa= khoa.makhoa
  group by tenkhoa
  having soluong = (select max(soluong) from soluong_sinhvien_moiKhoa )