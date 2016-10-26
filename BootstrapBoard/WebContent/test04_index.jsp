<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>게시판</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style type="text/css">
* { font-family: NanumGothic, 'Malgun Gothic'; }
body {
  padding-top: 50px;
  padding-bottom: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha256-/SIrNqv8h6QGKDuNoLGA4iret+kyesCkHGzVUUV0shc=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">토글 네비게이션</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">게시판</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">홈</a></li>
        <li><a href="#about">소개</a></li>
        <li><a href="#contact">연락</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">드롭다운 <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">액션</a></li>
              <li><a href="#">다른 액션</a></li>
              <li><a href="#">또 다른 액션</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">네비게이션 헤더</li>
              <li><a href="#">개별 링크</a></li>
              <li><a href="#">개별 링크 하나 더</a>
			</li>
          </ul>
        </li>
      </ul>
	  <form class="navbar-form navbar-right" role="form">
        <div class="form-group">
          <input type="text" placeholder="이메일" class="form-control">
        </div>
        <div class="form-group">
          <input type="password" placeholder="패스워드" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">로그인</button>
      </form>
    </div>
  </div>
</div>

<div class="jumbotron">
  <div class="container">
    <h1>안녕, 친구들!</h1>
    <p>간단한 마케팅 또는 정보 웹사이트를 위한 템플릿입니다. 중앙에 점보트론이라 부르는 큰 영역이 있고 그 아래에 작은 콘텐츠 영역 3개를 배치하였습니다. 새 웹사이트를 만들 때 시작지점으로 활용해보세요.</p>
    <p><a class="btn btn-primary btn-lg" role="button">자세히 알아보기 &raquo;</a></p>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <h2>헤딩</h2>
      <p>우리나라의 말이 중국과 달라 문자가 서로 통하지 않는데 이런 이유로 어리석은 백성이 말하고자 하는 바가 있어도 마침내 제 뜻을 능히 펴지 못하는 사람이 많으니라. 내 이를 불쌍히 여겨 새로 스물여덟 자를 만드니 사람마다 하여금 쉽게 익혀 매일 쓰기에 편안하게 하고자 할 따름이니라.</p>
      <p><a class="btn btn-default" href="#" role="button">더보기 &raquo;</a></p>
    </div>
    <div class="col-md-4">
      <h2>헤딩</h2>
      <p>우리나라의 말이 중국과 달라 문자가 서로 통하지 않는데 이런 이유로 어리석은 백성이 말하고자 하는 바가 있어도 마침내 제 뜻을 능히 펴지 못하는 사람이 많으니라. 내 이를 불쌍히 여겨 새로 스물여덟 자를 만드니 사람마다 하여금 쉽게 익혀 매일 쓰기에 편안하게 하고자 할 따름이니라.</p>
      <p><a class="btn btn-default" href="#" role="button">더보기 &raquo;</a></p>
   </div>
    <div class="col-md-4">
      <h2>헤딩</h2>
      <p>우리나라의 말이 중국과 달라 문자가 서로 통하지 않는데 이런 이유로 어리석은 백성이 말하고자 하는 바가 있어도 마침내 제 뜻을 능히 펴지 못하는 사람이 많으니라. 내 이를 불쌍히 여겨 새로 스물여덟 자를 만드니 사람마다 하여금 쉽게 익혀 매일 쓰기에 편안하게 하고자 할 따름이니라.</p>
      <p><a class="btn btn-default" href="#" role="button">더보기 &raquo;</a></p>
    </div>
  </div>

  <hr>
  <footer>
    <p>&copy; Jmnote.com 2014</p>
  </footer>
</div>

</body>
</html>