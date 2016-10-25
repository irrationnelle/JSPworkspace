<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test03_main.jsp</title>
	</head>
	
	<body>
		이 내용은 main.jsp가 작성하였습니다.<br>
		<jsp:include page="test03_sub.jsp"/>
			이 내용은 include 이후 부분입니다. <br>
	</body>
</html>