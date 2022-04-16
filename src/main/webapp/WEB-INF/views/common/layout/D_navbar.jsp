<%--소연 : 환자(U) 로그인 시, 마이페이지 안에 서브메뉴 나의진료리스트, 나의정보수정 쪼개지는 것 nav_submenu_menu--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>홈스피탈</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css"/>
</head>
<style>
    .navbar > div *,
    .navbar > div *:link,
    .navbar > div *:visited,
    .navbar > div *:hover,
    .navbar > div *:active {
        color: #111;
        text-decoration: none;
    }
</style>
<body>
<!-- Header -->
<div>
    <nav class="navbar navbar-expand-md fixed-top" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="/doctor/">
                <img id="logo" style="width: 120px; height: 100%; margin-left: 15px; text-decoration-line: none"
                     alt="" src="/resources/img/design/main_base_nav.png"/>
            </a>
            <button class="navbar-toggler border-dark p-2" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbars" aria-controls="navbars"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars" style="color: black"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbars">
                <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                    <c:choose>
                        <c:when test="${not empty doctor}">
                            <li class="nav-item">
                                <a class="nav-link" href="/doctor/docMedicalList">진료리스트</a>
                            </li>
                            <%--                                <li class="nav-item">--%>
                            <%--                                    <a class="nav-link" href="#">내 정보수정</a>--%>
                            <%--                                </li>--%>
                            <li class="nav-item">
                                <a class="nav-link" href="/doctor/logout.do">로그아웃</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/doctor/docLogin">로그인</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/doctor/join">회원가입</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-sm btn rounded text-white"
                                   style="background-color:#2A2D42; color: #d4d4d4" href="/">환자 페이지로 이동</a>
                            </li>

                        </c:otherwise>
                    </c:choose>

                </ul>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/main/navbar.js"></script>
</body>

</html>
