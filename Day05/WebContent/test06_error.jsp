<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �� �������� ������ �߻����� ���� �����ִ� �������̱� ������ 
	 page ��Ƽ�꿡 isErrorPage�� true�� ���ش�. �̷��� �ϸ� Exception ��ü�� �������� ��� ����.
	 �ڹٷ� ������ try-catch���� ������ ������ �Ѵٰ� �� �� �ִ�.
	 url â������ test06_error.jsp�� �ƴ� test06.jsp�θ� ���. -->
<%@ page isErrorPage="true" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	���ܰ� �߻��Ͽ����ϴ�. �����ڿ��� ���� �ٶ��ϴ�.<br>
	���� ����: <%=exception.getClass() %> <br>
	���� �޼��� : <%=exception.getMessage()%> <br>
</body>
</html>