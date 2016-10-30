<%@page import="vo.ArticleVO"%>
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
		String articleIDstr = request.getParameter("articleID");
		int articleID = 0;
		
		if(articleIDstr != null && articleIDstr.length()>0) {
			articleID = Integer.parseInt(articleIDstr);
		}
		
		BoardService service = BoardService.getInstance();
		ArticleVO article = service.read(articleID);
		
		if(article == null) {
			out.println("<h4>�ش� �Խñ��� �������� �ʽ��ϴ�.</h4>");
		} else {
	%>
		<br>
		<br>
		<table class="table table-striped">
		<tr>
			<td>����: </td>
			<td>
				<%=article.getTitle()%>
			</td>
		</tr>
		<tr>
			<td>�ۼ���:</td>
			<td>
				<%=article.getWriter()%>
			</td>
		</tr>
		<tr>
			<td>��ȸ��:</td>
			<td>
				<%=article.getReadCount()%>
			</td>
		</tr>
		<tr>
			<td>�ۼ���:</td>
			<td>
				<%=article.getWriteDate()%>
			</td>
		</tr>
		<tr>
			<td>����:</td>
			<td>
				<%=article.getContent()%>
			</td>
		</tr>
		</table>
		<%
			}
		%>
		<a href="board_list.jsp"><button class="btn btn-success">��Ϻ���</button></a>
</div>


</body>
</html>