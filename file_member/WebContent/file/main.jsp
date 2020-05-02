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
	<h2>메인페이지</h2>
	<%
		UserDao.instance.realpath = application.getRealPath("");
		UserDao.instance.loadData();
		String log = (String) session.getAttribute("log");
		if(log!=null){ %>
			
			<p><%=log%>님 환영합니다.</p>
			 <p><a href = "logout.jsp">로그아웃</a></p>
			 <p><a href = "update.jsp">회원정보수정</a></p>
 			 <p><a href = "delete.jsp">회원탈퇴</a></p>
	<%}else if(log==null){
	%>
	 <p><a href = "join.jsp">회원가입</a></p>
	 <p><a href = "login.jsp">로그인</a></p>
	<%} %>
</body>
</html>