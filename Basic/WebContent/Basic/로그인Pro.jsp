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
	int dbId = Integer.parseInt(request.getParameter("dbId"));
	int dbPw = Integer.parseInt(request.getParameter("dbPw"));
	int myId = Integer.parseInt(request.getParameter("id"));
	int myPw = Integer.parseInt(request.getParameter("pw"));
	String result ="";
	if(dbId == myId && dbPw == myPw){
		result = "로그인 성공";
	}
	if(dbId != myId && dbPw != myPw){
		result = "로그인 실패";
	}
	if(result.equals("")){result = "오류";}
%>
	<h2>결과 <%=result %></h2>
</body>
</html>