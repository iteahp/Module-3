create database quanLytourdulich;
use quanLytourdulich;
create table thanhpho(
Idtp int auto_increment primary key,
tenthanhpho varchar(45)
);
create table khachhang(
Idkh int auto_increment primary key,
tenkhachhang varchar(45),
cmt int,
namsinh date,
idTp int,
foreign key (idTp) references thanhpho(IdTp)
);
create table diemdendulich(
idDiemden int auto_increment primary key,
tendiemden varchar(255),
mota varchar(255),
giadiemden double ,
idTp int ,
foreign key (idTp) references thanhpho(idTp)
);
create table loaitour(
idloaitour int auto_increment primary key,
maloaitour varchar(10),
tenloaitour varchar (255) 
);
create table tour(
idtour int auto_increment primary key,
idloaitour int ,
giatour double,
ngaybatdau date,
ngayketthuc date,
foreign key (idloaitour) references loaitour(idloaitour)
);
create table hoadondattour(
idHoadon int auto_increment primary key,
idtour int ,
idkh int ,
trangthai boolean default false,
foreign key (idtour) references tour(idtour),
foreign key (idkh) references khachhang(idkh)
);
-- câu 1 : Thống kê số lượng tour của các thành phố
select thanhpho.tenthanhpho,count(tour.idtour) as soluongtour from tour 
join hoadondattour on hoadondattour.idtour = tour.idtour join khachhang on hoadondattour.idkh = khachhang.idkh
join thanhpho on khachhang.idtp = thanhpho.idtp
group by thanhpho.tenthanhpho;

select count(idtour)as soluongtourthang3 from tour 
where year(ngaybatdau) = 2021 and month(ngaybatdau) = 3;
select count(idtour)as soluongtourthang4 from tour 
where year(ngayketthuc) = 2021 and month(ngayketthuc) = 4;




