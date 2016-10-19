<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage = "true" %>
<html>
<head>
<title>exercise01.jsp 예외 발생</title>
</head>
<body>
	예외가 발생하였습니다. 관리자에게 문의 바랍니다.<br>
	예외 종류: <%=exception.getClass() %> <br>
	예외 메세지 : <%=exception.getMessage()%> <br>
</body>
</html>