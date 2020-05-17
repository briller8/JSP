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
			//웹 어플리케이션루트에 대한 로컬상의 실제 경로를 얻는다.
			String path = application.getRealPath("/");
			BoardDAO.getInstance().filePath = path;
			System.out.println("txt파일의 위치"+path);
			
			BoardDAO.getInstance().loadData();
			BoardDAO.getInstance().sortBoard();
		%>
		<h2>메인 페이지</h2>
		<ul>
			<li><a href="write.jsp">글쓰기</a></li>
			<li><a href="list.jsp">전체 게시판 보기</a></li>
		</ul>
	</body>
</html>