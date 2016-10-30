<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.html"></jsp:include>
</head>
<body>

<jsp:include page="nav.html"></jsp:include>

<div class="container">
	<br>
  	<form action="write.jsp" method="post">
		<table class="table table-striped">
		<tr>
			<td>제목</td>
			<td>
				<input class="form-control" type="text" name="title" size="30">
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				<input class="form-control" type="text" name="writer" size="30">
			</td>
		</tr>
		<tr>
			<td>암호</td>
			<td>
				<input class="form-control" type="password" name="password" size="30">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea class="form-control" rows="10" cols="30" name="content"
					placeholder="여기에 내용을 입력하세요."></textarea>
			</td>
		</tr>
		<tr>
			<td> </td>
			<td>
				<button type="submit" class="btn btn-success">작성완료</button>
			</td>
		</tr>
		</table>
	</form>
</div>


</body>
</html>