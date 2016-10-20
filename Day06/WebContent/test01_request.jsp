<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<%
			//request에 들어있는 parameter에 한글이 있을 경우를 고려함
			request.setCharacterEncoding("euc-kr");
		
			String msg = request.getParameter("msg");
			String addr = request.getRemoteAddr();
			System.out.println(addr + "->msg:" + msg);
		%>
		
		당신의 아이피는 <%=addr%> 입니다. <br>
	</body>
</html>