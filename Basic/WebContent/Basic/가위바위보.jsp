<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	#가위 바위 보 게임 [1단계]
	1. com 은 '바위'만 낼 수 있다.
	2. me에게 가위 바위 보 중 한개의 값을 입력받는다. 값을 가위바위보Pro.jsp 파일로 넘긴다.
	3. com과 me를 비교해 1) 비겼다. 2) 내가 이겼다. 3) 내가 졌다.를 가위바위보Pro.jsp에서 출력한다.
	</pre>
	<%
		String com = "바위";
	%>
	<form action="가위바위보Pro.jsp">
		가위 바위 보 중에 하나의 값을 입력 :
		<input type = "text" name ="input"/>
		<input type = "hidden" name = "com" value = "<%=com %>" />
		<input type = "submit" value = "확인" />
	</form>
</body>
</html>