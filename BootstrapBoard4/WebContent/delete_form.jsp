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
		String articleIdStr = request.getParameter("articleId");
		int articleID = 0;
		if(articleIdStr!=null && articleIdStr.length()>0){
			articleID = Integer.parseInt(articleIdStr);
		}
		
		BoardService service = BoardService.getInstance();
		ArticleVO original = service.readWithoutReadCount(articleID);
	%>
		<br>
		<form action="delete.jsp" method="post">
			<table class="table table-striped">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="30"
						value="<%=original.getTitle()%>"></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="password" size="30">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="30" name="content"
							placeholder="여기에 내용을 입력하세요."><%=original.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" name="articleId" value="<%=original.getArticleId()%>"> 
					<button class="btn btn-success" type="submit">삭제</button>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>