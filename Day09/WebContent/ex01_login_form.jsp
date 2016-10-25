<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ex01_login_form.jsp</title>
	</head>
	
	<body>
		<form action="ex01_login_check.jsp" method="post">
			ID: <input type="text" name="id" placeholder="Input your ID" size="30"> <br>
			PW: <input type="password" name="pw" placeholder="****" size="30"> <br>
			<input type="submit" value="Login">
		</form>
	</body>
</html>