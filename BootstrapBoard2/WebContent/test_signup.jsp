<%@page import="vo.UserInfoVO"%>
<%@page import="repository.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>��Ÿ�� ���ø�</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha256-/SIrNqv8h6QGKDuNoLGA4iret+kyesCkHGzVUUV0shc=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
* { font-family: NanumGothic, 'Malgun Gothic'; }
body { padding-top: 50px; }
.starter-template {
  padding: 40px 15px;
  text-align: center;
}
</style>
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
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">�޴� <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li class="active"><a href="test_index.jsp">Ȩ</a></li>
              <li><a href="test_signup_form.jsp">ȸ������</a></li>
              <li><a href="#">�Խ���</a></li>
              <li><a href="#">�۾���</a></li>
              <li><a href="#">�ۻ���</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">�׺���̼� ���</li>
              <li><a href="#">���� ��ũ</a></li>
              <li><a href="#">���� ��ũ �ϳ� ��</a>
			</li>
          </ul>
        </li>
      </ul>
	  <form action="test_login.jsp" class="navbar-form navbar-right" role="form" method="post">
        <div class="form-group">
          <input type="text" name="loginID" placeholder="���̵�" class="form-control">
        </div>
        <div class="form-group">
          <input type="password" name="loginPW" placeholder="�н�����" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">�α���</button>
         <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> <font color="white">����ϱ�</font> 
          </label>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="container">
  <div class="starter-template">
  	<%
		String userName = request.getParameter("signupName");
		String userID = request.getParameter("signupID");
		String userPW = request.getParameter("signupPW");
		
		UserInfoVO userinfo = new UserInfoVO(userName, userID, userPW);
		UserInfoDAO dao = new UserInfoDAO();
		int result = dao.insert(userinfo);
		
		if(result == 1) {
			out.println("<h2>ȸ�������� �Ϸ�Ǿ����ϴ�!</h2>");
		} else {
			out.println("<h2>ȸ�����Կ� �����߽��ϴ�!</h2>");
			out.println("<br>");
			out.println("<h4>�г��� �Ǵ� ���̵� �ߺ�</h4>");
		}
	%>
  </div>
</div>

</body>
</html>