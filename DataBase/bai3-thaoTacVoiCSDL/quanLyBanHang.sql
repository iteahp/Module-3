
select  c.cName,p.pName from Customer c join Orders o on c.cID = o.cId
join orderdetail od on o.oId = od.oId join product p on od.pID = p.pID;


select  o.oID,o.oDate,(od.odQTy*p.pPrice)as TongTienDonHang from Customer c join Orders o on c.cID = o.cId
join orderdetail od on o.oId = od.oId join product p on od.pID = p.pID;

select  o.oID,o.oDate,o.oTotalPrice from Customer c join Orders o on c.cID = o.cId
join orderdetail od on o.oId = od.oId join product p on od.pID = p.pID
having o.oTotalPrice = od.odQTy * p.pPrice;


select  c.cName from Customer c  left join Orders o on c.cID = o.cId where c.cid not in(select o.cid from orders o);



