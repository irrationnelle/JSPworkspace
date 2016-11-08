<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
		<br id="board">
		<br>
		<table class="table">
		    <thead>
		        <tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>설정</th>
				</tr>
		    </thead>
		    <tbody>
		    <c:choose>
		    	<c:when test="${empty requestScope.articlePage.articleList}">
					<tr>
						<td colspan="5">아직 게시글이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.articlePage.articleList}" var="article">
							<tr>
								<td>${article.articleId}</td>
								<td>
								<a href="board.do?action=read&articleId=${article.articleId}#boardRead">${article.title}</a>
								</td>
								<td>${article.id }</td>
								<td>${article.writeDate }</td>
								<td>${article.readCount }</td>
								<td>
					               <a class="blue-text"><i class="fa fa-user"></i></a>
					               <a href="board.do?action=updateWithoutRead&articleId=${article.articleId}" class="teal-text" data-toggle="modal" data-target="#modal-update" data-backdrop="false" class="btn btn-mdb" id="update"><i class="fa fa-pencil"></i>
					               </a>
					               <a class="red-text"><i class="fa fa-times"></i></a>
					            </td>
							</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		    </tbody>
		</table>
		
		<c:forEach begin="${requestScope.articlePage.startPage}" end="${requestScope.articlePage.endPage}" var="i">
			<a href="board.do?action=board&page=${i}#board" class="btn btn-unique btn-rounded">${i}</a>
		</c:forEach>
		
		<jsp:include page="modal_update.jsp"></jsp:include>
		
		<!-- Footer -->
		<jsp:include page="start_footer.jsp"></jsp:include>
		<!-- /Footer -->
</body>
</html>