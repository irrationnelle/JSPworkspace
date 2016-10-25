<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test04_deleteCookie.jsp</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("cookie1","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<h2>test04_deleteCookie.jsp</h2>
cookie1을 삭제했습니다.

</body>
</html>