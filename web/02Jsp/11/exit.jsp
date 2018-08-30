<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
//Lesson2:exit
<%	
	session.invalidate();
	response.setHeader("refresh", "2;URL=welcome.jsp");
	

%>