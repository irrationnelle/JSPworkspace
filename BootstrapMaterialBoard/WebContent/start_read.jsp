<%@page import="vo.ArticleVO"%>
<%@page import="vo.ArticlePageVO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="start_header.jsp"></jsp:include>
</head>
<body>
	<!-- Nav -->
	<jsp:include page="start_nav.jsp"></jsp:include>
	<!-- /.Nav -->
	
	  <!--Mask-->
	  <jsp:include page="start_mask.jsp"></jsp:include>
	  <!--/.Mask-->

	  	<br id="">
		<c:choose>
			<c:when test="${empty requestScope.article }">
				<h4>해당 게시글이 존재하지 않습니다.</h4>
			</c:when>
			<c:otherwise>
				<br id="boardRead">
				<br>
				<!--Panel-->
				<div class="card text-xs-center">
				    <div class="card-header elegant-color-dark white-text">
				        <a><h4>${article.id }</h4></a>
				    </div>
				    <div class="card-block">
				        <h2 class="card-title">${requestScope.article.title }</h2>
				        <p class="card-text">${requestScope.article.content }</p>
				        <a href="board.do?action=board#board" class="btn btn-elegant">List</a>
				        <c:if test="${sessionScope.id == requestScope.article.id}">
					        <a data-toggle="modal" data-target="#modal-update" data-backdrop="false" class="btn btn-mdb" id="update">Edit</a>
					        <a data-toggle="modal" data-target="#modal-delete" data-backdrop="false" class="btn btn-deep-orange" id="update">Delete</a>
				        </c:if>
				    </div>
				    <div class="card-footer text-muted elegant-color-dark white-text">
				        <p><i class="fa fa-clock-o fa-2x"></i> ${requestScope.article.writeDate }</p>
				        <p><i class="fa fa-eye fa-2x" aria-hidden="true"></i>  ${requestScope.article.readCount }</p>
				    </div>
				</div>
				<!--/.Panel-->
			</c:otherwise>
		</c:choose>
		<br>
		<!--Section: Comments list-->
		<section>
		
		    <!--Main wrapper-->
		    <div class="comments-list">
		        <div class="section-heading">
		            <h3>Comments <span class="tag black">1</span></h3>
		        </div>
		        <!--First row-->
		        <div class="row">
		            <!--Image column-->
		            <div class="col-sm-2 col-xs-12">
		                <img src="https://ssl.gstatic.com/images/branding/product/2x/avatar_circle_grey_64dp.png">
		            </div>
		            <!--/.Image column-->
		
		            <!--Content column-->
		            <div class="col-sm-10 col-xs-12">
		                <a><h4 class="user-name">John Doe</h4></a>
		
		                <div class="card-data">
		                    <ul>
		                        <h4><li class="comment-date"><i class="fa fa-clock-o"></i> 05/10/2015</li></h4>
		                    </ul>
		                </div>
		
		                <p class="comment-text">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
		                    cupidatat non proident.</p>
		            </div>
		            <!--/.Content column-->
		
		        </div>
		        <!--/.First row-->
				<div class="text-xs-center">
	                <button class="btn btn-blue-grey">Edit</button>
	                <button class="btn btn-deep-orange">Delete</button>
	            </div>
		
		    </div>
		    <!--/.Main wrapper-->
		
		</section>
		<!--/Section: Comments list-->
		<br>
		<br>
		<!--Section: Leave a comment-->
		<section>
		
		    <!--Leave a reply form-->
		    <div class="reply-form">
		        <h3 class="section-heading">Leave a comment </h3>
<!-- 		        <p class="text-xs-center"></p> -->
		
		        <!--Third row-->
		        <div class="row">
		            <!--Image column-->
		            <div class="col-sm-2 col-xs-12">
		                <img src="https://ssl.gstatic.com/images/branding/product/2x/avatar_circle_grey_64dp.png">
		            </div>
		            <!--/.Image column-->
		
		            <!--Content column-->
		            <div class="col-sm-10 col-xs-12">
		                <div class="md-form">
		                    <textarea type="text" id="form8" class="md-textarea"></textarea>
		                    <label for="form8">Your comment</label>
		                </div>
		
		            </div>
		
		            <div class="text-xs-center">
		                <button class="btn btn-unique">Submit</button>
		            </div>
		            <!--/.Content column-->
		
		        </div>
		        <!--/.Third row-->
		    </div>
		    <!--/.Leave a reply form-->
		
		</section>
		<!--/Section: Leave a reply (Logged In User)-->
		
		<jsp:include page="modal_update.jsp"></jsp:include>
		<jsp:include page="modal_delete.jsp"></jsp:include>
		
		<!-- Footer -->
		<jsp:include page="start_footer.jsp"></jsp:include>
		<!-- /Footer -->
</body>
</html>