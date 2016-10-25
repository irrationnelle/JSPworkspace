<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_viewCookies.jsp</title>
</head>
<body>
<h2>request에 담겨온 쿠키 목록은 다음과 같습니다.</h2>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			out.println("쿠키이름:" + cookie.getName() + "<br>");
			out.println("쿠키값:" + cookie.getValue() + "<br>");
			out.println("<hr>");
		}
	}
%>
</body>
</html>