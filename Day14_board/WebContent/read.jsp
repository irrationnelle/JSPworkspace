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
			<td>제목: </td>
			<td>
				<%=article.getTitle()%>
			</td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td>
				<%=article.getWriter()%>
			</td>
		</tr>
		<tr>
			<td>조회수:</td>
			<td>
				<%=article.getReadCount()%>
			</td>
		</tr>
		<tr>
			<td>작성일:</td>
			<td>
				<%=article.getWriteDate()%>
			</td>
		</tr>
		<tr>
			<td>내용:</td>
			<td>
				<%=article.getContent()%>
			</td>
		</tr>
		</table>
		<a href="board.do?action=main"><button>목록보기</button></a>
		<a href="board.do?action=updateForm&articleID=<%=article.getArticleId()%>"><button>수정</button></a>
		<a href="board.do?action=deleteForm&articleID=<%=article.getArticleId()%>"><button>삭제</button>
</body>
</html>