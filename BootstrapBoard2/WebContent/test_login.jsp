<%@page import="vo.UserInfoVO"%>
<%@page import="repository.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page session="true" %>
<!DOCTYPE html>
<%
	String loginID = request.getParameter("loginID");
	String loginPW = request.getParameter("loginPW");
	
	UserInfoDAO dao = new UserInfoDAO();
	UserInfoVO userinfo = dao.selectPW(loginID);
	if(loginPW.equals(userinfo.getPassword())) {
		session.setAttribute("userID", loginID);
		session.setAttribute("userPW", loginPW);
		out.println("로그인 성공!");
	} else {
		out.println("로그인 실패!");
	}
%>