<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>main.jsp</title>
</head>
<body>
<%
	String articlePage = (String)request.getAttribute("articlePage");
%>
	<h2>이곳은 메인 화면입니다.</h2>
	자바 서블릿에게 넘겨받은 결과 데이터: <%=articlePage%> <br>
	
	<a href="board.do?action=writeForm"><button>글쓰기</button></a>
</body>
</html>