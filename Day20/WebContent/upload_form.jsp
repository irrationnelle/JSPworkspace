<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>upload_form.jsp</title>
</head>
<body>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		just parameter: <input type="text" name="param"><br>
		Select File: <input type="file" name="uploadFile"><br>
		<input type="submit" value="upload">
	</form>
</body>
</html>