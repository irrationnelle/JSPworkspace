<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>JSP</title>
</head>
<body>
	<form method="post" action="04_testLogin.jsp">
		<label for="userID"> ���̵� : </label>
		<input type="text" name="id" id="userID"><br>
		
		<label for="userPW"> ��ȣ: </label>
		<input type="password" name="pw" id="userPW"><br>
		
		<input type="submit" value="Login">
	</form>
</body>
</html>