<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息处理</title>
</head>
<body>
<jsp:useBean id="user" class="com.lecheng.bean.UserEntity"></jsp:useBean>
<jsp:setProperty property="userName" name="user"/>
<jsp:setProperty property="passWord" name="user"/>
<%
	String uid = request.getParameter("userName");
	String pw = request.getParameter("passWord");
	out.println("接收到的账号是：<br/>"+uid+
			"<br/>密码是：<br/>"+ pw);

%>	
<br/>账号2：
<jsp:getProperty property="userName" name="user"/>
<br/>密码2：
<jsp:getProperty property="passWord" name="user"/>
</body>
</html>