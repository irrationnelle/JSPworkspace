<%@page import="vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>board_list.jsp</title>
</head>

<body>
<table border = "1">
	<tr>
		<th>�۹�ȣ</th>
		<th>�۾���</th>
		<th>������</th>
		<th>�����ð�</th>
		<th>��ȸ��</th>
	</tr>
	<c:forEach items="${requestScope.articlePage.articleList}" var="article">
		<tr>
			<td>${article.articleId}</td>
			<td>${article.writer}</td>
			<td>${article.title}</td>
			<td>${article.writeDate}</td>
			<td>${article.readCount}</td>
		</tr>
	</c:forEach>
</table>
<c:forEach begin="${requestScope.articlePage.startPage}" end="${requestScope.articlePage.endPage}" var="i">
	<a href="board.do?action=main&page=${i}">[${i}]</a>
</c:forEach>
</body>
</html>