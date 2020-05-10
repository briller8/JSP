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
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		boolean check = UserDao.instance.checkUserIdPw(id, pw);
		System.out.println(check);
		
		if(check==true){
			UserDao.instance.deleteUserId(id);
			session.removeAttribute("log");
	%>
		<script>
			alert("delete complete!");
			location.herf = "main.jsp";
		</script>
		<% 
		}else{
		%>	
			<script>
			alert("Please check your ID and pw.");
			location.href ="delete.jsp";
			</script>
		<%} %>
</body>	
</html>