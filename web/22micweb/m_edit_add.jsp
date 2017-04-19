<%@page import="com.lecheng.bean.News" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../22micweb/css/style.css" rel='stylesheet' type='text/css'/>
<head>
    <style>
        * {
            font-size: 28px;
            color: #fff;
        }

        input {
            width: 90%;
            margin: 10px;
        }

        .div1 {
            padding-top: 32px;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            border-radius: 20px;
            background: #2b2b36;
            text-align: center;
            width: 60%;
            height: 90%;
        }


    </style>
    <title>添加/修改界面</title>
</head>
<body>
<jsp:include page="is_login.jsp"/>
<% request.setCharacterEncoding("UTF-8");%>
<div class="div1">
    <span>添加修改管理界面</span>
    <span>/ id=<%=request.getParameter("id")%></span>
    <form action="m_msg.jsp" method="post">
        <input type="text" name="title"
               value="<%= request.getParameter("title")%>"><br>
        <input type="text" name="content" style="height: 180px"
               value="<%= request.getParameter("content")%>"><br>
        <input hidden type="text" name="id"
               value="<%= request.getParameter("id")%>"><br>
        <%--new String(request.getParameter("content").getBytes("ISO-8859-1"), "UTF-8")--%>
        <input type="submit" name="添加/修改">
    </form>
</div>
</body>
</html>