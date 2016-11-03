<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>read.jsp</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>글번호:</td>
			<td>${requestScope.article.articleId}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${requestScope.article.title}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${requestScope.article.writer}</td>
		</tr>
		<tr>
			<td>시간</td>
			<td>${requestScope.article.writeDate}</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>${requestScope.article.content}</td>
		</tr>
	</table>
</body>
</html>