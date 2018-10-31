<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆界面</title>
</head>
<body>
	这是登陆页面
	<%
	String userName = request.getParameter("userName");	
	String passWord = request.getParameter("passWord");	
	out.println("<br/>账号是:"+userName + "<br/>密码是:" + passWord );
	
%>
</body>
</html>