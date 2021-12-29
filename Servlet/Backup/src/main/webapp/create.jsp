<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/24/2021
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/23/2021
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registation Form * Form Tutorial</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Tạo sản phẩm </h2>
        </div>
        <div class="panel-body">
            <form action="/create" method="post">
                <div class="form-group">
                    <label >ID:</label>
                    <input  type="text" class="form-control" name="id">
                </div>
                <div class="form-group">
                    <label>Tên sản phẩm:</label>
                    <input  type="text" class="form-control"  name="productName">
                </div>
                <div class="form-group">
                    <label >Link IMG:</label>
                    <input type="text" class="form-control" name="img">
                </div>
                <button class="btn btn-success" >Register</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
