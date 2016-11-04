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
	// BoardController ���������κ��� forward ���� request
	ArticlePageVO articlePage = (ArticlePageVO)request.getAttribute("articlePage");
%>
<h2>�Խñ� ���</h2>
<table border="1">
	<tr>
		<th>�۹�ȣ</th>
		<th>����</th>
		<th>�ۼ���</th>
		<th>�ۼ���</th>
		<th>��ȸ��</th>
	</tr>
	<% if(articlePage.getArticleList().size() == 0)  {%>
		<tr>
			<td colspan="5"> ���� �Խñ��� �������� �ʽ��ϴ�.</td>
		</tr>
	<%} else { %>
		<% for(ArticleVO article: articlePage.getArticleList()) {%>
		<tr>
			<td><%=article.getArticleId() %></td>
			<td>
				<a href="board.do?action=read&articleID=<%=article.getArticleId()%>"><%=article.getTitle() %></a>
			</td>
			<td><%=article.getWriter() %></td>
			<td><%=article.getWriteDate() %></td>
			<td><%=article.getReadCount() %></td>
		</tr>
		<%} %>
	<%} %>
</table>

	<%for(int i=articlePage.getStartPage(); i<=articlePage.getEndPage(); i++) {%>
		<a href="board.do?action=main&page=<%=i%>"> <%=i %> </a>
	<%} %>
<hr>
<a href="board.do?action=writeForm"><button>�۾���</button></a>
</body>
</html>