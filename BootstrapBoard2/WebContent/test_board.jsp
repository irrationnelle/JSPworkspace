<%@page import="java.sql.Date"%>
<%@page import="repository.ContentsDAO"%>
<%@page import="vo.ContentsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	String userID = (String)session.getAttribute("userID");
	int userNum = (int)session.getAttribute("userNum");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	Date date = new Date(new java.util.Date().getTime());
	String address = request.getRemoteAddr();
	
	int result = 0;
	System.out.println(date);
	
	ContentsVO contentVO = new ContentsVO(userID, userNum, title, contents, date, address);
	ContentsDAO contentDAO = new ContentsDAO();
	result = contentDAO.insert(contentVO);
	System.out.println(result);
	response.sendRedirect("test_board_list.jsp");
%>