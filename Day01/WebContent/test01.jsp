<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��Ŭ���� ù��° jsp</title>
</head>
<body>
	<%
		Date now = new Date();
	%>
	
	��Ŭ�������� �ۼ��� ù��° jsp ����<br>
	���� �ð�: <%=now %><br>
</body>
</html>