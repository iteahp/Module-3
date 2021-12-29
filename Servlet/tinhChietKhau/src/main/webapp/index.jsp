<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/22/2021
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Tính tỷ lệ triết khấu</title>
  </head>
  <body>

    <form action="form" method="post">
      <label>Mô tả: </label><br/>
      <input type="text" name="mota" placeholder="Mô tả" /><br/>
      <label>Giá niêm yết: </label><br/>
      <input type="text" name="gianiemyet" placeholder="0000"/><br/>
      <label>Tỷ lệ chiếu khấu: </label><br/>
      <input type="text" name="tylechietkhau" placeholder="0.000"/><br/>
      <input type = "submit" id = "submit" value = "Tính tiền"/>
    </form>
    <br>
    <br>
    <a href="formlogin.jsp">Chuyển sang form loggin</a>


  </body>
</html>
