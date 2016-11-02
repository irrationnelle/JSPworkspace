<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>test02.jsp</title>
</head>
<body>
제목 : ${requestScope.book.title }
<!-- 여기서 book.title은 book객체가 가지고 있는 title 프로퍼티(property)이다-->
<!-- 객체의 이름이 겹치지 않는다면  requestScope는 작성하지 않아도 괜찮다.-->
제목: ${book.title } <br>
가격이 10000원 이상인가? ${book.price>=10000 } <br>
리스트가 비었는가? ${empty booklist } <br>
가격 + 5000 : ${book.price + 5000 } <br>
똑똑한 숫자 계산 : ${"10" + 5} <br>
booklist의 크기: ${bookList.size() } <br> <!-- 자바 메소드도 사용 가능. 현재 size()메소드 호출-->
</body>
</html>