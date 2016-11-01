<%@page import="vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>board_list.jsp</title>
</head>

<body>
<%
	int currentPage = 0;
	String currentPageStr = request.getParameter("currentPage");
	if(currentPageStr == null) {
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(currentPageStr);
	}
	
	BoardService service = BoardService.getInstance();
	ArticlePageVO articlePage = service.createArticlePage(currentPage);
%>
<table border = "1">
	<tr>
		<th>�۹�ȣ</th>
		<th>�۾���</th>
		<th>������</th>
		<th>�����ð�</th>
		<th>��ȸ��</th>
	</tr>
	<%for(ArticleVO article : articlePage.getArticleList()) {%>
	<tr>
		<td><%=article.getArticleId() %></td>
		<td><%=article.getWriter() %></td>
		<td><%=article.getTitle() %></td>
		<td><%=article.getWriteDate() %></td>
		<td><%=article.getReadCount() %></td>
	</tr>
	<%} %>
</table>
<% for(int i=articlePage.getStartPage(); i<=articlePage.getEndPage(); i++) {%> [<%=i %>] <%} %> 
</body>
</html>