<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/27/2021
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=create" method="post">

        <input type="text" name="id" placeholder="id"> <br>
        <input type="text" name="name" placeholder="name"><br>
        <input type="text" name="price" placeholder="price"><br>
       <input type="submit" value="Create">
</form>

</body>
</html>
