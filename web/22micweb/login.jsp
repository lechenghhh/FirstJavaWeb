<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }


    </script>
    <meta name="keywords"
          content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates"/>
    <link href="../22micweb/css/style.css" rel='stylesheet' type='text/css'/>

    <script src="/jquery-2.1.1.min.js"></script>
</head>
<body>
<script>
    $(document).ready(function (c) {
        $('.close').on('click', function (c) {
            $('.login-form').fadeOut('slow', function (c) {
                $('.login-form').remove();
            });
        });
    });
</script>
<% session.removeAttribute("uname");%>
<!--SIGN UP-->
<%--<h1>请输入账号密码登陆</h1>--%>
<div class="login-form">
    <div class="close"></div>
    <div class="head-info">
        <label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
            class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar">
        <img src="../22micweb/images/avtar.png"/>
    </div>
    <form action="login_msg.jsp" method="post">
        <input type="text" class="text" value="请输入账号" name="uname"
               onfocus="this.value = '';"
               onblur="if (this.value == '') {this.value = 'Username';}">
        <div class="key">
            <input type="password" value="Password" onfocus="this.value = '';"
                   name="upwd"
                   onblur="if (this.value == '') {this.value = 'Password';}">
        </div>
        <div class="signin">
            <input type="submit" value="登  陆">
        </div>
    </form>

</div>
<div class="copy-rights">
    <p>
        Copyright &copy; 2015.Company name All rights reserved.<a
            target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
    </p>
</div>

</body>
</html>