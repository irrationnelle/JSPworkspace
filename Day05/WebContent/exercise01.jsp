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
			로그인 성공입니다. <%=id%>님 반값습니다!
		<%
		} else {
			%>
			
			로그인 실패입니다!
			<% 
		}
		%>
</body>
</html>