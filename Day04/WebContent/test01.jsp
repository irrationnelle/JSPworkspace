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
		<!-- 이 밑에 있는 것들은 서버에게 전달하는 것이 아닌 단지 버튼이므로 parameter로 보낼 name이 필요 없음-->
		<input type="submit" value="Send">
		<input type="reset" value="Reset">
	</form>
</body>
</html>