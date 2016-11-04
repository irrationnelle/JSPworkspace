<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>index.jsp</title>
</head>
<body>
<a href="member.do?action=joinForm"><button>회원가입</button></a>
<c:if test="${empty sessionScope.loginId}">
	<form action="member.do" method="post"><br>
		ID: <input type="text" name="id" size="20"><br>
		PW: <input type="password" name="password" size="20"><br>
		<input type="hidden" name="action" value="login"> <br>
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${not empty sessionScope.loginId}">
	<br>
	${sessionScope.loginId} 님 방가방가.<br>
	<a href="member.do?action=logout"><button>로그아웃</button></a>
</c:if>
<hr/>
<h3>이 부분이 게시판이 보여지는 공간입니다.</h3>
<hr>
<jsp:include page="board.do?action=boardList"/>
</body>
</html>