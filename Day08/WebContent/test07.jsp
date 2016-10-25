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
현재시간 : <%=time %><br>

세션 ID : <%=session.getId()%><br>
<!-- -------------------- -->
<%
	time.setTime(session.getCreationTime());
%>
세션생성시간 : <%= formatter.format(time)%><br>
<!-- -------------------- -->
<%
	time.setTime(session.getLastAccessedTime());
%>
이전에 마지막으로 접근한 시간 <%= formatter.format(time)%><br>
</body>
</html>



