<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_form.jsp</title>
</head>
<body>
<form action="board.do?action=write" method="post">
	<table>
		<tr>
			<td>������:</td>
			<td><input type="text" name="title" size="30"></td>
		</tr>
		<tr>
			<td>�ۼ���:</td>
			<td><input type="text" name="writer" size="30"></td>
		</tr>
		<tr>
			<td>��й�ȣ:</td>
			<td><input type="password" name="password" size="30"></td>
		</tr>
		<tr>
			<td>�۳���:</td>
			<td>
				<textarea name="content" rows="15" cols="30" placeholder="���⿡ ������ �Է��ϼ���"></textarea>
			</td>
		</tr>
	</table>
	<button type="submit">�ۼ��Ϸ�</button>
</form>
</body>
</html>