<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test05.jsp</title>
</head>
<body>
<h2>c:choose, c:when, c:otherwise �±� Ȱ���غ���</h2>
	<c:choose> <%-- switch�� ó�� ��� ���� --%>
		<c:when test="${param.select == 1 }">
			�ϳ�!<br>
		</c:when>
		<c:when test="${param.select == 2 }">
			��!<br>
		</c:when>
		<c:otherwise>
			�³ݴټ����� ��?<br>
		</c:otherwise>
	</c:choose>
</body>
</html>