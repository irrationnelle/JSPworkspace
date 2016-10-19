<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test05.jsp</title>
</head>
<body>
	<%
		// 스크립트 부분은 어차피 클라이언트에게 보내는
		// html에는 들어가지 않으므로 이 주석은 클라이언트가 볼 일이 없음.
		// 스크립트 안쪽에서는 자바 주석이 사용이 되고
		// 스크립트 바깥쪽에서는 html 주석이 사용된다.
		// Ctrl + Shift + C로 주석처리할 때는 스크립트 부분과 html 부분을 잘 나눠서 할 것
	%>
	
	<h2>주석 내용을 테스트 하는 페이지 입니다.</h2>
	<!-- 이 문장은 클라이언트에게 전송 될까요? (html 주석) -->
	<%-- 이문장은 클라이언트에게 전송 될까요? (JSP 주석) --%>
</body>
</html>