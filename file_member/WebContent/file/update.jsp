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
	<h2>User 테이블 수정</h2>
	<%
		String log = (String)session.getAttribute("log");
		User user = UserDao.instance.getUserId(log);
	%>
	<h3>회원정보</h3>
	<%= user.id %><br>
	<%= user.pw %><br>
	<form method="post" action = "updataPro.jsp">
	패스워드<input type="password" name ="passwd" maxlength="16"><br><br>
	변경할 이름 <input type="text" name ="name" maxlength ="50"><br><br>
	<input type ="submit" value="입력완료">	
	</form>
</body>
</html>