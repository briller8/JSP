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
	int dbId = 1234;
	int dbPw = 1111;
	%>
	
	<pre>문제
	#로그인 [1단계]
	1. Id와 Pw를 입력받는다.
	2. id와 Pw 그리고 dbId, dbPw(hidden 값으로)의 값 모두를 로그인Pro.jsp로 전달한다.
	3. 로그인Pro.jsp 에서 입력받은 데이터와 기존에 데이터를 비교해 로그인 처리를 한다.
	   예) 로그인 성공  or 로그인 실패
  		dbID = 1234;
  		dbPw = 1111;
	</pre>
	
	<h2>로그인</h2>
	<form action = "로그인Pro.jsp" >
	ID:<input type ="text" name ="id"/>
	PW:<input type="password" name ="pw"/>
	<input type="hidden" name="dbId" value ="<%=dbId %>"/>
	<input type="hidden" name="dbPw" value ="<%=dbPw %>"/>
	<input type = "submit" value ="로그인">
	</form>
</body>
</html>