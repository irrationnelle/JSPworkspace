<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_lg.jsp</title>
	</head>
	
	<body>
		<table border="1">
			<tr>
				<td colspan="2">
					<jsp:include page="/test04_module/top.jsp"/>
				</td>
			</tr>
			<tr>
				<td>
					<jsp:include page="/test04_module/left.jsp"/>
				</td>
				<td>
					이 부분에 LG 게시판 내용이 들어갑니다.<br>
					이 부분에 LG 게시판 내용이 들어갑니다.<br>
					이 부분에 LG 게시판 내용이 들어갑니다.<br>
					이 부분에 LG 게시판 내용이 들어갑니다.<br>
					이 부분에 LG 게시판 내용이 들어갑니다.<br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<jsp:include page="/test04_module/bottom.jsp"/>
				</td>
			</tr>
		</table>
	</body>
</html>