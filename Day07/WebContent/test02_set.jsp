<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_set.jsp</title>
</head>
<body>
	<%
		// request.getParameter()�� ������ "param"����
		// ���������� �׽�Ʈ�� �� URL.jsp?param=rase ������ ���� ���� �� �ִ�.
		String _param = request.getParameter("param");
		session.setAttribute("paramAttr", _param);
	%>
	
	����� ���� _param�� ���� session�� ����Ͽ����ϴ�.<br> 
</body>
</html>