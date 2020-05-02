<%@page import="file_member.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<%
		request.setCharacterEncoding("uth-8");
	%>
	<%
		User user = new User();
		user.id = request.getParameter("id");
		user.pw = request.getParameter("pw");
		user.name = request.getParameter("name");
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
		user.reg_date = sdf.format(d);
		boolean idCheck = UserDao.instance.checkUserId(user);
		
		if(idCheck==true){%>
			<script>
				alert("중복아이디 입니다.");
				location.href = "join.jsp";
			</script>
		<%
		}else{
			userDao.instance.insertUser(user);
	%>
		<script>
			alert("회원가입을 축하합니다.");
			location.href ="main.jsp";
		</script>
</body>
</html>