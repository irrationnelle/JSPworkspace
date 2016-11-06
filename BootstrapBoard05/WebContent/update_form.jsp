<%@page import="vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>update_form.jsp</title>
</head>
<body>
	<form action="board.do?action=update" method="post">
	<input type="hidden" name="articleId" value="${requestScope.article.articleId}">
	<table>
		<tr>
			<td>글제목:</td>
			<td><input type="text" name="title" size="30" value="${requestScope.article.title}"></td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td><input type="text" name="writer" size="30" value="${requestScope.article.writer}"></td>
		</tr>
		<tr>
			<td>비밀번호:</td>
			<td><input type="password" name="password" size="30"></td>
		</tr>
		<tr>
			<td>글내용:</td>
			<td>
				<textarea name="content" rows="15" cols="30">${requestScope.article.content}</textarea>
			</td>
		</tr>
	</table>
	<button type="submit">수정완료</button>
</form>
</body>
</html>