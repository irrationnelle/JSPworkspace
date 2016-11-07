<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="start_header.jsp"></jsp:include>
</head>

<body>
	
	<!-- Nav -->
	<jsp:include page="start_nav.jsp"></jsp:include>
	<!-- /.Nav -->
    

    <!--Mask-->
   	<jsp:include page="start_mask.jsp"></jsp:include>
    <!--/.Mask-->

	<div class="container">
	
  	<br>
	<br>
	<c:choose>
		<c:when test="${empty requestScope.article }">
			<h4>해당 게시글이 존재하지 않습니다.</h4>
		</c:when>
		<c:otherwise>
			<br id="boardRead">
			<br>
			<!--Panel-->
			<div class="card text-xs-center">
			    <div class="card-header elegant-color-dark white-text">
			        ${article.writer }
			    </div>
			    <div class="card-block">
			        <h4 class="card-title">${article.title }</h4>
			        <p class="card-text">${article.content }</p>
			        <a href="board.do?action=board" class="btn btn-elegant">List</a>
			        <a href="board.do?action=updateForm&articleId=${article.articleId}" class="btn btn-mdb">Edit</a>
			        <a href="board.do?action=delete&articleId=${article.articleId}" class="btn btn-deep-orange">Delete</a>
			    </div>
			    <div class="card-footer text-muted elegant-color-dark white-text">
			        <p>Date: ${article.writeDate }</p>
			        <p>Count: ${article.readCount }</p>
			    </div>
			</div>
			<!--/.Panel-->
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>