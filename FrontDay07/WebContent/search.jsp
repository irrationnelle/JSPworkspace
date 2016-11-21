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
					// 받아온 검색 결과 아래 문서에 추가시키기
					
					// data에서 find를 통해 item이라 명명된 것을 찾는다.
					// 그리고 item이라 명명된 것을 찾을 때 마다 무명함수로 정의된 함수를 실행시킨다.
					// 그리고 무명함수에서도 find를 통해 각각 iamge, title, author 등으로 명명된 속성을 찾는다.
					// find로 찾는 순서는 네이버 개발자 센터 예시를 확인한다.
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
					// ajax 통신 에러남
					alert("ajax 에러남");
				}
			})
		})
	})
</script>
</head>
<body>
	<h2>네이버 책 검색하기 기능(ajax)</h2>
	<input type="text" id="keyword" name="keyword" size="10">
	<button id="btnSearch">책검색</button>
	<table border="1">
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>가격</th>
		</tr>
		
	</table>
</body>
</html>