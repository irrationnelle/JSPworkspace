<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test03_modifyCookie.jsp</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("cookie1","BBB");
	cookie.setMaxAge(60*5);
	response.addCookie(cookie);
%>
<h2>test03_modifyCookie.jsp</h2>
cookie1번을 수정해서 발급하였습니다.<br>
수명을 5분으로 셋팅해 놓았습니다.

</body>
</html>