<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>index.jsp</title>
</head>
<body>
<a href="member.do?action=joinForm"><button>ȸ������</button></a>
<form action="member.do" method="post"></form><br>
	ID: <input type="text" name="id" size="20"><br>
	PW: <input type="password" name="password" size="20"><br>
	<input type="hidden" name="action" value="login"> <br>
	<input type="submit" value="�α���">
</form>
<hr/>
<h3>�� �κ��� �Խ����� �������� �����Դϴ�.</h3>
</body>
</html>