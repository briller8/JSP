<%@page import="file_member.UserDao"%>
<%@page import="file_member.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>update userData</h2>
	<%
		String log = (String)session.getAttribute("log");
		User user = UserDao.instance.getUserId(log);
	%>
	<h3>userData</h3>
	ID: <%= user.id %><br>
	PW: <%= user.pw %><br>
	<form method="post" action = "updataPro.jsp">
	PW<input type="password" name ="passwd" maxlength="16"><br><br>
	RENAME <input type="text" name ="name" maxlength ="50"><br><br>
	<input type = "hidden" value=<%=user.id %> name ="id">
	<input type ="submit" value="입력완료">	
	</form>
</body>
</html>