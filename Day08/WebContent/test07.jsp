<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<html>
<head>
<title>test07.jsp</title>
</head>
<body>
<%
	SimpleDateFormat formatter = 
		new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date time = new Date();
%>
����ð� : <%=time %><br>

���� ID : <%=session.getId()%><br>
<!-- -------------------- -->
<%
	time.setTime(session.getCreationTime());
%>
���ǻ����ð� : <%= formatter.format(time)%><br>
<!-- -------------------- -->
<%
	time.setTime(session.getLastAccessedTime());
%>
������ ���������� ������ �ð� <%= formatter.format(time)%><br>
</body>
</html>



