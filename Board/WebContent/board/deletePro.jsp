<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; UTF-8">
		<title>main.jsp</title>
	</head>
	<body>
		<%
			int num=Integer.parseInt(request.getParameter("num"));
			String password=request.getParameter("password");
			
			boolean check = BoardDAO.getInstance().checkPassword(num, password);
			if(check){
				BoardDAO.getInstance().deleteBaord(num);
				response.sendRedirect("list.jsp");
			}else{
		%>
				<script>
					alert("비밀번호를 확인해주세요.");
					history.go(-1);
				</script>
		<%				
			}
		%>
	</body>
</html>