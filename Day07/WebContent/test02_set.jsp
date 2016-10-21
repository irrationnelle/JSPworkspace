<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_set.jsp</title>
</head>
<body>
	<%
		// request.getParameter()의 인자인 "param"값은
		// 브라우저에서 테스트할 때 URL.jsp?param=rase 등으로 값을 보낼 수 있다.
		String _param = request.getParameter("param");
		session.setAttribute("paramAttr", _param);
	%>
	
	당신이 보낸 _param의 값을 session에 기록하였습니다.<br> 
</body>
</html>