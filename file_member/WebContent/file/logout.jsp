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
		session.removeAttribute("log");
		session.invalidate();
	%>
		<script>
			alert("로그아");
			location.href="main.jsp";
		</script>
</body>
</html>