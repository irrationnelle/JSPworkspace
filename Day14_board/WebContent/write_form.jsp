<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_form</title>
</head>
<body>
  	<form action="board.do" method="post">
  	<input type="hidden" name="action" value="write">
		<table border="1">
		<tr>
			<td>����</td>
			<td>
				<input type="text" name="title" size="30">
			</td>
		</tr>
		<tr>
			<td>�ۼ���</td>
			<td>
				<input type="text" name="writer" size="30">
			</td>
		</tr>
		<tr>
			<td>��ȣ</td>
			<td>
				<input type="password" name="password" size="30">
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
				<textarea   rows="10" cols="30" name="content"
					placeholder="���⿡ ������ �Է��ϼ���."></textarea>
			</td>
		</tr>
		<tr>
			<td> </td>
			<td>
				<button type="submit">�ۼ��Ϸ�</button>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>