<%--
  Created by IntelliJ IDEA.
  User: InSung
  Date: 2022-03-29
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Homespital</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <link rel="stylesheet" href="/resources/css/login.css"/>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>--%>
  <!-- Bootstrap -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <!-- jQuery 정규성검사에서 씀 -->
  <script src="http://code.jquery.com/jquery.js"></script>
  <!-- 모달창 띄우려면 필요 -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <!-- Respond.js   -->
<%--  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--%>

</head>
<body class="is-preload">

<!-- 모달창 -->
<div class="modal fade" id="defaultModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" style="color:#1cb495">알림</h4>
      </div>
      <div class="modal-body">
        <p class="modal-contents"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-modal" style="width:100%" data-dismiss="modal">닫기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--// 모달창 -->


<!-- Header -->
<header id="header">
  <h1 style="margin-left: 63px">로 그 인</h1>

</header>

<!-- Signup Form -->
<div class="login_box">
  <div class="content">

<form id="signup-form" method="post" action="login">

  <div class="form-group" id="divEmail">
  <input class="signup-id" type="email" name="email" id="email" placeholder="Email Address" />
  </div><br>

  <div class="form-group" id="divPassword">
  <input class="signup-pw" type="password" name="password" id="password" placeholder="Password" />
  </div><br>

  <div class="form-group">
    <button type="submit" class="btn-login"> 로 그 인 </button>

  </div>

</form>

    <span><a style="color:white; margin-left:45px" href="/pwsearch">비밀번호 찾기</a> </span><span><a style="color:white; margin-left:10px" href="/signUp">회원가입</a> </span>

    <div class="social">
      <p>SNS계정으로 간편 로그인/회원가입</p>
      <a class="circle google" href="#">
        <i class="fa fa-google-plus fa-fw">

        </i>
      </a>
      <a id="kakao_login" class="circle kakao" href="#">
        <i class="fa fa-kakao-plus fa-fw">

        </i>
      </a>
      <a id="naver_login" class="circle naver" href="#">
        <i class="fa fa-naver-plus fa-fw">

        </i>
      </a>
    </div>
    </div>
</div>


<!-- Footer -->
<footer id="footer">

</footer>

<!-- Scripts -->
<script src="/resources/js/login/login.js"></script>
<script>

  $(function() {
    //모달을 전역변수로 선언
    var modalContents = $(".modal-contents");
    var modal = $("#defaultModal");

    $("form").submit(function (event) {
      var divEmail = $('#divEmail');
      var divPassword = $('#divPassword');

//아이디 검사
      if ($('#email').val() == "") {
        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divEmail.removeClass("has-success");
        divEmail.addClass("has-error");
        $('#email').focus();
        return false;
      } else {
        divEmail.removeClass("has-error");
        divEmail.addClass("has-success");
      }

      //패스워드 검사
      if ($('#password').val() == "") {
        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divPassword.removeClass("has-success");
        divPassword.addClass("has-error");
        $('#password').focus();
        return false;
      } else {
        divPassword.removeClass("has-error");
        divPassword.addClass("has-success");
      }
    });
  });
</script>



</body>

</html>
