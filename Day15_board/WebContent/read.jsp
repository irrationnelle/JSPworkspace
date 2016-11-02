<%@page import="vo.ArticleVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>read.jsp</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>제목:</td>
			<td>${article.title}</td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td>${article.writer}</td>
		</tr>
		<tr>
			<td>조회수:</td>
			<td>${article.readCount}</td>
		</tr>
		<tr>
			<td>작성일:</td>
			<td>${article.writeDate}</td>
		</tr>
		<tr>
			<td>내용:</td>
			<td>${article.content}</td>
		</tr>
	</table>
<a href="board.do?action=main"><button>목록보기</button></a>
<a href="board.do?action=updateForm&articleId=${article.articleId}">
	<button>수정</button>
</a>
<a href="board.do?action=deleteForm&articleId=${article.articleId}">
	<button>삭제</button>
</a>
</body>
</html>




