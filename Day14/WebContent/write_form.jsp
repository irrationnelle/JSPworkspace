<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_form.jsp</title>
</head>
<body>
	<form action="board.do" method="post">
		����: <input type="text" name="title" size="20"><br>
		����: <textarea name="content" rows="5" cols="20" placeholder="�����ۼ�"></textarea>
		<input type="hidden" name="action" value="write">
		<input type="submit" value="�ۼ��Ϸ�">
	</form>
</body>
</html>