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
cookie1���� �����ؼ� �߱��Ͽ����ϴ�.<br>
������ 5������ ������ ���ҽ��ϴ�.

</body>
</html>