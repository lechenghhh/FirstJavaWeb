<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Servlet1-登陆界面</title>
    <script src="../22microweb/jquery-2.1.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $.ajax({
                    //提交数据的类型 POST GET
                    type: "POST",
                    //提交的网址
                    url: "http://tctu.cn/mapi.php?c=area",
                    //提交的数据
                    data: {token: "sanmao"},
                    //返回数据的格式
                    datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
                    //在请求之前调用的函数
                    beforeSend: function () {
                        $("#msg").html("logining");
                    },
                    //成功返回之后调用的函数
                    success: function (data) {
                        $("#msg").html(decodeURI(data));
                    },
                    //调用执行后调用的函数
                    complete: function (XMLHttpRequest, textStatus) {
                        alert(XMLHttpRequest.responseText);
                        alert(textStatus);
                        //HideLoading();
                    },
                    //调用出错执行的函数
                    error: function () {
                        //请求出错处理
                    }
                });
            });
        });
    </script>
    <style>
        {
            padding: 0
        ;
            margin: 0
        ;
        }
        .navi {
            background: #000;
        }

        .icon {
            background: #000 no-repeat center center;
            width: 134px;
            height: 50px;
            margin: 20px;
            margin-left: 10%;
            display: inline-block;
        }

        .title {
            width: 999px;
            height: 90px;
            display: inline-block;
        }

        .title li {
            float: left;
            list-style: none;
        }

        .box a {
            height: 32px;
            display: block;
            margin: 32px 36px;
            font-size: 18px;
            text-decoration: none;
            color: #eeeeee;
        }

        .box .title li:hover {
            background: #333;
        }

        /* -------------------以上都是摆设------------------- */
        .lc-form {
            padding: 30px;
            background: rgba(16, 169, 2, 0.69);
            color: #d6e9ee;
            font-size: 28px;
            text-align: center;
        }

        .lc-input {
            width: 240px;
            margin: 12px;
            background: rgba(166, 201, 210, 0.52);
            color: #d6e9ee;
            font-size: 28px;
            text-align: center;
        }

        input {
            background: #333;
            readonly: readonly;
            border: #00c4ff;
            font-size: 28px;
            color: #d6e9ee;
            padding: 6px;
            width: 160px;
            margin-top: 12px;
        }

        input:hover {
            background: #888;
        }
    </style>
</head>
<body>
<div class="navi">
    <div class="box">
        <span class="icon"></span>
        <div class="title">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="#">职业课程</a></li>
                <li><a href="#">技术问答</a></li>
                <li><a href="#">VIP会员</a></li>
            </ul>
        </div>
    </div>
</div>

<form class="lc-form" action="/LoginServlet" method="post">
    <!-- action的值指向web.xml的<url-pattern> 对应的值 -->
    账号: <input class="lc-input" type="text" name="uname"/> <br/>
    密码: <input class="lc-input" type="password" name="upwd"/> <br/>
    <input class="lc-btn" type="submit" value="登陆"/>
    <input class="lc-btn" type="reset" value="重置"/>
</form>
<% System.out.println(request.getContextPath() + "-HelloJSPProject");%>


<br>
<br>
<br>
<br>


<br>
<br>
<br>
<br> 文件上传案例>>> //暂不可用

</body>
</html>