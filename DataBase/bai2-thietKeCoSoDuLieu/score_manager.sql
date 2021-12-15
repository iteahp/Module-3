create database score_management ;
use score_management ;
create table student(
studentCode varchar(20) primary key,
name varchar(45),
birthday datetime ,
class varchar(45),
gt varchar(45)
);
create table subject(
subjectCode varchar(45) primary key,
name varchar(45),
teacherCode varchar(20),
foreign key (teacherCode) references teacher(teacherCode)
);
create table scoreBoard(
studentCode varchar (20),
subjectCode varchar(20),
score int ,
dateTest datetime,
primary key(studentCode,subjectCode),
foreign key(studentCode) references student(studentCode),
foreign key(subjectCode) references subject(subjectCode)
);
create table teacher(
teacherCode varchar(45) primary key,
name varchar (45),
phoneNumber varchar(10)
)
select*from scoreBoard;