<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传页面</title>
</head>
<body>
<form action="/Upload" method="post" enctype="multipart/form-data">
    轻输入文件名：<br>
    <input type="text" name="filename"><br>
    <input type="file" name="file"><br>
    <input type="submit" value="submit"><br>


</form>
</body>
</html>