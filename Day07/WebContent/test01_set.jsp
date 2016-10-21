<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01_set.jsp</title>
</head>
<body>
	<%
		// application 객체는 Tomcat이 시작되서 종료될 때까지 유지되기 때문에
		// application 객체에 보낸 정보 또한 마찬가지로 그렇게 유지된다.
		application.setAttribute("attr1", new Date());
		application.setAttribute("attr2", "rase");
	%>
	현재 서블릿은 요청을 받았을 때<br>
	application 기본 객체에 attr1, attr2 두 개의 속성을<br>
	등록하였습니다.<br>
</body>
</html>