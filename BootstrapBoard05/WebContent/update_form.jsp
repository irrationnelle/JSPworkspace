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
			<td>������:</td>
			<td><input type="text" name="title" size="30" value="${requestScope.article.title}"></td>
		</tr>
		<tr>
			<td>�ۼ���:</td>
			<td><input type="text" name="writer" size="30" value="${requestScope.article.writer}"></td>
		</tr>
		<tr>
			<td>��й�ȣ:</td>
			<td><input type="password" name="password" size="30"></td>
		</tr>
		<tr>
			<td>�۳���:</td>
			<td>
				<textarea name="content" rows="15" cols="30">${requestScope.article.content}</textarea>
			</td>
		</tr>
	</table>
	<button type="submit">�����Ϸ�</button>
</form>
</body>
</html>