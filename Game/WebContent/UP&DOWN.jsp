<%@page import="java.util.Random"%>
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
 # Up & Down 게임[1단계]
  1. com은 8이다.
  2. me는 com의 숫자를 맞추는 게임이다.
  3. 다음과 같은 메세지를 출력한다.
  1) me < com	: Up!
  2) me == com : Bingo!
  3) me > com  : Down!
  4. 정답을 맞추면 게임은 종료된다.
	</pre>
<%
	Random ran = new Random();
	int com = 8;
	int myNum;
	
	if(request.getParameter("myNum")!=null){
		myNum=Integer.parseInt(request.getParameter("myNum"));
	}else{
		myNum=ran.nextInt(10)+1;
	}
	
	if(com!=myNum){
		String result="";
		if(myNum<com){result="UP!";}else{result="DOWN";}
%>
		<h3>My Number : <%=myNum %> <%=result %></h3>
		<button onclick="location.href='UP&DOWN.jsp?myNum=<%=myNum+1%>'">UP</button>
		<button onclick="location.href='UP&DOWN.jsp?myNum=<%=myNum-1%>'">DOWN</button>

<% 	}else{
	%>
		<h2>BINGO!!</h2>
		<button onclick="location.href='UP&DOWN.jsp'">RESET</button>
	<%} %>

</body>
</html>