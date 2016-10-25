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
		out.println("로그인이 성공하였습니다.<br>");
		Cookie cookie = new Cookie("loginId", id);
		response.addCookie(cookie);
	}else{
		out.println("로그인이 실패하였습니다.<br>");
	}
%>

<a href="test05_login_status.jsp"><button>로그인 상태보기</button></a>

</body>
</html>



