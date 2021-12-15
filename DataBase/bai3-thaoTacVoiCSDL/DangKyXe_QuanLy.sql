create database dangkyxe;
use dangkyxe;
create table nhaCungCap(
MaNhaCC varchar(45) primary key,
TenNhaCC varchar(45) not null,
DiaChi varchar(255),
SDT varchar(10),
MaSoThue varchar(20)
);
create table mucPhi(
MaMP varchar(45) primary key,
DonGia float not null,
MoTa varchar(255)
);
create table loaiDichVu(
MaLoaiDV varchar(45) primary key,
TenDV varchar(45)
);
create table dongXe(
DongXe varchar(45) primary key,
HangXe varchar(45) not null,
SoChoNgoi int not null
);
create table dangKyCungCap(
MaDkCC int auto_increment primary key,
MaNhaCC varchar(45) ,
MaMP varchar(45) ,
MaLoaiDV varchar(45) ,
DongXe varchar(45),
NgayBatDauCC datetime,
NgayKetThucCC datetime,
SoLuongXeDk int not null,
foreign key (MaNhaCC) references nhaCungCap(MaNhaCC),
foreign key (MaMP) references mucPhi(MaMP),
foreign key (MaLoaiDV) references loaiDichVu(MaLoaiDV),
foreign key (DongXe) references dongXe(DongXe)
)