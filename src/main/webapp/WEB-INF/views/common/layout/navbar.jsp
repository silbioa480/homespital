<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈스피탈</title>
</head>
<style>
    .active {

    }

    a:link, a:visited, a:hover, a:active {
        color: grey;
        text-decoration: none;
    !important
    }

    .cta-btn {
        align: "right";
    }

</style>
<body>
<header role="banner" style="z-index: 11111;">
<!-- Header -->
<header id="header">
    <nav class="navbar navbar-expand-md">
        <div class="container">
            <a class="navbar-brand" href="/">
                <%--                <img width="40" height="32" src="https://via.placeholder.com/40x32.png?text=Homspital">--%>
                <%--                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">--%>
                <%--                    <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->--%>
                <%--                    <path d="M464 96H384V48C384 21.5 362.5 0 336 0h-160C149.5 0 128 21.5 128 48V96H48C21.5 96 0 117.5 0 144v288C0 458.5 21.5 480 48 480h416c26.5 0 48-21.5 48-48v-288C512 117.5 490.5 96 464 96zM176 48h160V96h-160V48zM368 314c0 8.836-7.164 16-16 16h-54V384c0 8.836-7.164 16-15.1 16h-52c-8.835 0-16-7.164-16-16v-53.1H160c-8.836 0-16-7.164-16-16v-52c0-8.838 7.164-16 16-16h53.1V192c0-8.838 7.165-16 16-16h52c8.836 0 15.1 7.162 15.1 16v54H352c8.836 0 16 7.162 16 16V314z"/>--%>
                <%--                </svg>--%>
                <i class="fa fa-medkit" aria-hidden="true"></i>
                홈스피탈
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars"
                    aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation">
                <span class="bi bi-list"></span>
            </button>

            <div class="collapse navbar-collapse " id="navbars">
                <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/doctorList">예약하기</a>
                    </li>

                </ul>

                <ul class="navbar-nav ml-auto ">
                    <li class="nav-item">
                        <a class="nav-link" href="/loginForm">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/joinForm">회원가입</a>
                    </li>
                    <li class="nav-item cta-btn btn-dark text-white">
                        <a class="nav-link" href="/welcome">의료 관계자 로그인</a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
</header>


<!-- END header -->

<%--<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">--%>
<%--    --%>
<%--</header>--%>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    //$('#'+window.location.pathname.split("/")[1]+'-nav').addClass('btn-dark text-white');
    //$('#'+window.location.pathname.split("/")[1]+'-nav').addClass('btn-dark text-white');
    if (window.location.pathname != "/" &&
        window.location.pathname.split("/")[1] != "place" &&
        window.location.pathname.split("/")[1] != "userInfo") {
        //document.getElementById(window.location.pathname.split("/")[1]+'-nav').classList.add('btn-dark');
        //document.getElementById(window.location.pathname.split("/")[1]+'-nav').classList.add('text-white');
        /* document.getElementById(window.location.pathname.split("/")[1] + '-nav').classList.add('font-weight-bold');
        document.getElementById(window.location.pathname.split("/")[1] + '-nav').classList.add('text-white'); */
        $('#' + window.location.pathname.split("/")[1] + '-nav').addClass("font-weight-bold text-white");
    }
</script>
</body>

</html>