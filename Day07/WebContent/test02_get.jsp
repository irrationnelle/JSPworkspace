<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02_get.jsp</title>
</head>
<body>
	<%
		// test02_get.jsp ������ �ϳ��̰� session.getAttribute() �޼ҵ�� �� ���� ȣ��������
		// �� �������� ������ parameter�� �ٸ��� ������ 
		// �� ������ ���� �ٸ� parameter ���� ����
		// �������� ������ �� �ٽ� test02_get.jsp�� �����ϸ� null ���� _paramAttr�� �����Ѵ�.
		String _paramAttr = (String) session.getAttribute("paramAttr");
	%>
	
	���� ����� ���ǿ� ��ϵ� _paramAttr �� : <%=_paramAttr%> <br>
</body>
</html>