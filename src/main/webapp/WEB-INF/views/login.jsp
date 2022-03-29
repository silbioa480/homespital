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

</head>
<body class="is-preload">

<!-- Header -->
<header id="header">
  <h1 style="margin-left: 63px">로 그 인</h1>

</header>

<!-- Signup Form -->
<div class="login_box">
  <div class="content">

<form id="signup-form" method="post" action="#">

  <input class="signup-id" type="email" name="email" id="email" placeholder="Email Address" /><br>
  <input class="signup-pw" type="password" name="password" id="password" placeholder="Password" /><br>
  <input class="btn-login" type="button" value="로 그 인" onClick="loginAjax()"/>
</form>

    <span><a style="color:white; margin-left:45px" href="#">비밀번호 찾기</a> <span><span><a style="color:white; margin-left:10px" href="#">회원가입</a> </span>

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
<script src="/resources/js/login.js"></script>

</body>

</html>
