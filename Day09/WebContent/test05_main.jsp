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
		
		main의 include 디렉티브 이전 내용 <br>
		
		<%@ include file="test05_sub.jsp"%>
		
		오늘 날짜 : <%= now %><br>
	</body>
</html>