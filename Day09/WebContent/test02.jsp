<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test02.jsp</title>
</head>
<body>
<%
// web.xml�� ������ ���� ��ȿ�ð��� 5�� ������
// �� ������ ��û�� ������ ���� 
// �ش� Ŭ���̾�Ʈ�� ������ ��ȿ�ð��� 60�ʷ� �����.
	session.setMaxInactiveInterval(60);
%>
���� ���� ID : <%=session.getId()%>
</body>
</html>