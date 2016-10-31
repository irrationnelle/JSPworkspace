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

    <!-- Main container-->
    <div class="container">
		<br id="about">
        <div class="divider-new">
            <h2 class="h2-responsive wow bounceIn" >About This Page</h2>
        </div>

        <!--Section: About-->
        <section class="text-xs-center wow bounceIn" data-wow-delay="0.2s">

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit explicabo assumenda eligendi ex exercitationem harum deleniti quaerat beatae ducimus dolor voluptates magnam, reiciendis pariatur culpa tempore quibusdam quidem, saepe eius.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit explicabo assumenda eligendi ex exercitationem harum deleniti quaerat beatae ducimus dolor voluptates magnam, reiciendis pariatur culpa tempore quibusdam quidem, saepe eius.</p>
			
        </section>
        <!--Section: About-->
		<br id="best-features">
        <div class="divider-new">
            <h2 class="h2-responsive wow fadeInDown">Best features</h2>
        </div>

        <!--Section: Best features-->
        
<!--         <section id="best-features"> -->

            <div class="row">

                <!--First columnn-->
                <div class="col-md-7">
                    <!--Card-->
                    <div class="card wow fadeInUp">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <a>
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block text-xs-center">
                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <hr>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident fuga animi architecto dolores dicta cum quo velit.</p>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--First columnn-->

                <!--Second columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card wow fadeInUp" data-wow-delay="0.2s">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/regular/city/img%20(3).jpg" class="img-fluid" alt="">
                            <a>
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block text-xs-center">
                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <hr>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident fuga animi architecto dolores dicta cum quo velit.</p>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second columnn-->

                <!--Third columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card wow fadeInUp" data-wow-delay="0.4s">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/regular/city/img%20(4).jpg" class="img-fluid" alt="">
                            <a>
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block text-xs-center">
                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <hr>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident fuga animi architecto dolores dicta cum quo velit.</p>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Third columnn-->

                <!--First columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card wow fadeInUp" data-wow-delay="0.6s">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/regular/city/img%20(8).jpg" class="img-fluid" alt="">
                            <a>
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block text-xs-center">
                            <!--Title-->
                            <h4 class="card-title">Card title</h4>
                            <hr>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident fuga animi architecto dolores dicta cum quo velit.</p>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--First columnn-->
            </div>

        </section>
        <!--/Section: Best features-->
		<br id="board">
        <div class="divider-new">
            <h2 class="h2-responsive wow fadeInUp">Board</h2>
        </div>

        <!--Section: Contact-->
        <section>
        <%
			String pageStr = request.getParameter("page");
			int pageNum = 1;
			if(pageStr != null && pageStr.length()>0) { // "" <-- 이게 들어오는 걸 방지하기 위해 pageStr.length()>0 검사도 넣어준다.
				pageNum = Integer.parseInt(pageStr);
			}
			
			BoardService service = BoardService.getInstance();
			ArticlePageVO articlePage = service.makePage(pageNum);
		%>
			<table class="table">
			    <thead>
			        <tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>설정</th>
					</tr>
			    </thead>
			    <tbody>
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
									<a href="start_read.jsp?articleID=<%=article.getArticleId()%>#boardRead"><%=article.getTitle()%></a>
									</td>
									<td><%=article.getWriter()%></td>
									<td><%=article.getWriteDate()%></td>
									<td><%=article.getReadCount()%></td>
									<td>
						               <a class="blue-text"><i class="fa fa-user"></i></a>
						               <a class="teal-text"><i class="fa fa-pencil"></i></a>
						               <a class="red-text"><i class="fa fa-times"></i></a>
						            </td>
								</tr>
					<% 
							}
						}
					%>
			    </tbody>
			</table>
        </section>
        <!--Section: Contact-->

    </div>
    <!--/ Main container-->

	<!-- Footer -->
	<jsp:include page="start_footer.jsp"></jsp:include>
	<!-- /Footer -->
</body>

</html>