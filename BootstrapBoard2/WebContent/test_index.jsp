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
              <li><a href="test_board_list.jsp">�Խ���</a></li>
              <li><a href="test_board_write_form.jsp">�۾���</a></li>
              <li><a href="#">�ۻ���</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">�׺���̼� ���</li>
              <li><a href="#">���� ��ũ</a></li>
              <li><a href="#">���� ��ũ �ϳ� ��</a>
			</li>
          </ul>
        </li>
      </ul>
      <%
      	String userID = (String)session.getAttribute("userID");
      	String userPW = (String)session.getAttribute("userPW");
      	String userName = (String)session.getAttribute("userName");
      	
      	UserInfoDAO dao = new UserInfoDAO();
      	UserInfoVO userinfo = dao.selectPW(userID);
      	if(userPW != null && userinfo != null) {
			if(userPW.equals(userinfo.getPassword())) {
				out.println("<div calss=\"navbar-form navbar-right\"><h5><font color=\"white\">"+userName+"�� ȯ���մϴ�!</font></h5></div>");
				out.println("<form action=\"test_logout.jsp\" style=\"display: inline-block; vertical-align: middle; float: none;\">");
				out.println("	<button type=\"submit\" class=\"btn-xs btn-danger\">�α׾ƿ�</button>");
				out.println("</form>");
				out.println("<form action=\"test_setting_form.jsp\" style=\"display: inline-block; vertical-align: middle; float: none;\">");
				out.println("	<button type=\"submit\" class=\"btn-xs btn-warning\">����</button>");
				out.println("</form>");
      		}
      	} else {
      %>
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
      <%  
      	}
      %>
    </div>
  </div>
</div>

<div class="container">
  <div class="starter-template">
    <h1>��Ʈ��Ʈ�� ��Ÿ�� ���ø�</h1>
    <p class="lead">�� ������Ʈ�� ������ �����Ϸ��� �� ������ Ȱ���غ�����.<br> HTML ���� �⺻ ���밡 ���߾��� �ֽ��ϴ�.</p>
  </div>
</div>

</body>
</html>