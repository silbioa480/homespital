<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>홈스피탈</title>
</head>
<style>
    .active {
    }

    a:link,
    a:visited,
    a:hover,
    a:active {
        color: grey;
        text-decoration: none;
    }

    .cta-btn {
        align: "right";
    }
</style>
<body>
<!-- Header -->
<div>
    <nav class="navbar navbar-expand-md navbar-fixed-top w-100">
        <div class="container">
            <div class="d-flex w-100">
                <a class="navbar-brand justify-content-start" href="/" style="font-family: 'Y_Spotlight'">
                    <i class="fa fa-medkit" aria-hidden="true"></i>
                    홈스피탈
                </a>
                <button
                        class="navbar-toggler border-dark"
                        type="button"
                        data-toggle="collapse"
                <%--                        data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown"--%>
                        data-target="#navbars"
                        aria-controls="navbars"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="fa fa-bars" style="color: black"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbars">

                    <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/list">예약하기</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav ml-auto">
                        <c:choose>
                            <c:when test="${not empty email}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                       id="DropdownMenuLink">마이페이지</a>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink"
                                        aria-expanded="false">
                                        <li><a class="dropdown-item" href="/myMedicalList">나의진료내역</a></li>
                                        <li><a class="dropdown-item" href="/modifyForm">내정보수정</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/logout.do">로그아웃</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="/loginForm">로그인</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/joinForm">회원가입</a>
                                </li>
                                <li class="nav-item cta-btn btn-dark text-white">
                                    <a class="nav-link" href="#">의료 관계자 로그인</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>

<!-- END header -->

<%--
<header
  class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom"
>
  --%> <%-- --%> <%--
    </header>
    --%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--<script>--%>
<%--    //$('#'+window.location.pathname.split("/")[1]+'-nav').addClass('btn-dark text-white');--%>
<%--    //$('#'+window.location.pathname.split("/")[1]+'-nav').addClass('btn-dark text-white');--%>
<%--    if (--%>
<%--        window.location.pathname != "/" &&--%>
<%--        window.location.pathname.split("/")[1] != "place" &&--%>
<%--        window.location.pathname.split("/")[1] != "userInfo"--%>
<%--    ) {--%>
<%--        //document.getElementById(window.location.pathname.split("/")[1]+'-nav').classList.add('btn-dark');--%>
<%--        //document.getElementById(window.location.pathname.split("/")[1]+'-nav').classList.add('text-white');--%>
<%--        /* document.getElementById(window.location.pathname.split("/")[1] + '-nav').classList.add('font-weight-bold');--%>
<%--        document.getElementById(window.location.pathname.split("/")[1] + '-nav').classList.add('text-white'); */--%>
<%--        $("#" + window.location.pathname.split("/")[1] + "-nav").addClass(--%>
<%--            "font-weight-bold text-white"--%>
<%--        );--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
