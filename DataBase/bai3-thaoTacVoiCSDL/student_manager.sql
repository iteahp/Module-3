create database student_management;
use student_management;
create table class(
ClassId int auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit
);
create table student(
StudentID int auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassId int not null,
foreign key (ClassId) references class(ClassId)
);
create table subject(
SubId int auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint  not null default 1 check(Credit>=1),
Status bit default 1
);
create table mark(
MarkId int auto_increment primary key,
SubId int not null unique ,
StudentId int not null unique,
Mark float default 1 check(Mark between 0 and 100),
ExamTime tinyint default 1,
foreign key (SubId) references subject(SubId),
foreign key (StudentId) references student(StudentId)
)