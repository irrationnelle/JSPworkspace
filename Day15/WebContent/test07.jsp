<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test07.jsp</title>
</head>
<body>
	<c:set var="price" value="3.14" />
	숫자:
	<fmt:formatNumber value="${price}" type="number" />
	<br> 통화: 
	<fmt:formatNumber value="${price}" type="currency" currencySymbol="$" />
	<br> 퍼센트:
	<fmt:formatNumber value="${price}" type="percent" groupingUsed="false" />
	<br> 패턴:
	<fmt:formatNumber value="${price}" pattern="000000.000" />
</body>
</html>