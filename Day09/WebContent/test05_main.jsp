<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test05_main.jsp</title>
	</head>
	
	<body>
		<%
			int num = 100;
		%>
		
		main�� include ��Ƽ�� ���� ���� <br>
		
		<%@ include file="test05_sub.jsp"%>
		
		���� ��¥ : <%= now %><br>
	</body>
</html>