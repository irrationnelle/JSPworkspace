<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>file_list.jsp</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>파일 번호</th>
			<th>파일 이름</th>
			<th>저장 경로</th>
			<th>다운로드 횟수</th>
			<th>파일 크기</th>		
		</tr>
		<c:if test="${empty requestScope.fileList}">
			<tr>
				<td colspan="5"> 업로드 된 파일이 없습니다 </td>
			</tr>
		</c:if>
		<c:if test="${not empty requestScope.fileList}">
			<c:forEach var="file" items="${fileList}">
				<tr>
					<td>${file.fileNum}</td>
					<td>
						<a href="download.do?action=download&fileNum=${file.fileNum}">${file.fileName}</a>
					</td>
					<td>${file.savedPath}</td>
					<td>${file.downCount}</td>
					<td>${file.fileSize}</td>
				</tr>			
			</c:forEach>
		</c:if>
	</table>
	
	<a href="file.do?action=uploadForm">
		<button>파일 추가</button>
	</a>
</body>
</html>