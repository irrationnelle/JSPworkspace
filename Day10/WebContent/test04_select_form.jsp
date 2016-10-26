<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_select_form.jsp</title>
	</head>
	
	<body>
		<form action="test04_select_book.jsp">
			검색할 책 번호: <input type="number" name="bookID" size="5">
			<input type="submit" value="검색">
		</form>
	<br>
	<a href="test04_index.jsp"><button>메인 화면으로</button></a>
	</body>
</html>