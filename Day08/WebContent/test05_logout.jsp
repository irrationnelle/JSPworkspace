<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test05_logout.jsp</title>
</head>
<body>
<%
	Cookie logoutCookie = new Cookie("loginId","");
	logoutCookie.setMaxAge(0);
	response.addCookie(logoutCookie);
%>

로그아웃이 완료되었습니다.<br>
<a href="test05_login_form.jsp">로그인 하러가기</a> <br>
<a href="test05_login_status.jsp">로그인 상태보기</a>

</body>
</html>