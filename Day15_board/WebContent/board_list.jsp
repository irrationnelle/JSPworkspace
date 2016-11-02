<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>board_list.jsp</title>
</head>
<body>

<h2>�Խñ� ���</h2>
<table border="1">
	<tr>
		<th>�۹�ȣ</th>
		<th>����</th>
		<th>�ۼ���</th>
		<th>�ۼ���</th>
		<th>��ȸ��</th>
	</tr>
	<c:choose>
		<c:when test="${empty requestScope.articlePage.articleList}">
			<tr>
				<td colspan="5"> ���� �Խñ��� �������� �ʽ��ϴ�.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${requestScope.articlePage.articleList}" var="article">
				<tr>
					<td>${article.articleId}</td>
					<td>
						<a href="board.do?action=read&articleID=${article.articleId}">${article.title}</a>
					</td>
					<td>${article.writer}</td>
					<td>${article.writeDate}</td>
					<td>${article.readCount}</td>
				</tr>
			</c:forEach> 
		</c:otherwise>
	</c:choose>
</table>

<c:forEach begin="${articlePage.startPage}" end="${articlePage.endPage}" var="i">
	<a href="board.do?action=main&page=${i}"> ${i} </a>
</c:forEach>
<hr>
<a href="board.do?action=writeForm"><button>�۾���</button></a>
</body>
</html>