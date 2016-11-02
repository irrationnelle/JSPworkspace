<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test05.jsp</title>
</head>
<body>
<h2>c:choose, c:when, c:otherwise 태그 활용해보기</h2>
	<c:choose> <%-- switch문 처럼 사용 가능 --%>
		<c:when test="${param.select == 1 }">
			하나!<br>
		</c:when>
		<c:when test="${param.select == 2 }">
			둘!<br>
		</c:when>
		<c:otherwise>
			셋넷다섯여섯 응?<br>
		</c:otherwise>
	</c:choose>
</body>
</html>