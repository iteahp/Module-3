create database `topic_management`;
create table topic(
id int ,
name varchar(45),
fields varchar(45),
primary key (id)
);
select *from topic;
create table student(
id int ,
name varchar(45),
class varchar(45),
primary key (id),
idTopic int ,foreign key(idTopic) references topic(id)
);
create table teacher(
id int ,
name varchar(45),
degree varchar(45),
primary key (id)
);