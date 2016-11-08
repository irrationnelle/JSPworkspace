<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--Navbar-->
    <nav class="navbar navbar-dark navbar-fixed-top scrolling-navbar">

        <!-- Collapse button-->
        <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
            <i class="fa fa-bars"></i>
        </button>

        <div class="container">

            <!--Collapse content-->
            <div class="collapse navbar-toggleable-xs" id="collapseEx">
                <!--Navbar Brand-->
                <a class="navbar-brand" href="http://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">irrationnelle</a>
                <!--Links-->
                <ul class="nav navbar-nav">
                    <li class="nav-item">
                        <a href="board.do?action=main" class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    
                    <c:choose>
           				<c:when test="${empty sessionScope.id}">
		                    <li class="nav-item">
		                        <a class="nav-link" data-toggle="modal" data-target="#modal-signup" data-backdrop="false">Sign Up</a>
		                    </li>
							
							<jsp:include page="modal_signup.jsp"></jsp:include>
							
							<li class="nav-item">
		                        <a class="nav-link" data-toggle="modal" data-target="#modal-login" data-backdrop="false">Login</a>
		                    </li>
		                    
		                    <jsp:include page="modal_login.jsp"></jsp:include>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="nav-item">
		                        <a href="member.do?action=logout" class="nav-link">Logout</a>
		                    </li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#modal-write" data-backdrop="false">Write</a>
                    </li>
                    
                    <jsp:include page="modal_write_form.jsp"></jsp:include>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="board.do?action=board#board">Board</a>
                    </li>
                </ul>
                
            </div>
            <!--/.Collapse content-->

        </div>

    </nav>
    <!--/.Navbar-->