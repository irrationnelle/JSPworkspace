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

�α׾ƿ��� �Ϸ�Ǿ����ϴ�.<br>
<a href="test05_login_form.jsp">�α��� �Ϸ�����</a> <br>
<a href="test05_login_status.jsp">�α��� ���º���</a>

</body>
</html>