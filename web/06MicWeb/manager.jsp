<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>微网站管理界面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        * {
            padding: 0;
            margin: 0;
            font-size: 18px;
            color: #f1f0ee;
        }

        a {
            text-decoration: none;
            color: #e1c817;
            display: block;
            height: 100%;
            display: inline-table;
            width: 100%;
        }

        body {
            margin-top: 16px;
            background: url("images/bg1.jpg");

        }

        [class*="col-"] {
            padding-top: 15px;
            padding-bottom: 15px;
            margin-left: 4px;
            margin-top: 4px;
            background: #eee;
            background-color: rgba(86, 61, 124, 0.25);
            border: #ddd;
            border: rgba(86, 61, 124, 15);
            /* */
            margin-bottom: -99999px;
            padding-bottom: 99999px;
        }

        .row {
            overflow: hidden;
        }

        [class*="col-"]:hover {
            background: rgb(43, 43, 54);
        }

        .div1 {
            position: fixed; /*这是必须的*/
            z-index: 1;
        }


    </style>
</head>
<body>
<jsp:include page="is_login.jsp"/>
<jsp:useBean id="hello" class="com.lecheng.service.MicWebService"/>
<% hello.findAll();%>

<div class="box">
    <%
        //驱动程序名
        String driverName = "com.mysql.jdbc.Driver";
        //数据库用户名
        String userName = "root";
        //密码
        String userPasswd = "123456";
        //数据库名
        String dbName = "other_db";
        //表名
        //String tableName = "student";
        String tableName = "news";
        //联结字符串
        String url = "jdbc:mysql://localhost/" + dbName + "?user="
                + userName + "&password=" + userPasswd;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();
        String sql = "SELECT * FROM " + tableName;
        ResultSet rs = statement.executeQuery(sql);
        //获得数据结果集合
        ResultSetMetaData rmeta = rs.getMetaData();
        //确定数据集的列数，亦字段数
        int numColumns = rmeta.getColumnCount();
    %>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1"><a href="login.jsp" style="font-size: 14px">
            用户:<br><%= session.getAttribute("uname")%>
            <br>(点击注销)</a>
        </div>
        <div class="col-md-2">标题</div>
        <div class="col-md-3">内容</div>
        <div class="col-md-2">时间</div>
        <div class="col-md-1">修改</div>
        <div class="col-md-1">删除</div>
    </div>
    <%
        while (rs.next()) {
    %>
    <div class="row">
        <div class="col-md-1"><%=rs.getString(1)%>
        </div>
        <div class="col-md-2"><%=rs.getString(2)%>
        </div>
        <div class="col-md-3"><%=rs.getString(3)%>
        </div>
        <div class="col-md-2"><%=rs.getString(4)%>
        </div>
        <div class="col-md-1"><a class="grid"
                                 href="m_edit_add.jsp?id=<%=rs.getString(1)%>&title=<%=rs.getString(2)%>&content=<%=rs.getString(3)%>">修改</a>
        </div>
        <div class="col-md-1"><a class="grid"
                                 href="m_delete.jsp?id=<%=rs.getString(1)%>">删除</a></div>
    </div>
    <%
        }
        rs.close();        //关闭
        statement.close();
        connection.close();
    %>
    <div class="row">
        <div class="col-md-10"><a href="m_edit_add.jsp?id=0">添加</a>
        </div>
    </div>
    <%--<a href="m_edit_add.jsp?id=0" class="btn btn-block btn-primary">添加</a>--%>
    <br>
</div>

<%--<form action="" method="post">
    <input name="uname">
    <input name="pwd">
</form>--%>
</body>
</html>
