<%@page import="file_member.User"%>
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
	<%= request.getParameter("id") %>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		System.out.println("id");
		System.out.println("passwd");
		System.out.println("name");
		boolean check = UserDao.instance.checkUserIdPw(id, pw);
		if(check==true){
			User user = UserDao.instance.getUserId(id);
			user.id = id;
			user.pw = pw;
			user.name = name;
			UserDao.instance.updateUser(user);
	%>
			<script>
				alert("Update complete!");
				location.href="main.jsp";
			</script>
	<%
		}else{
		%>
		<script>
			alert("Please check your ID and pw.");
			location.href ="update.jsp";
		</script>
		<%} %>
</body>
</html>