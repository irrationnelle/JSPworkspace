<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test05_login_form.jsp</title>
</head>
<body>
	<form action='test05_login_check.jsp' method="post">
		ID : <input type="text" name="id" 
				placeholder="���⿡ ���̵� �Է��ϼ���." size=30><br>
		PW : <input type="password" name="pw"
				placeholder="********" size="30"><br>
		<input type="submit" value="Login">
	</form>
</body>
</html>