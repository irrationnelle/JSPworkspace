<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01.jsp</title>
</head>
<body>
	<%
		// Scriptlet: 자바 문장이 위치하는 부분(자바 문법 그대로 사용 가능)
		int n = 100;
	
		Date now = new Date();
	%>
	현재 요청이 들어온 시간은
	<!-- %= % 이건 표현식. 표현식은 html 문서에 작성하라는 이야기 -->
	<b><%= now %></b>입니다.
	n 변수에 들어있는 값: <%=n %>
</body>
</html>