<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>test01.jsp</title>
</head>
<body>
<%
	String name = request.getParameter("name"); // 표현언어를 사용할 경우 주석처리
%>

<b><%=name%></b>님 반갑습니다.	<!-- 표현식 -->
<b>${param.name }</b>님 반갑습니다 <br>	
<!-- 표현언어 EL. 이 경우 getParameter의 인자로 들어가는 값을 param의 .(dot) 연산자 뒤에 둔다. -->
<!-- EL을 사용하는 경우 String name을 선언하고 request.getParameter("name")으로 값을 초기화하지 않아도 된다. -->
</body>
</html>