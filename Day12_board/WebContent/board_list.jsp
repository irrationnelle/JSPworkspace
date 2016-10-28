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
			if(pageStr != null && pageStr.length()>0) { // "" <-- 이게 들어오는 걸 방지하기 위해 pageStr.length()>0 검사도 넣어준다.
				pageNum = Integer.parseInt(pageStr);
			}
			
			BoardService service = BoardService.getInstance();
			ArticlePageVO articlePage = service.makePage(pageNum);
		%>
		
		<table border="1">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%
				if(articlePage.getArticleList().size() == 0) { 
			%>
			<tr>
				<td colspan="5">아직 게시글이 존재하지 않습니다.</td>
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