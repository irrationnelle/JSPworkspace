<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage="exercise01_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>exercise01.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id.equals("rase") && pw.equals("1234")) {
			%>
			�α��� �����Դϴ�. <%=id%>�� �ݰ����ϴ�!
		<%
		} else {
			%>
			
			�α��� �����Դϴ�!
			<% 
		}
		%>
</body>
</html>