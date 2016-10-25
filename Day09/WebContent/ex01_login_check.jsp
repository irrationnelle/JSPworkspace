<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ex01_login_check.jsp</title>
	</head>
	
	<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("rase") && pw.equals("1234")) {
			out.println("로그인에 성공하였습니다.");
			Cookie cookie = new Cookie("loginID", id);
			response.addCookie(cookie);
		} else {
			out.println("로그인에 실패하였습니다.");
		}
	%>
	</body>
</html>