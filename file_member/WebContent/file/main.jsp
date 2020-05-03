<%@page import="file_member.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>main page</h2>
	<%
		UserDao.instance.realpath = application.getRealPath("");
		System.out.println("main.jsp = " + UserDao.instance.realpath);
		UserDao.instance.loadData();
		String log = (String)session.getAttribute("log");
		if(log!=null){
			%>
			<p><a href="logout.jsp">logout</a></p>
			<p><a href="update.jsp">update data</a></p>
			<p><a href="delete.jsp">delete</a></p>
		<%}else{ %>
			<p><a href="join.jsp">join</a></p>
			<p><a href="login.jsp">login</a></p>		
		<%}%>
</body>
</html>