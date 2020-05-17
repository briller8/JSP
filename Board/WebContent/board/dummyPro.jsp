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
			int dummyCount=Integer.parseInt(request.getParameter("dummyCount"));
			for(int i=0; i<dummyCount;i++){
				BoardDAO.getInstance().insertDummy();
			}
			response.sendRedirect("list.jsp");
		%>
	</body>
</html>