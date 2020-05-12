<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	button{
		margin:5px;
		padding:3em;
		font-size: 12px;
	}
</style>
</head>
<body>
	<pre>
	# MaxNum
	1. 가장 큰 값을 찾아 입력 
	2. 정답이면 해당 값을 0으로 변경
	3. arr의 모든 값이 0이 되면 게임 종료 
	</pre>
	
<%
	Random ran = new Random();
	int[] arr = new int[5];
	int idx;
	
	for(int i=0;i<arr.length;i++){
		arr[i]=ran.nextInt(100);
	}
	
	if(request.getParameter("idx")!=null){
		idx=Integer.parseInt(request.getParameter("idx"));
		arr=(int[])session.getAttribute("arr");
		int maxIdx=0;
		for(int i=0;i<arr.length;i++){
			if(arr[maxIdx]<arr[i]){
				maxIdx=i;
			}
		}
		if(idx==maxIdx){
			arr[idx]=0;
			session.setAttribute("arr", arr);
		}else{
			%>
			<script>
			alert("MaxNum을 찾아주세요");
			history.go(-1);
			</script>
			<%
		}
	}else{
		session.setAttribute("arr", arr);
	}
	out.println("<h2>MaxNum을 찾아보세요!</h2>");
	
	 for(int i=0;i<arr.length;i++){
		 if(arr[i]!=0){
	%>
		<button onclick="location.href='MaxNum.jsp?idx=<%=i%>'"><%=arr[i] %></button>
<%		 }
	 }
%>
</body>
</html>