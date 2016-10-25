<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test06_remove_attr.jsp</title>
</head>
<body>
<%
	session.removeAttribute("settingTime");
%>
세션 내장객체에 기록된 settingTime 속성을 삭제하였습니다.<br>

sessionId : <%= session.getId()%><br>

</body>
</html>