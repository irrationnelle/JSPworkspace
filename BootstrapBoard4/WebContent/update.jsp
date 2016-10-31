<%@page import="service.BoardService"%>
<%@page import="vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>update.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	String articleIdStr = request.getParameter("articleId");
	int articleId = 0;
	
	if(articleIdStr!=null && articleIdStr.length()>0){
		articleId = Integer.parseInt(articleIdStr);
	}

	ArticleVO article = new ArticleVO();
	article.setArticleId(articleId);
	article.setTitle(title);
	article.setContent(content);
	article.setPassword(password);
	
	BoardService service = BoardService.getInstance();
	int result = service.modify(article);
	out.println("수정하기 실행 결과:" +result+ "<br>");
	if (result > 0) {
		System.out.println("수정 완료");
	} else {
		System.out.println("수정 실패");
	}
	
	response.sendRedirect("board_list.jsp");
%>
</body>
</html>