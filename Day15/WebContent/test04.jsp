<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test04.jps</title>
</head>
<body>
<h2>c:if �±� Ȱ���غ���</h2>
	<c:if test="true">
		�� ������ ������ html ������ �������ϴ�.<br>
	</c:if>
	<c:if test="${param.name =='rase' }">
		�ȳ��ϼ��� �󼼴�.<br>
	</c:if>
	
	<c:if test="${param.age >= 20 }">
		�����Դϴ�.<br>
	</c:if>
	
	<c:if test="${param.age < 20 }">
		�̼������Դϴ�.<br>
	</c:if>
</body>
</html>