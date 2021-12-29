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

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Sửa sản phẩm </h2>
        </div>
        <div class="panel-body">
            <form action="/login?action=edit" method="post">
            <div class="form-group">
                <label for="usr">ID:</label>
                <input type="text" class="form-control" id="usr" name="id">
            </div>
            <div class="form-group">
                <label for="email">Tên sản phẩm:</label>
                <input  type="text" class="form-control" id="email" name="productName">
            </div>
            <div class="form-group">
                <label for="img">Link IMG:</label>
                <input type="text" class="form-control" id="img" name="img">
            </div>
            <button class="btn btn-success">Register</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
