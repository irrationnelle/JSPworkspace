<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_viewCookies.jsp</title>
</head>
<body>
<h2>request�� ��ܿ� ��Ű ����� ������ �����ϴ�.</h2>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			out.println("��Ű�̸�:" + cookie.getName() + "<br>");
			out.println("��Ű��:" + cookie.getValue() + "<br>");
			out.println("<hr>");
		}
	}
%>
</body>
</html>