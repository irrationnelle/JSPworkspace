<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<%
			//request�� ����ִ� parameter�� �ѱ��� ���� ��츦 �����
			request.setCharacterEncoding("euc-kr");
		
			String msg = request.getParameter("msg");
			String addr = request.getRemoteAddr();
			System.out.println(addr + "->msg:" + msg);
		%>
		
		����� �����Ǵ� <%=addr%> �Դϴ�. <br>
	</body>
</html>