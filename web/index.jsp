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
            background: url("static/bg.jpg");
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
            <a class="btn btn-block btn-success" href="50JspStudy/01/helloworld.jsp">50JspStudy/01/helloworld.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/04/include.jsp">50JspStudy/04/include.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/05/forward.jsp">50JspStudy/05/index.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/06/index.jsp">50JspStudy/06/index.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/07/register.jsp">50JspStudy/07/register.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/09/welcome.jsp">50JspStudy/09/welcome.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/10/response.jsp">50JspStudy/10/response.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/11/login.jsp">50JspStudy/11/login.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/20/login.jsp">50JspStudy/20/login.jsp</a>
            <a class="btn btn-block btn-success" href="50JspStudy/21upload/image.html">50JspStudy/21upload/image</a>
            <a class="btn btn-block btn-primary" href="50JspStudy/30FileManager/filemanager.jsp">文件管理</a>
            <a class="btn btn-block btn-success" href="51MicWeb/home.jsp">06MicWeb/home.jsp</a>
            <a class="btn btn-block btn-success" href="51MicWeb/manager.jsp">06MicWeb/manager.jsp</a>
            <a class=" btn btn-block btn-success" href="53WeiXin/getOpenid.jsp">getOpenid</a>
            <a class="btn btn-block btn-danger" href="54VerifyCode/verify.jsp">验证码生成/验证</a>
            <a class="btn btn-block btn-success" href="#">######</a>
            <a class="btn btn-block btn-success" href="#">######</a>
            <a class="btn btn-block btn-success" href="#">######</a>
            <a class="btn btn-block btn-success" href="#">######</a>
        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <a class="btn btn-block btn-primary" href="FileList">imgList</a>
            <a href="CrossAccessImg?imgUrl=https://img3.doubanio.com/view/status/m/public/d8b5d0528d4d100.webp"
               class="btn btn-block btn-primary">跨域访问图片</a>
            <a class="btn btn-block btn-primary" href="04ThreeJS/test7.html">ThreeJs发光小球</a>
            <a class="btn btn-block btn-danger" href="03GetLocation/check-in.html">打卡签到功能</a>
            <a class="btn btn-block btn-primary" href="08Weditor/edit.html">wangEditor</a>
            <a class="btn btn-block btn-success" href="01jquery/ajax/test1.html">03ajax/ajax.html</a>
            <a class="btn btn-block btn-success" href="01jquery/jquery.html">jquery.html</a>
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
