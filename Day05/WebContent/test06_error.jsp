<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 이 페이지는 에러가 발생했을 때만 보여주는 페이지이기 때문에 
	 page 디렉티브에 isErrorPage를 true로 해준다. 이렇게 하면 Exception 객체를 문법으로 사용 가능.
	 자바로 따지면 try-catch문과 유사한 역할을 한다고 볼 수 있다.
	 url 창에서는 test06_error.jsp가 아닌 test06.jsp로만 뜬다. -->
<%@ page isErrorPage="true" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	예외가 발생하였습니다. 관리자에게 문의 바랍니다.<br>
	예외 종류: <%=exception.getClass() %> <br>
	예외 메세지 : <%=exception.getMessage()%> <br>
</body>
</html>