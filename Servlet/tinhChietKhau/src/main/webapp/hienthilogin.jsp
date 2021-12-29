<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 12/23/2021
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
   String uname =  request.getParameter("uname");
   String pas =  request.getParameter("pswd");

%>
<h1>Hello <%=uname%></h1>
<h1>Pass là  <%=pas%></h1>

</body>
</html>
