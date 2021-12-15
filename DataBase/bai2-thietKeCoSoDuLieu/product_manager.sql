create database sales_management;
use sales_management;
create table customer(
customerId int auto_increment primary key,
customerName varchar(20) not null,
customerAge int not null
);
create table product(
productId int auto_increment primary key,
productName varchar(45) not null,
productPrice float not null
);
create table orders(
orderId int auto_increment primary key,
customerId int not null,
orderDate datetime ,
orderTotalPrice float not null,
foreign key (customerId) references customer(customerId)
);
create table ordersDetail(
orderId int ,
productId int,
orderQTY int not null,
primary key(orderId,productId),
foreign key (orderId) references orders(orderId),
foreign key (productId) references product(productId)
);
