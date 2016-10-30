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
		if(pageStr != null && pageStr.length()>0) { // "" <-- 이게 들어오는 걸 방지하기 위해 pageStr.length()>0 검사도 넣어준다.
			pageNum = Integer.parseInt(pageStr);
		}
		
		BoardService service = BoardService.getInstance();
		ArticlePageVO articlePage = service.makePage(pageNum);
	%>
	<br>
  	<a href="write_form.jsp"><button type="submit" class="btn btn-success">글쓰기</button></a>
  	<br>
  	<br>
  	<table class="table table-striped">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>설정</th>
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
			out.println("<a href=\"board_list.jsp?page="+(articlePage.getStartPage()-1)+"\"><span class=\"label label-success\">"+"이전"+"</span></a>");
		}	
	
		for(int i=articlePage.getStartPage(); i<=articlePage.getEndPage(); i++) {
			out.println("<a href=\"board_list.jsp?page="+i+"\"><span class=\"label label-default\">"+i+"</span></a>");			
		}
	
		if(articlePage.getEndPage()< articlePage.getTotalPage()) {
			out.println("<a href=\"board_list.jsp?page="+(articlePage.getEndPage()+1)+"\"><span class=\"label label-success\">"+"다음"+"</span></a>");
		}
	%>
  </div>
</div>


</body>
</html>