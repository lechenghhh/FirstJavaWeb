<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	//Lesson:2 do_login
	String name = request.getParameter("userName");
	String pw = request.getParameter("passWord");
	if(name!=null&pw!=null){
		session.setAttribute("userName", "name");
		response.setHeader("refresh", "2;URL=welcome.jsp");
	}
	
	
%>	