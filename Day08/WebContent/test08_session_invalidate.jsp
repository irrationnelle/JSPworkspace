<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test08_session_invalidate.jsp</title>
</head>
<body>
<%
	session.invalidate();
%>
세션 내장객체를 갱신하였습니다.<br>
</body>
</html>