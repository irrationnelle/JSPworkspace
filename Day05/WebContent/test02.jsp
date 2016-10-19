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
	당신의 이름은 <%=name%> 이군요. 반갑습니다.
</body>
</html>