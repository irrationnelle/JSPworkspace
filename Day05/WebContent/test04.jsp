<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test04.jsp</title>
</head>
<body>
<h2>구구단 표 작성하기(out 기본 객체 활용)</h2>
	<%
		for(int dan=2; dan<10; dan++) {
			for(int i=1; i<10; i++) {
				// 자바 부분에 적힌 것을 html에 적어주는 기본객체 out을 통해 html에 띄운다.
				out.println(dan + "x" + i + "=" + (dan*i) + "<br>");
			}
		}
	%>
</body>
</html>