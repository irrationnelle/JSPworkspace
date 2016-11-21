<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>search.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnSearch').on('click', function(){
			$('table tr:gt(0)').remove();
			
			var keyword = $('#keyword').v
			al();
			
			$.ajax({
				url: "searchBook.do",
				type: "post",
				data: "keyword="+keyword,
				dataType: "xml",
				success: function(data){
					// �޾ƿ� �˻� ��� �Ʒ� ������ �߰���Ű��
					
					// data���� find�� ���� item�̶� ���� ���� ã�´�.
					// �׸��� item�̶� ���� ���� ã�� �� ���� �����Լ��� ���ǵ� �Լ��� �����Ų��.
					// �׸��� �����Լ������� find�� ���� ���� iamge, title, author ������ ���� �Ӽ��� ã�´�.
					// find�� ã�� ������ ���̹� ������ ���� ���ø� Ȯ���Ѵ�.
					$(data).find('item').each(function(){
						var title = $(this).find('title').text();
						var image = $(this).find('image').text();
						var author = $(this).find('author').text();
						var price = $(this).find('price').text();
						var publisher = $(this).find('publisher').text();
						
						var result = "<tr>"; 
						result += "<td>" + "<img src='"+image+"'>"+"</td>";
						result += "<td>" + title +"</td>";
						result += "<td>" + author +"</td>";
						result += "<td>" + publisher +"</td>";
						result += "<td>" + price +"</td>";
						result += "</tr>";
						
						$('table').append(result);
					})
				},
				error: function(){
					// ajax ��� ������
					alert("ajax ������");
				}
			})
		})
	})
</script>
</head>
<body>
	<h2>���̹� å �˻��ϱ� ���(ajax)</h2>
	<input type="text" id="keyword" name="keyword" size="10">
	<button id="btnSearch">å�˻�</button>
	<table border="1">
		<tr>
			<th>�̹���</th>
			<th>����</th>
			<th>����</th>
			<th>���ǻ�</th>
			<th>����</th>
		</tr>
		
	</table>
</body>
</html>