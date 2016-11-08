<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
           	<c:choose>
           		<c:when test="${empty sessionScope.id}"> 
	                <a class="btn btn-primary btn-lg wow fadeInLeft" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-signup" data-backdrop="false">Sign up!</a>
	                <a class="btn btn-secondary btn-lg wow fadeInUp" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-login" data-backdrop="false">Login</a>
	                <a class="btn btn-default btn-lg wow fadeInDown" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-write" data-backdrop="false">Write</a>
                	<a href="board.do?action=board#board" class="btn btn-amber btn-lg wow fadeInRight" data-wow-delay="0.2s" >Board</a>
            	</c:when>
            	<c:otherwise>
	                <a href="member.do?action=logout" class="btn btn-secondary btn-lg wow fadeInLeft" data-wow-delay="0.2s" >Logout</a>
	                <a class="btn btn-default btn-lg wow fadeInDown" data-wow-delay="0.2s" data-toggle="modal" data-target="#modal-write" data-backdrop="false">Write</a>
	                <a href="board.do?action=board#board" class="btn btn-amber btn-lg wow fadeInRight" data-wow-delay="0.2s" >Board</a>
            	</c:otherwise>
            </c:choose>
            </li>
        </ul>
    </div>
</div>
<!--/.Mask-->