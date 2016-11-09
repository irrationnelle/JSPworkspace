<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	업로드 결과 : ${requestScope.uploadResult}
	<a href="file.do?action=fileList">[파일 목록으로 돌아가기]</a>
</body>
</html>