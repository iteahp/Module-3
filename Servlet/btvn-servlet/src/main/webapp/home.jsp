<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Báo việt nam net</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">


</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Báo VIỆT NAM NET</h1>
    <p>Vì Việt Nam hùng cường</p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="/demo">Trang chủ </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">CHính trị</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Thời sự</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Kinh doanh</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container" style="margin-top:30px">
    <table>
        <c:forEach var="n" items="${news}">
            <tr>
                <td><a href="/demo?action=${n.id}"> <img src="${n.img}" alt="" width="240" height="160"></a> </td>z`
                <td>
                    <tr>
                        <th><a href="demo?action=${n.id}">${n.tittle}</a></th></tr>
                    <tr> <td>${n.content}</td></tr>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Footer</p>
</div>

</body>
</html>
