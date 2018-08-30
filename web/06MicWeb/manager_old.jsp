<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>微网站管理界面</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            font-size: 20px;
            color: #f1f0ee;
        }

        a {
            text-decoration: none;
        }

        body {
            background: url("images/bg1.jpg");

        }

        td {
            float: left;
            width: 200px;
            min-height: 30px;
            display: inline-block;
            width: 20%;
        }

        .clear {
            clear: both;
        }

        .box {
            margin: auto;
            /* width: 100%;
             height: 100%;
             background: #DDDDDD;*/
        }

        .div1 {
            margin-top: 6px;
            width: 100%;
            height: 48px;
            position: fixed; /*这是必须的*/
            z-index: 1;
        }

        .gridtitle {
            float: left;
            text-align: center;
            padding: 20px;
            margin: 4px 4px 0px 0px;
            min-height: 48px;
            width: 10%;
            background: #384071;
            text-align: center;
        }

        .grid {
            overflow: hidden;
            float: left;
            text-align: center;
            padding: 20px;
            margin: 16px 4px 0px 0px;
            height: 48px;
            width: 10%;
            background: #eee;
            background-color: rgba(86, 61, 124, 0.15);
            border: #ddd;
            border: rgba(86, 61, 124, 15);        }

        .grid:hover {
            min-height: 48px;
            background: #00a68e;
        }

        .add {
            text-align: center;
            padding: 20px;
            margin: 4px;
            width: 80%;
            background: #d04a63;
            height: 100px;
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
        String dbName = "microweb";
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

        ///////////////
        //确定数据集的列数，亦字段数
        int numColumns = rmeta.getColumnCount();
        // 输出每一个数据值
    %>
    <tr>
        <div class="div1">
            <td>
                <div class="gridtitle">
                    <a href="login.jsp" style="font-size: 14px">
                        用户:<%= session.getAttribute("uname")%>
                        <br>(点击此处注销)</a></div>
            </td>
            <td>
                <div class="gridtitle">标题</div>
            </td>
            <td>
                <div class="gridtitle">内容</div>
            </td>
            <td>
                <div class="gridtitle">时间</div>
            </td>
            <td>
                <div class="gridtitle">修改</div>
            </td>
            <td>
                <div class="gridtitle">删除</div>
            </td>

        </div>
    </tr>
    <br>
    <div class="clear"></div>
    <div style="margin-top: 78px;">
        <%
            while (rs.next()) {
        %>
        <tr>
            <div>
                <td>
                    <div class="grid" style="background: #d04a63"><%=rs.getString(1)%>
                    </div>
                </td>
                <td>
                    <div class="grid"><%=rs.getString(2)%>
                    </div>
                </td>
                <td><span class="grid"><%=rs.getString(3)%></span></td>
                <td>
                    <div class="grid"><%=rs.getString(4)%>
                    </div>
                </td>
                <td><a class="grid"
                       href="m_edit_add.jsp?id=<%=rs.getString(1)%>&title=<%=rs.getString(2)%>&content=<%=rs.getString(3)%>">修改</a>
                </td>
                <td><a class="grid"
                       href="m_delete.jsp?id=<%=rs.getString(1)%>">删除</a></td>
                <div class="clear"></div>
            </div>
        </tr>
    </div>
    <br>

    <%
        }
        rs.close();        //关闭
        statement.close();
        connection.close();
    %>
    <div class="add">
        <a href="m_edit_add.jsp?id=0">添加</a>
    </div>
</div>
</body>
</html>
