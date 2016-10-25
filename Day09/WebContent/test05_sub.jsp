<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test05_sub.jsp</title>
	</head>
	
	<body>
		num 변수의 값 : <%=num%> <br>
		<%
			Date now = new Date();
		%>
	</body>
</html>