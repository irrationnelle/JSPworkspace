<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>test02.jsp</title>
</head>
<body>
���� : ${requestScope.book.title }
<!-- ���⼭ book.title�� book��ü�� ������ �ִ� title ������Ƽ(property)�̴�-->
<!-- ��ü�� �̸��� ��ġ�� �ʴ´ٸ�  requestScope�� �ۼ����� �ʾƵ� ������.-->
����: ${book.title } <br>
������ 10000�� �̻��ΰ�? ${book.price>=10000 } <br>
����Ʈ�� ����°�? ${empty booklist } <br>
���� + 5000 : ${book.price + 5000 } <br>
�ȶ��� ���� ��� : ${"10" + 5} <br>
booklist�� ũ��: ${bookList.size() } <br> <!-- �ڹ� �޼ҵ嵵 ��� ����. ���� size()�޼ҵ� ȣ��-->
</body>
</html>