<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_insert_form.jsp</title>
	</head>
	
	<body>
		<h2>책 입고 내용 입력</h2>
		<form action="test04_insert.jsp" method="post">
			제목: <input type="text" name="title" size="20"><br>
			출판사: <input type="text" name="pub" size="20"><br>
			출판년도: <input type="text" name="year" size="10"><br>
			가격: <input type="text" name="price" size="20"><br>
			<input type="submit" value="저장">
		</form>
		<br>
		<a href="test04_select_list.jsp">
			<button>전체 책 목록보기</button>
		</a>
		<br>
		<a href="test04_index.jsp"><button>메인 화면으로</button></a>
	</body>
</html>