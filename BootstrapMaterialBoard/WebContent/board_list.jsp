<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.html"></jsp:include>
</head>
<body>

<jsp:include page="nav.html"></jsp:include>

<div class="container">
  	<%
		String pageStr = request.getParameter("page");
		int pageNum = 1;
		if(pageStr != null && pageStr.length()>0) { // "" <-- �̰� ������ �� �����ϱ� ���� pageStr.length()>0 �˻絵 �־��ش�.
			pageNum = Integer.parseInt(pageStr);
		}
		
		BoardService service = BoardService.getInstance();
		ArticlePageVO articlePage = service.makePage(pageNum);
	%>
	<br>
  	<a href="write_form.jsp"><button type="submit" class="btn btn-success">�۾���</button></a>
  	<br>
  	<br>
  	<table class="table table-striped">
		<tr>
			<th>�۹�ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
			<th>����</th>
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
						<td>
						<a href="read.jsp?articleID=<%=article.getArticleId()%>"><%=article.getTitle()%></a>
						</td>
						<td><%=article.getWriter()%></td>
						<td><%=article.getWriteDate()%></td>
						<td><%=article.getReadCount()%></td>
					</tr>
		<% 
				}
			}
		%>
	</table>
	<%
		if(articlePage.getStartPage() > 1) {
			out.println("<a href=\"board_list.jsp?page="+(articlePage.getStartPage()-1)+"\"><span class=\"label label-success\">"+"����"+"</span></a>");
		}	
	
		for(int i=articlePage.getStartPage(); i<=articlePage.getEndPage(); i++) {
			out.println("<a href=\"board_list.jsp?page="+i+"\"><span class=\"label label-default\">"+i+"</span></a>");			
		}
	
		if(articlePage.getEndPage()< articlePage.getTotalPage()) {
			out.println("<a href=\"board_list.jsp?page="+(articlePage.getEndPage()+1)+"\"><span class=\"label label-success\">"+"����"+"</span></a>");
		}
	%>
  </div>
</div>


</body>
</html>