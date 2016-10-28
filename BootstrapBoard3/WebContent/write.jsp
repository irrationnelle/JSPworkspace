<%@page import="service.BoardService"%>
<%@page import="vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");	
		
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			String password = request.getParameter("password");
			
			ArticleVO article = new ArticleVO();
			article.setTitle(title);
			article.setWriter(writer);
			article.setContent(content);
			article.setPassword(password);
			
			BoardService service = BoardService.getInstance();
			int result = service.write(article);
			
			System.out.println("글쓰기 결과: "+result);
		%>
		
		
<!-- 		<a href="board_list.jsp"><button>목록으로</button></a> -->
		<%
			response.sendRedirect("board_list.jsp");
		%>
	</body>
</html>