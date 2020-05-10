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
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<h2>login</h2>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean check = UserDao.instance.checkUserIdPw(id, pw);
	%>
	<%
		if(check){
			session.setAttribute("log", id);
			session.setMaxInactiveInterval(1*60);
	%>	
			<script>
				alert("Login complete. Welcome!");
				location.href ="main.jsp"; 
			</script>
	<%}else{ %>
		<script>
			alert("Please check your ID and pw.");
			location.href ="login.jsp";
		</script>
	<%} %>
	
</body>
</html>