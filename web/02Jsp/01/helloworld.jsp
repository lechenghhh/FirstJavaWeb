<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link type="text/css" rel="stylesheet" href="style1.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HelloWorld</title>
</head>
<body>
<div class="navi">
    <div class="box">
        <span class="icon"></span>
        <div class="title">
            <ul>
                <li><a href="#"><% String str = "HelloWorld";
                    out.println(str);%>
                </a></li>
                <li><a href="#">cool</a></li>
                <li><a href="#">cool</a></li>
                <li><a href="#">cool</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>