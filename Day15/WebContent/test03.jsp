<%@page import="vo.Book"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>test03.jsp</title>
</head>
<body>
<%
	String name = "rase";
	Book b = new Book("Hop-Frog", "Poe", 1000);
%>
<c:set var="n" value="<%=name %>"/>
�̸� : ${n} <br>

<c:set var="book" value="<%=b %>"/>
å����: ${book.title} <br>
å����: ${book.writer} <br>
å����: ${book.price} <br>
</body>
</html>