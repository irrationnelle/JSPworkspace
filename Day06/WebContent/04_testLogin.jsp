<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id="rase";
	String pw="1234";
	String name="tyr";
	
	request.setCharacterEncoding("UTF-8");
	if(id.equals(request.getParameter("id")) && pw.equals(request.getParameter("pw"))) {
		response.sendRedirect("04_main.jsp?name="+ URLEncoder.encode(name, "UTF-8"));
	} else {
		response.sendRedirect("04_loginForm.jsp");
	}
%>