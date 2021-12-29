<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/23/2021
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <img src="images/thegioididong.png" alt="" width="50" height="50">
    <h1 class="btn btn-primary">Nguyên Duy</h1>
    <h1>Danh sách sản phẩm</h1>
    <p>Chào mừng bạn đến với thiên đường điện thoại</p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
        </ul>
    </div>
</nav>
<div class="col-sm-12">
    <a href="login?action=create" class="btn btn-success">Create</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Tên</th>
            <th>Hình ảnh</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="p" items="${products}" varStatus="loop">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td><img src="${p.img}" height="250" width="300"></td>
                <td><a href="login?action=edit&&index=${loop.index}" class="btn btn-warning">Edit</a></td>
                <td><a href="login?action=delete&&id=${p.id}" class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>
