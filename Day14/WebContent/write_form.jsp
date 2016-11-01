<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_form.jsp</title>
</head>
<body>
	<form action="board.do" method="post">
		제목: <input type="text" name="title" size="20"><br>
		내용: <textarea name="content" rows="5" cols="20" placeholder="내용작성"></textarea>
		<input type="hidden" name="action" value="write">
		<input type="submit" value="작성완료">
	</form>
</body>
</html>