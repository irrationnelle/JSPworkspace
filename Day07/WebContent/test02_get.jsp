<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_get.jsp</title>
</head>
<body>
	<%
		// test02_get.jsp 파일은 하나이고 session.getAttribute() 메소드는 한 번만 호출하지만
		// 각 브라우저가 보내는 parameter가 다르기 때문에 
		// 각 브라우저 마다 다른 parameter 값을 띄우며
		// 브라우저를 종료한 뒤 다시 test02_get.jsp에 접속하면 null 값을 _paramAttr에 저장한다.
		String _paramAttr = (String) session.getAttribute("paramAttr");
	%>
	
	현재 당신의 세션에 기록된 _paramAttr 값 : <%=_paramAttr%> <br>
</body>
</html>