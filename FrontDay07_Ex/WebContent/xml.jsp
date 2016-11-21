<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml;charset=UTF-8" %>
<!-- 페이지 부분은 반드시 text/xml로 되어있어야 함 --> 
<jsp:useBean id="xml" class="vo.MapVO"/>
<!-- src/vo/MapVO.java파일을 xml 정보 생성용으로 사용함-->
<!-- 태그는 자신이 원하는 것으로 -->
<Map>
	<title><%= xml.getTitle() %></title> 
	<lat><%= xml.getLat() %></lat> 
	<lng><%= xml.getLng() %></lng> 
</Map>
