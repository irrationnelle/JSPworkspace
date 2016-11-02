<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test06.jsp</title>
</head>
<body>
<h2>c:forEach �±� Ȱ���غ���</h2>
	<c:forEach var="i" begin="1" end="9" step="2">
		3 x ${i} = ${3*i} <br>
	</c:forEach>
	
	<%
		String[] words = {"aaa", "bbb", "ccc", "ddd", "eee"};
		request.setAttribute("wordArray", words);
	%>
	<hr>
	<c:forEach items="${wordArray}" var="word">
		�ܾ�: <b>${word}</b><br>
	</c:forEach>
	
	<hr>
	<c:forEach items="${wordArray}" var="word" begin="2" end="4" varStatus="status">
		�ܾ�: <b>${word}</b> ${status.index} - ${status.count} <br>
		<!-- index�� �迭�� index�� �����ϰ� 0���� ����. count�� �迭 index�� ������ �� �� �ݺ� �����ߴ����� ��Ÿ�� -->
	</c:forEach>
</body>
</html>