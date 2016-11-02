<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test04.jps</title>
</head>
<body>
<h2>c:if 태그 활용해보기</h2>
	<c:if test="true">
		이 내용은 무조건 html 문서에 쓰여집니다.<br>
	</c:if>
	<c:if test="${param.name =='rase' }">
		안녕하세요 라세님.<br>
	</c:if>
	
	<c:if test="${param.age >= 20 }">
		성인입니다.<br>
	</c:if>
	
	<c:if test="${param.age < 20 }">
		미성년자입니다.<br>
	</c:if>
</body>
</html>