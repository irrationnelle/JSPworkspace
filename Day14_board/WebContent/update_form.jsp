<%@page import="vo.ArticleVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>update_form.jsp</title>
</head>
<body>
	<%
		ArticleVO original = (ArticleVO) request.getAttribute("original");
	%>
  <form action="board.do" method="post">
  <input type="hidden" name="action" value="update">
  	<table border="1">
		<tr>
			<td>����</td>
			<td>
				<input type="text" name="title" 
					size="30" value="<%=original.getTitle()%>">
			</td>
		</tr>
		<tr>
			<td>��ȣ</td>
			<td>
				<input type="password" name="password" size="30">
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
			<textarea rows="10" cols="30" name="content"
				placeholder="���⿡ ������ �Է��ϼ���."><%=original.getContent()%></textarea> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="hidden" name="articleId" value="<%=original.getArticleId()%>">
			<button type="submit">����</button>
			</td>
		</tr>
	</table>
  </form>
</body>
</html>