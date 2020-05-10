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
			width:50px;
			height:50px;
			margin: 3px 0;
			padding: 1em 1em;
			font-size : 14px;
		}		
	</style>
</head>
<body>
	<pre>
  # 1 to 50[2단계] : 1 to 18
  1. arr배열에 1~50 사이의 숫자를 저장한다.
  2. shuffle을 통해 숫자를 섞는다.
  3. 사용자는 1부터 순서대로 해당 위치 값을 입력한다.
  4. 정답을 맞추면 해당 값은 0으로 변경되어 모든 값이 0이되면 게임은 종료된다.	
	</pre>
	<h3>1to50 GAME</h3>
	<%		
		int[] front;
		int[] back;
		int gameNum=1;
		int idx=0;
		
		Random ran = new Random();
		
		if(request.getParameter("idx")==null){
			front = new int[25];
			back = new int[25];
		
			for(int i=0;i<front.length;i++){
				front[i] = i+1;
				back[i] = i+26;
			}
		
			// shuffle
			for(int i=0;i<1000;i++){
				int rNum = ran.nextInt(front.length);
				int temp = front[0];
				front[0] = front[rNum];
				front[rNum]  = temp;
			}
			for(int i=0;i<1000;i++){
				int rNum = ran.nextInt(back.length);
				int temp = back[0];
				back[0] = back[rNum];
				back[rNum] = temp;
			}
			
			//session 데이터 전달
			session.setAttribute("front", front);
			session.setAttribute("back", back);
			session.setAttribute("gameNum", gameNum);

		}else{
			front = (int[])session.getAttribute("front");
			back = (int[])session.getAttribute("back");
			idx = Integer.parseInt(request.getParameter("idx"));
			gameNum=(int)session.getAttribute("gameNum");
			out.println("gameNum"+ gameNum+ ": idx" +front[idx] +"<br>");
			if(gameNum<50){
				if(front[idx]==gameNum){
					if(1<=gameNum&&gameNum<=front.length){
						front[idx] = back[idx];
					}else if(front.length<gameNum&&gameNum<=50){
						front[idx] =0;
					}
					gameNum+=1;
					
					session.setAttribute("front", front);
					session.setAttribute("back", back);
					session.setAttribute("gameNum", gameNum);
				}else{
				%>
				<script>
				alert("오답입니다. 다시 클릭하세요.");
				history.go(-1);
				</script>
<%				}
			}
			else{
				 %>
			<h2>게임 오버!</h2>
			<button onclick="<%session.invalidate(); %>>location.href='1to50.jsp'">RESET</button>
			<%
			}
		}
		for(int i=0;i<front.length;i++){
	%>
			<button onclick="location.href='1to50.jsp?idx=<%=i%>'"<%if(front[i]==0){%>disable<%} %>><%=front[i] %></button>
			<%

			if((i+1)%5==0){
				out.println("<br>");
			}
		}
			%>	

</body>
</html>