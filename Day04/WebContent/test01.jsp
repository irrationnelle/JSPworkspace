<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="JavaTest01" method="post">
		ID: <input type="text" name="userID" size="10"><br>
		PW: <input type="password" name="userPW" size="10"><br>
		AGE: <input type="number" name="userAge" size="10"><br>
		<!-- �� �ؿ� �ִ� �͵��� �������� �����ϴ� ���� �ƴ� ���� ��ư�̹Ƿ� parameter�� ���� name�� �ʿ� ����-->
		<input type="submit" value="Send">
		<input type="reset" value="Reset">
	</form>
</body>
</html>