<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>index.jsp</title>
</head>
<body>
<a href="member.do?action=joinForm"><button>ȸ������</button></a>
<c:if test="${empty sessionScope.loginId}">
	<form action="member.do" method="post"><br>
		ID: <input type="text" name="id" size="20"><br>
		PW: <input type="password" name="password" size="20"><br>
		<input type="hidden" name="action" value="login"> <br>
		<input type="submit" value="�α���">
	</form>
</c:if>
<c:if test="${not empty sessionScope.loginId}">
	<br>
	${sessionScope.loginId} �� �氡�氡.<br>
	<a href="member.do?action=logout"><button>�α׾ƿ�</button></a>
</c:if>
<hr/>
<h3>�� �κ��� �Խ����� �������� �����Դϴ�.</h3>
<hr>
<jsp:include page="board.do?action=boardList"/>
</body>
</html>