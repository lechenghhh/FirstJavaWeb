<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2017/1/5
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>删除界面</title>
    <style>
        body {
            background: url("images/bg1.jpg");
        }
    </style>
</head>
<body>
<jsp:include page="is_login.jsp"/>
<jsp:useBean id="micwebservice" class="com.lecheng.service.MicWebService"></jsp:useBean>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    micwebservice.delete(id);
    out.print("<h3>删除成功！！！</h3>");
%>
<%--<a href="#" onClick="javascript :history.back(-1);">返回上一页</a>--%>
<br>
<a href="manager.jsp">返回管理界面</a>
</body>
</html>
