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
���� ���尴ü�� ��ϵ� settingTime �Ӽ��� �����Ͽ����ϴ�.<br>

sessionId : <%= session.getId()%><br>

</body>
</html>