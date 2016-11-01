<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>board_list.jsp</title>
</head>
<body>
<%
	// BoardController 서블릿으로부터 forward 받은 request
	ArticlePageVO articlePage = (ArticlePageVO)request.getAttribute("articlePage");
%>
<h2>게시글 목록</h2>
<table border="1">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<% if(articlePage.getArticleList().size() == 0)  {%>
		<tr>
			<td colspan="5"> 아직 게시글이 존재하지 않습니다.</td>
		</tr>
	<%} else { %>
		<% for(ArticleVO article: articlePage.getArticleList()) {%>
		<tr>
			<td><%=article.getArticleId() %></td>
			<td><%=article.getTitle() %></td>
			<td><%=article.getWriter() %></td>
			<td><%=article.getWriteDate() %></td>
			<td><%=article.getReadCount() %></td>
		</tr>
		<%} %>
	<%} %>
</table>
</body>
</html>