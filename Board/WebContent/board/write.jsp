<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; UTF-8">
		<title>main.jsp</title>
	</head>
	<body>
		<div align="center">
			<h2>글쓰기</h2>
			<form action="writePro.jsp">
				<table border="1">
					<tr height="40">
						<td align="center" width="150">작성자</td>
						<td width="450"><input type="text" name="writer" value="작성자"size="60"></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">제목</td>
						<td width="450"><input type="text" name="subject" size="60"></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">이메일</td>
						<td width="450"><input type="email" name="email"size="60"></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">글내용</td>
						<td width="450"><textarea name="content" rows=10 cols="50"></textarea></td>
					</tr>
					<tr height="40">
						<td align="center" width="150" colspan="2">
							<input type="submit" value="글쓰기"/>&nbsp;&nbsp;
							<input type="reset" value="다시쓰기"/> &nbsp;&nbsp;
							<input type="button" value="전체글보기" onclick="location.href='list.jsp'"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>