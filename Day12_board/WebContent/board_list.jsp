<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>board_list.jsp</title>
	</head>
	
	<body>
		<%
			String pageStr = request.getParameter("page");
			int pageNum = 1;
			if(pageStr != null && pageStr.length()>0) { // "" <-- �̰� ������ �� �����ϱ� ���� pageStr.length()>0 �˻絵 �־��ش�.
				pageNum = Integer.parseInt(pageStr);
			}
			
			BoardService service = BoardService.getInstance();
			ArticlePageVO articlePage = service.makePage(pageNum);
		%>
		
		<table border="1">
			<tr>
				<th>�۹�ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
			</tr>
			<%
				if(articlePage.getArticleList().size() == 0) { 
			%>
			<tr>
				<td colspan="5">���� �Խñ��� �������� �ʽ��ϴ�.</td>
			</tr>
			<%
				} else {
					for(ArticleVO article : articlePage.getArticleList()) {
			%>
						<tr>
							<td><%=article.getArticleId()%></td>
							<td><%=article.getTitle()%></td>
							<td><%=article.getWriter()%></td>
							<td><%=article.getWriteDate()%></td>
							<td><%=article.getReadCount()%></td>
						</tr>
			<% 
					}
				}
			%>
		</table>
	</body>
</html>