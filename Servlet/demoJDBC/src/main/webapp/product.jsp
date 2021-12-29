<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/27/2021
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <button><a href="/product?action=create">Create</a></button>
    <table style="border: 1px solid">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
        </tr>
        <c:forEach items="${products}" varStatus="loop" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td><button><a href="/product?action=edit&&index=${loop.index}">edit</a></button></td>
                <td><button><a href="/product?action=delete&&id=${p.id}">delete</a></button></td>
            </tr>
        </c:forEach>

    </table>
</body>
</html>
