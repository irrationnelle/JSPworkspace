<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>폼을 만들어주는 test01.jsp</title>
</head>
<body>
	<h2>JSP 서블릿이 만들어주는 HTML 화면입니다. *get*</h2>
	<!-- 전송 버튼을 누를 때 요청이 날아가는 서블릿을 지정하는 action -->
	<form action="JavaTest01" method="get">
		클라이언트 이름을 입력하세요: <br>
		<input type="text" name="clientName" size="20">
		<input type="submit" value="전송">
	</form>
	
	<h2>JSP 서블릿이 만들어주는 HTML 화면입니다. *post*</h2>
	<form action="JavaTest01" method="post">
		클라이언트 이름을 입력하세요: <br>
		<input type="text" name="clientName" size="20">
		<input type="submit" value="전송">
	</form>
</body>
</html>