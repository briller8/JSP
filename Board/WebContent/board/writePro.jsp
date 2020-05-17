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
			request.setCharacterEncoding("utf-8");
		%>
		
		<jsp:useBean id="board" class="board.Board">
			<jsp:setProperty name="board" property="*"/>
		</jsp:useBean>
		<%
			BoardDAO.getInstance().insertBoard(board);
			response.sendRedirect("list.jsp");
		%>
	</body>
</html>