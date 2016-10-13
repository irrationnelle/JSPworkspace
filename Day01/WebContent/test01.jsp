<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이클립스 첫번째 jsp</title>
</head>
<body>
	<%
		Date now = new Date();
	%>
	
	이클립스에서 작성한 첫번째 jsp 파일<br>
	현재 시각: <%=now %><br>
</body>
</html>