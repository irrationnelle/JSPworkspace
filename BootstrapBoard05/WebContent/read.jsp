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
			<td>�۹�ȣ:</td>
			<td>${requestScope.article.articleId}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${requestScope.article.title}</td>
		</tr>
		<tr>
			<td>�۾���</td>
			<td>${requestScope.article.writer}</td>
		</tr>
		<tr>
			<td>�ð�</td>
			<td>${requestScope.article.writeDate}</td>
		</tr>
		<tr>
			<td>�۳���</td>
			<td>${requestScope.article.content}</td>
		</tr>
	</table>
	<a href=""><button>��Ϻ���</button></a>
	<a href=""><button>�ۼ���</button></a>
	<a href=""><button>�ۻ���</button></a>
</body>
</html>