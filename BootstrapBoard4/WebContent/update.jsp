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
	out.println("�����ϱ� ���� ���:" +result+ "<br>");
	if (result > 0) {
		System.out.println("���� �Ϸ�");
	} else {
		System.out.println("���� ����");
	}
	
	response.sendRedirect("board_list.jsp");
%>
</body>
</html>