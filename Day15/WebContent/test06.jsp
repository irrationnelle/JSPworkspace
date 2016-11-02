<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test06.jsp</title>
</head>
<body>
<h2>c:forEach 태그 활용해보기</h2>
	<c:forEach var="i" begin="1" end="9" step="2">
		3 x ${i} = ${3*i} <br>
	</c:forEach>
	
	<%
		String[] words = {"aaa", "bbb", "ccc", "ddd", "eee"};
		request.setAttribute("wordArray", words);
	%>
	<hr>
	<c:forEach items="${wordArray}" var="word">
		단어: <b>${word}</b><br>
	</c:forEach>
	
	<hr>
	<c:forEach items="${wordArray}" var="word" begin="2" end="4" varStatus="status">
		단어: <b>${word}</b> ${status.index} - ${status.count} <br>
		<!-- index는 배열의 index와 동일하게 0에서 시작. count는 배열 index와 별개로 몇 번 반복 실행했는지를 나타냄 -->
	</c:forEach>
</body>
</html>