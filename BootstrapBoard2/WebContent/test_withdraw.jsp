<%@page import="vo.UserInfoVO"%>
<%@page import="repository.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String userID = (String) session.getAttribute("userID");
	UserInfoDAO dao = new UserInfoDAO();
	UserInfoVO withdrawUser = new UserInfoVO();
	withdrawUser.setUserID(userID);
	dao.delete(withdrawUser);
	session.invalidate();
	response.sendRedirect("test_index.jsp");
%>