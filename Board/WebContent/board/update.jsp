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
		<div align="center">글 수정
			<h2>게시글 수정</h2>
			<form action="updatePro.jsp">
				<tr height="40">
					<td width="120" align="center">작성자</td>
					<td width="180" align="center"><%=board.getWriter()%></td>
					<td width="120" align="center">작성일</td>
					<td width="180" align="center"><%=board.getRegDate()%></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">제목</td>
					<td width="480" colspan="3">
						<input type="text" name="subject" value="<%=board.getSubject() %>" size="60"/>
					</td> 
				</tr>
				<tr height="40">
					<td width="120" align="center">패스워드</td>
					<td width="480" colspan="3">
						<input type="password" name="password" value="<%=board.getPassword() %>"/>
					</td> 
				</tr>
				<tr height="40">
					<td width="480" colspan="4">
						<input type="hidden" name="num" value="<%=num%>"/>
						<input type="hidden" name="ref" value="<%=board.getRef()%>"/>
						<input type="hidden" name="reStep" value="<%=board.getReStep()%>"/>
						<input type="hidden" name="reLevel" value="<%=board.getReLevel()%>"/>
						<input type="submit" value="수정내용 저장"/>
						<input type="button" value="목록보기" onclick="location.href='list.jsp'"/>
					</td> 
				</tr>

			</form>
		</div>
	</body>
</html>