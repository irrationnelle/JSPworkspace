<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01_makeCookie.jsp</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("cookie1","AAA");
	response.addCookie(cookie);
%>
<h2>test01_makeCookie.jsp</h2>
<h3>��Ű�� �߱޵Ǿ����ϴ�.</h3>
</body>
</html>