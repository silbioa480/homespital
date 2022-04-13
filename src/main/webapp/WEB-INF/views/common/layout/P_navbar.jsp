<%--소연 : 환자(U) 로그인 시, 마이페이지 안에 서브메뉴 나의진료리스트, 나의정보수정 쪼개지는 것 nav_submenu_menu--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>홈스피탈</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css"/>
</head>
<style>
    a > i,
    a:link,
    a:visited,
    a:hover,
    a:active {
        color: #111;
        text-decoration: none;
    }

    .cta-btn {
        align: "right";
    }
</style>
<body>
<!-- Header -->
<div>
    <nav class="navbar navbar-expand-md fixed-top w-100" id="navbar">
        <div class="container">
            <div class="d-flex w-100">
                <a class="navbar-brand justify-content-start" href="/pharmacy/" style="font-family: 'Y_Spotlight'">
                    <i class="fa fa-medkit" aria-hidden="true"></i>
                    홈스피탈
                </a>
                <a class="fs-6 align-self-center" href="/pharmacy/">약사 페이지</a>
                <button class="navbar-toggler border-dark" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbars" aria-controls="navbars" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="fa fa-bars" style="color: black"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbars">
                    <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                        <c:choose>
                            <c:when test="${not empty pharmacy}">
                                <li class="nav-item">
                                    <a class="nav-link" href="/pharmacy/pharMedicalList">처방리스트</a>
                                </li>
                                <%--                                <li class="nav-item">--%>
                                <%--                                    <a class="nav-link" href="#">내 정보수정</a>--%>
                                <%--                                </li>--%>
                                <li class="nav-item">
                                    <a class="nav-link" href="/pharmacy/logout.do">로그아웃</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="/pharmacy/loginForm">로그인</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/pharmacy/joinForm">회원가입</a>
                                </li>

                            </c:otherwise>
                        </c:choose>
                        <li class="nav-item">
                            <a class="nav-link btn-sm btn-secondary rounded text-white" href="/">환자 페이지로 이동</a>
                        </li>
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
<script src="/resources/js/main/navbar.js"></script>
</body>
</html>
