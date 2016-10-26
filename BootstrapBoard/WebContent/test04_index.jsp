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
<title>�Խ���</title>
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
        <span class="sr-only">��� �׺���̼�</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">�Խ���</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Ȩ</a></li>
        <li><a href="#about">�Ұ�</a></li>
        <li><a href="#contact">����</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">��Ӵٿ� <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">�׼�</a></li>
              <li><a href="#">�ٸ� �׼�</a></li>
              <li><a href="#">�� �ٸ� �׼�</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">�׺���̼� ���</li>
              <li><a href="#">���� ��ũ</a></li>
              <li><a href="#">���� ��ũ �ϳ� ��</a>
			</li>
          </ul>
        </li>
      </ul>
	  <form class="navbar-form navbar-right" role="form">
        <div class="form-group">
          <input type="text" placeholder="�̸���" class="form-control">
        </div>
        <div class="form-group">
          <input type="password" placeholder="�н�����" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">�α���</button>
      </form>
    </div>
  </div>
</div>

<div class="jumbotron">
  <div class="container">
    <h1>�ȳ�, ģ����!</h1>
    <p>������ ������ �Ǵ� ���� ������Ʈ�� ���� ���ø��Դϴ�. �߾ӿ� ����Ʈ���̶� �θ��� ū ������ �ְ� �� �Ʒ��� ���� ������ ���� 3���� ��ġ�Ͽ����ϴ�. �� ������Ʈ�� ���� �� ������������ Ȱ���غ�����.</p>
    <p><a class="btn btn-primary btn-lg" role="button">�ڼ��� �˾ƺ��� &raquo;</a></p>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <h2>���</h2>
      <p>�츮������ ���� �߱��� �޶� ���ڰ� ���� ������ �ʴµ� �̷� ������ ����� �鼺�� ���ϰ��� �ϴ� �ٰ� �־ ��ħ�� �� ���� ���� ���� ���ϴ� ����� �����϶�. �� �̸� �ҽ��� ���� ���� �������� �ڸ� ����� ������� �Ͽ��� ���� ���� ���� ���⿡ ����ϰ� �ϰ��� �� �����̴϶�.</p>
      <p><a class="btn btn-default" href="#" role="button">������ &raquo;</a></p>
    </div>
    <div class="col-md-4">
      <h2>���</h2>
      <p>�츮������ ���� �߱��� �޶� ���ڰ� ���� ������ �ʴµ� �̷� ������ ����� �鼺�� ���ϰ��� �ϴ� �ٰ� �־ ��ħ�� �� ���� ���� ���� ���ϴ� ����� �����϶�. �� �̸� �ҽ��� ���� ���� �������� �ڸ� ����� ������� �Ͽ��� ���� ���� ���� ���⿡ ����ϰ� �ϰ��� �� �����̴϶�.</p>
      <p><a class="btn btn-default" href="#" role="button">������ &raquo;</a></p>
   </div>
    <div class="col-md-4">
      <h2>���</h2>
      <p>�츮������ ���� �߱��� �޶� ���ڰ� ���� ������ �ʴµ� �̷� ������ ����� �鼺�� ���ϰ��� �ϴ� �ٰ� �־ ��ħ�� �� ���� ���� ���� ���ϴ� ����� �����϶�. �� �̸� �ҽ��� ���� ���� �������� �ڸ� ����� ������� �Ͽ��� ���� ���� ���� ���⿡ ����ϰ� �ϰ��� �� �����̴϶�.</p>
      <p><a class="btn btn-default" href="#" role="button">������ &raquo;</a></p>
    </div>
  </div>

  <hr>
  <footer>
    <p>&copy; Jmnote.com 2014</p>
  </footer>
</div>

</body>
</html>