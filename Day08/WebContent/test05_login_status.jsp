<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test05_login_status.jsp</title>
</head>
<body>
<%
// Ŭ���̾�Ʈ�� ���� request���� �α��� ���� ��Ű �ܿ��� �ٸ� ��Ű����
// ������ ������ �� ����.
	Cookie[] cookies = request.getCookies();
	Cookie loginCookie = null;

	if(cookies!=null){
		for(Cookie c: cookies){
			if(c.getName().equals("loginId")){
				loginCookie = c;
			}
		}
	}
	
	if(loginCookie==null){
		out.println("�α��� ������ �����ϴ�.<br>");
		out.println
		("<a href='test05_login_form.jsp'>�α��������� ����</a>");
	}else{
		out.println(loginCookie.getValue()+"�� �α��� �����Դϴ�.<br>");
		out.println("�ݰ����ϴ�~~~!<br>");
		out.println("<a href='test05_logout.jsp'>�α׾ƿ�</a>");
	}
%>


</body>
</html>
