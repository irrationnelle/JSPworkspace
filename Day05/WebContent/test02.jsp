<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		if(name==null) {
			name = "noname";
		}
	%>
	����� �̸��� <%=name%> �̱���. �ݰ����ϴ�.
</body>
</html>