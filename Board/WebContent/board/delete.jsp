<%@page import="board.BoardDAO"%>
<%@page import="board.Board"%>
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
			int num = Integer.parseInt(request.getParameter("num"));
			Board board = BoardDAO.getInstance().getOneUpdateBoard(num);
		%>
		<div align="center">
			<h2>게시글 삭제</h2>
			<form method="post" action="deletePro.jsp">
				<table border="1">
					<tr height="40">
						<td width="120" align="center">작성자</td>
						<td width="180" align="center"><%=board.getWriter() %></td>
 					</tr>
					<tr height="40">
						<td width="120" align="center">제목</td>
						<td colspan="3" align="center"><%=board.getSubject() %></td>
 					</tr>
					<tr height="40">
						<td width="120" align="center">패스워드</td>
						<td colspan="4" align="center">
							<input type="password" name="password" size="60"/>
						</td>
 					</tr>
					<tr height="40">
						<td colspan="4" align="center">
							<input type="hidden" name="num" value="<%=num%>"/>
							<input type="submit" value="글삭제"/>
							<input type="button" value="목록보기" onclick="location.href='list.jsp'"/>							
						</td>
 					</tr> 					
				</table>
			</form>
		</div>
	</body>
</html>