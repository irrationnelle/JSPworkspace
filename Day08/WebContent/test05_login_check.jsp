<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test05_login_check.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin") && pw.equals("1234")){
		out.println("�α����� �����Ͽ����ϴ�.<br>");
		Cookie cookie = new Cookie("loginId", id);
		response.addCookie(cookie);
	}else{
		out.println("�α����� �����Ͽ����ϴ�.<br>");
	}
%>

<a href="test05_login_status.jsp"><button>�α��� ���º���</button></a>

</body>
</html>



