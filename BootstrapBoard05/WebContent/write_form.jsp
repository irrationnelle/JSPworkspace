<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_form.jsp</title>
</head>
<body>
<form action="board.do?action=write" method="post">
	<table>
		<tr>
			<td>글제목:</td>
			<td><input type="text" name="title" size="30"></td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td><input type="text" name="writer" size="30"></td>
		</tr>
		<tr>
			<td>비밀번호:</td>
			<td><input type="password" name="password" size="30"></td>
		</tr>
		<tr>
			<td>글내용:</td>
			<td>
				<textarea name="content" rows="15" cols="30" placeholder="여기에 내용을 입력하세요"></textarea>
			</td>
		</tr>
	</table>
	<button type="submit">작성완료</button>
</form>
</body>
</html>