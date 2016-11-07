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
	
		<table class="table">
		    <thead>
		        <tr>
					<th>�۹�ȣ</th>
					<th>����</th>
					<th>�ۼ���</th>
					<th>�ۼ���</th>
					<th>��ȸ��</th>
					<th>����</th>
				</tr>
		    </thead>
		    <tbody>
		    <c:choose>
		    	<c:when test="${empty requestScope.articlePage.articleList}">
					<tr>
						<td colspan="5">���� �Խñ��� �������� �ʽ��ϴ�.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.articlePage.articleList}" var="article">
							<tr>
								<td>${article.articleId}</td>
								<td>
								<a href="board.do?action=read&articleId=${article.articleId}#boardRead">${article.title}</a>
								</td>
								<td>${article.writer }</td>
								<td>${article.writeDate }</td>
								<td>${article.readCount }</td>
								<td>
					               <a class="blue-text"><i class="fa fa-user"></i></a>
					               <a class="teal-text"><i class="fa fa-pencil"></i></a>
					               <a class="red-text"><i class="fa fa-times"></i></a>
					            </td>
							</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		    </tbody>
		</table>
		
		<!-- Footer -->
		<jsp:include page="start_footer.jsp"></jsp:include>
		<!-- /Footer -->
</body>
</html>