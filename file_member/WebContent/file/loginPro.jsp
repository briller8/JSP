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
	<h2>로그인 처리페이지</h2>
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
				alert("로그인이 되었습니다.");
				location.herf ="main.jsp"; 
			</script>
	<%}else{ %>
		<script>
			alert("아이디와 패스워드를 확인해주세요.");
			location.herf ="login.jsp";
		</script>
	<%} %>
	
</body>
</html>