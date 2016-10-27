<%@page import="repository.UserInfoDAO"%>
<%@page import="vo.UserInfoVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String modifyName = request.getParameter("modifyName");
	String modifyPW = request.getParameter("modifyPW");
	String userID = (String)session.getAttribute("userID");
	
	System.out.println(modifyName);
	System.out.println(modifyPW);
	
	UserInfoDAO dao = new UserInfoDAO();
	int result = 0;
	
	if(modifyName != null && modifyPW != null) {
		UserInfoVO modifyInfo = new UserInfoVO();
		modifyInfo.setPassword(modifyPW);
		modifyInfo.setUserID(userID);
		result = dao.updatePW(modifyInfo);
		System.out.println("password modify: "+result);
		modifyInfo.setPassword(modifyName);
		result = dao.updateName(modifyInfo);
		System.out.println("name modify:"+(result+1));
		
		session.setAttribute("userID", userID);
		session.setAttribute("userPW", modifyPW);
		session.setAttribute("userName", modifyName);
		
		response.sendRedirect("test_index.jsp");
	} else if (modifyName == null) {
		UserInfoVO modifyInfo = new UserInfoVO();
		modifyInfo.setPassword(modifyPW);
		modifyInfo.setUserID(userID);
		result = dao.updatePW(modifyInfo);
		System.out.println(result);	
		response.sendRedirect("test_index.jsp");
	} else if (modifyPW == null) {
		UserInfoVO modifyInfo = new UserInfoVO();
		modifyInfo.setPassword(modifyName);
		modifyInfo.setUserID(userID);
		result = dao.updateName(modifyInfo);
		System.out.println(result);
		response.sendRedirect("test_index.jsp");
	}
%>