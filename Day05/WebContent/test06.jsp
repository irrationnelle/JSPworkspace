<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- errorPage는 에러가 발생했을 때 보여주는 페이지를 설정하는 page 디렉티브이다. -->
<%@ page errorPage="test06_error.jsp" %>
<html>
<head>
<title>test06.jsp</title>
</head>
<body>
	<%
		String name = request.getParameter("name").toUpperCase();
	%>
	
	<%=name%>님 반갑습니다.<br>
	이 페이지는 name parameter가 없는 경우 에러가 발생하는 페이지입니다.
</body>
</html>