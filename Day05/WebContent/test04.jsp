<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test04.jsp</title>
</head>
<body>
<h2>������ ǥ �ۼ��ϱ�(out �⺻ ��ü Ȱ��)</h2>
	<%
		for(int dan=2; dan<10; dan++) {
			for(int i=1; i<10; i++) {
				// �ڹ� �κп� ���� ���� html�� �����ִ� �⺻��ü out�� ���� html�� ����.
				out.println(dan + "x" + i + "=" + (dan*i) + "<br>");
			}
		}
	%>
</body>
</html>