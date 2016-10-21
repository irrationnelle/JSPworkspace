<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01_get.jsp</title>
</head>
<body>
	<%
		Enumeration<String> attrNames = application.getAttributeNames();
		while(attrNames.hasMoreElements()) {
			String attrName = attrNames.nextElement();
			out.println("Attribute Name: "+attrName+"<br>");
			out.println("Attribute Value: "+application.getAttribute(attrName)+"<br>");
			out.println("<hr>");
		}
	%>
</body>
</html>