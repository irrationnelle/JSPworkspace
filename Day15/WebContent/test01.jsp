<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>test01.jsp</title>
</head>
<body>
<%
	String name = request.getParameter("name"); // ǥ���� ����� ��� �ּ�ó��
%>

<b><%=name%></b>�� �ݰ����ϴ�.	<!-- ǥ���� -->
<b>${param.name }</b>�� �ݰ����ϴ� <br>	
<!-- ǥ����� EL. �� ��� getParameter�� ���ڷ� ���� ���� param�� .(dot) ������ �ڿ� �д�. -->
<!-- EL�� ����ϴ� ��� String name�� �����ϰ� request.getParameter("name")���� ���� �ʱ�ȭ���� �ʾƵ� �ȴ�. -->
</body>
</html>