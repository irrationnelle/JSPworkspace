<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- style 적용, css 및 자바스크립트, 부트스트랩 불러오기 -->
    <jsp:include page="include\head.jsp" />
    
</head>


<!-- Body Start -->
<body class="cms_index page_container side-menu-closed">
	<div class="row">
		<div class="container-fluid">
        	<header>
        	
				<!-- 최상단 메뉴 설정 -->
				<jsp:include page="include\header.jsp" />
                
			<!-- 메인 화면 중앙 부분 -->
			</header>
            <div class="clearfix"></div>
            <div class="content-wrapper">		
                <section class="main_content">
                    <div class="full_screen">
                        <div class="mainpage_content height">
                            <div class="col-lg-12 height">                            	
                            	<h5>그거 버릇이에요? 생각만 하는 거. 시뮬레이션만 하다가 본게임은 못하는 거</h5>
                                <h1>창욱님</h1>
                                <a class="mainpage_content_btn" href="category.html">지창욱과 저녁식사하고 싶다면?</a> 
                            </div>                        
                        </div>
                        <div class="main_content_bg">
                            <figure class="image image_center full_screen" style="opacity: 0.9; -webkit-background-image: url(http://glorious.co.kr/wp/wp-content/uploads/2015/01/slide_11.jpg); background-image: url(http://glorious.co.kr/wp/wp-content/uploads/2015/01/slide_11.jpg)"></figure>
                        </div>
                    </div>
                </section>
            </div>
			<!--content Wrapper End-->
     	</div><!--row-->
	</div><!--container-fluid-->
    
    
	<!-- 왼쪽 버거 메뉴 -->
	<jsp:include page="include\left_menu.jsp" />
    
    
	<!-- 오른쪽 장바구니 메뉴 -->
    <jsp:include page="include\right_cart.jsp" />
    
    
    
	<!-- JAVA SCRIPT  -->
	<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="js/js-functions.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="js/slidereveal.js"></script>
</body>    
</html>    