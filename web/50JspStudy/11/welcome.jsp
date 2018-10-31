<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lesson2:welcome</title>
</head>
<body>
	
	<%if(session.getAttribute("userName")!=null){%>
	欢迎：<%= session.getAttribute("userName") %>
		<a href="login.jsp">注销</a>
		<br/>
	<%}else{%>
		请先登陆
		<a href="login.jsp">登陆</a>
	<%}	%>
	<%if(session.isNew()){	%>
		<br/>
		欢迎新用户！
	<%}else{ %>
		欢迎老用户!
	<%}	%>
</body>
</html>