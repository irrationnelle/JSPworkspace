<%@page import="vo.ArticleVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>read.jsp</title>
</head>
<body>
  	<%
		ArticleVO article = (ArticleVO)request.getAttribute("article");
	%>
		<br>
		<br>
		<table border="1">
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
		<a href="board.do?action=main"><button>��Ϻ���</button></a>
		<a href="board.do?action=updateForm&articleID=<%=article.getArticleId()%>"><button>����</button></a>
		<a href="board.do?action=deleteForm&articleID=<%=article.getArticleId()%>"><button>����</button>
</body>
</html>