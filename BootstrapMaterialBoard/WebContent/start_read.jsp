<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="start_header.jsp"></jsp:include>
</head>

<body>
	
	<!-- Nav -->
	<jsp:include page="start_nav.jsp"></jsp:include>
	<!-- /.Nav -->
    

    <!--Mask-->
    <div class="view hm-black-strong">
        <div class="full-bg-img flex-center">
            <ul>
                <li>
                    <h1 class="h1-responsive wow fadeInDown" data-wow-delay="0.2s">Board Exercise</h1></li>
                <li>
                    <p class="wow fadeInDown">by Material Design for Bootstrap 4</p>
                </li>
                <li>
                    <a class="btn btn-primary btn-lg wow fadeInLeft" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-register" data-backdrop="false">Sign up!</a>
                    <a class="btn btn-default btn-lg wow fadeInDown" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-write" data-backdrop="false">Write</a>
                    <a href="#board" class="btn btn-amber btn-lg wow fadeInRight" data-wow-delay="0.2s" >Board</a>
                </li>
            </ul>
        </div>
    </div>
    <!--/.Mask-->

	<div class="container">
	
  	<br>
	<br>
  	<%
		String articleIDstr = request.getParameter("articleID");
		int articleID = 0;
		
		if(articleIDstr != null && articleIDstr.length()>0) {
			articleID = Integer.parseInt(articleIDstr);
		}
		
		BoardService service = BoardService.getInstance();
		ArticleVO article = service.read(articleID);
		
		if(article == null) {
			out.println("<h4>해당 게시글이 존재하지 않습니다.</h4>");
		} else {
	%>
		<br id="boardRead">
		<br>
		<table class="table table-striped">
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
		<%
			}
		%>
		<a href="start_template_encode.jsp#board"><button class="btn btn-success">목록보기</button></a>
</div>


</body>
</html>