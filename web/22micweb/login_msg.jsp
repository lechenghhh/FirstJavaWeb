<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2017/1/7
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆提示</title>
    <style >
        body{
            background: url("images/bg1.jpg");
        }
    </style>
    <meta http-equiv="refresh" content="2;manager.jsp">
</head>
<body>
<%
    String uname = request.getParameter("uname");
    out.println("用户名：" + uname);
    session.setAttribute("uname", uname);
    out.println("登陆成功");

%>
<h6>正在自动跳转至管理页，请等待...</h6>
<a href="manager.jsp">等不及了，直接去管理界面>>></a>
</body>
</html>
