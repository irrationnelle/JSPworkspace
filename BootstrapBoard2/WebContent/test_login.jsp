<%@page import="vo.UserInfoVO"%>
<%@page import="repository.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page session="true" %>
<!DOCTYPE html>
<%
	String loginID = request.getParameter("loginID");
	String loginPW = request.getParameter("loginPW");
	
	System.out.println(loginID);
	System.out.println(loginPW);
	
	UserInfoDAO dao = new UserInfoDAO();
	UserInfoVO userInfo = dao.selectPW(loginID);
// 	System.out.println(userInfo);
	UserInfoVO userName = dao.selectName(loginID);
// 	System.out.println(userName);
	UserInfoVO userNum = dao.selectUserNum(loginID);
	if(loginPW != null && userInfo != null && userName != null && userNum != null) {
		if(loginPW.equals(userInfo.getPassword())) {
			session.setAttribute("userID", loginID);
			session.setAttribute("userPW", loginPW);
			session.setAttribute("userName", userName.getName());
			session.setAttribute("userNum", userNum.getUserNum());
			response.sendRedirect("test_index.jsp");
		}
	} else {
		out.println("로그인 실패!");
	}
%>