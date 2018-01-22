<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lesson1:session</title>
</head>
<body>
	
	session示例<br/>
	session的唯一标识符：<%= session.getId() %><br/>
	获取session的创建时间：<%= new java.util.Date (session.getCreationTime()).toString() %><br/>
	session的失效时间（s）：<%= new java.util.Date (session.getMaxInactiveInterval()).toString() %>
	<br/>
		
	
	
</body>
</html>