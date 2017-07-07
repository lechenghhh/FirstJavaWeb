<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2017/1/5
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>JspStudy项目引导页</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        body {
            background: url("22micweb/images/bg1.jpg");
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <h3>Hello World !</h3>
            <form class="grid" action="/Test1" method="post">
                <div class="form-group">
                    <label class="sr-only">表单输入</label>
                    <input type="text" name="content" class="form-control">
                </div>
                <div class="form-group">
                    <label class="sr-only">表单输入</label>
                    <input class="btn btn-block btn-warning" type="submit" name="提交">
                </div>
            </form>
            <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=265 height=400
                    src="//music.163.com/outchain/player?type=0&id=146347979&auto=1&height=430"></iframe>

        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <a class="btn btn-block btn-success" href="01/helloworld.jsp">01/helloworld.jsp</a>
            <a class="btn btn-block btn-success" href="04/include.jsp">04/include.jsp</a>
            <a class="btn btn-block btn-success" href="05/index.jsp">05/index.jsp</a>
            <a class="btn btn-block btn-success" href="06/index.jsp">06/index.jsp</a>
            <a class="btn btn-block btn-success" href="07/register.jsp">07/register.jsp</a>
            <a class="btn btn-block btn-success" href="09/welcome.jsp">09/welcome.jsp</a>
            <a class="btn btn-block btn-success" href="10/response.jsp">10/response.jsp</a>
            <a class="btn btn-block btn-success" href="11/login.jsp">11/login.jsp</a>
            <a class="btn btn-block btn-success" href="20/login.jsp">20/login.jsp</a>
            <a class="btn btn-block btn-success" href="21upload/upload.jsp">21upload/upload.jsp</a>
            <a class="btn btn-block btn-success" href="22micweb/home.jsp">22micweb/home.jsp</a>
            <a class="btn btn-block btn-success" href="22micweb/manager.jsp">22micweb/manager.jsp</a>
            <a class="btn btn-block btn-success" href="23ajax/ajax.html">23ajax/ajax.html</a>
            <a class="btn btn-block btn-success" href="#">######</a>
        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <a class="btn btn-block btn-danger" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
            <a class="btn btn-block btn-primary" href="#">######</a>
        </div>
    </div>

</div>
</body>
</html>
