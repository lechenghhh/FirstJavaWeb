<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2017/1/6
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>提示界面</title>
    <style >
        body{
            background: url("images/bg1.jpg");
        }
    </style>
</head>
<body>
<jsp:include page="is_login.jsp"/>
<jsp:useBean id="micwebservice" class="com.lecheng.service.MicWebService"/>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
//    out.print(request.getParameter("id"));
    if (request.getParameter("id").equals("0")) {
        if (micwebservice.add(title, content)) {
            out.print("<h3>添加成功title</h3>" + content);
        } else {
            out.print("<h3>添加失败，请返回重试！</h3>");
        }
    } else {
        if (micwebservice.updateById(id, title, content))
            out.print("<h3>修改成功！！！</h3>");
        else
            out.print("<h3>修改失败！！！</h3>");
    }
%>
<a href="manager.jsp">返回管理界面</a>
</body>
</html>
