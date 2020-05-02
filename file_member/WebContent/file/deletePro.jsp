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
		String passwd = request.getParameter("passwd");
		boolean check = UserDao.instance.checkUserIdPw(id, passwd);
		System.out.println(check);
		
		if(check==true){
			UserDao.instance.deleteUser(id);
			session.removeAttribute("log");
	%>
		<script>
			alert("탈퇴가 완료되었습니다.");
			location.herf = "main.jsp";
		</script>
		<% 
		}else{
		%>	
			<script>
				alert("아이디와 비밀번호를 확인하세요.");
			</script>
		<%} %>
</body>	
</html>