<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_insert_form.jsp</title>
	</head>
	
	<body>
		<h2>å �԰� ���� �Է�</h2>
		<form action="test04_insert.jsp" method="post">
			����: <input type="text" name="title" size="20"><br>
			���ǻ�: <input type="text" name="pub" size="20"><br>
			���ǳ⵵: <input type="text" name="year" size="10"><br>
			����: <input type="text" name="price" size="20"><br>
			<input type="submit" value="����">
		</form>
		<br>
		<a href="test04_select_list.jsp">
			<button>��ü å ��Ϻ���</button>
		</a>
		<br>
		<a href="test04_index.jsp"><button>���� ȭ������</button></a>
	</body>
</html>