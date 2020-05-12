<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<pre>
	게시판 1단계 :  페이지 번호 만들기
	</pre>
	
	<form action="BoardPro.jsp">
	<h2>한 줄 게시글</h2>
	<input type="text" name="title">
	<input type="submit" value="작성">
	</form>
	<br><br>
<%
	String[] board;
	int count;
	
	if(session.getAttribute("board")!=null){
		board = (String[])session.getAttribute("baord");
		count = board.length;
		System.out.println("count="+count);
%>
	<table>
	<tr>
	<th>글번호</th>
	<th>&nbsp;&nbsp;&nbsp;게시글 내용</th>
	</tr>
<%
	for(int i=board.length-1;i>=0;i--){
		out.println("<tr>");
		out.println("<td>"+count+"</td>");
		out.println("<td>"+board[i]+"</td>");
		out.println("</tr>");

	}
%>
	</table>
<%} %>
</body>
</html>