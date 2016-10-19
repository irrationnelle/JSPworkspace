<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>악세사리</h2>
	관심항목을 선택하세요.<hr>
	<form action="JavaTest02" method="get">
		<input type="checkbox" name="item" value="shoes"> 신발
		<input type="checkbox" name="item" value="bag"> 가방
		<input type="checkbox" name="item" value="belt"> 벨트
		<input type="checkbox" name="item" value="cap"> 모자
		<input type="checkbox" name="item" value="watch"> 시계
		<input type="checkbox" name="item" value="jewelry"> 쥬얼리
		<input type="submit" value="전송">
	</form>
</body>
</html>