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
</head>
<body>
<!-- Header -->
<div>
    <nav class="navbar navbar-expand-md fixed-top w-100" id="navbar">
        <div class="container">
            <div class="d-flex w-100">
                <a class="navbar-brand justify-content-start" href="/" style="font-family: 'Y_Spotlight'">
<%--                    <i class="fa fa-medkit" aria-hidden="true"></i>--%>
                    <img id="logo" style="width: 120px; height: 100%; text-decoration-line: none" alt="" src="/resources/img/design/main_base_nav.png"/>
                </a>
                <button class="navbar-toggler border-dark" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbars" aria-controls="navbars" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="fa fa-bars" style="color: black"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbars">
                    <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/medicalSearch">예약하기</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav ml-auto">
                        <c:choose>
                            <c:when test="${not empty email}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle"
                                       href="#"
                                       data-bs-toggle="dropdown"
                                       id="DropdownMenuLink">마이페이지</a>
                                    <ul class="dropdown-menu"
                                        aria-labelledby="dropdownMenuLink"
                                        aria-expanded="false">
                                        <li>
                                            <a class="dropdown-item" href="/myMedicalList">나의진료내역</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="/pwCheck">내정보수정</a>
                                        </li>
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
                            </c:otherwise>
                        </c:choose>
                    </ul>


                    <c:if test="${empty email}">
                        <ul class="nav nav-pills">
                            <li class="nav-item dropdown">
                                <a class="nav-link btn-warning dropdown-toggle active" data-bs-toggle="dropdown"
                                   href="#" role="button"
                                   aria-haspopup="true" aria-expanded="false">의료 관계자 페이지</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/doctor/">의사 페이지</a>
                                    <a class="dropdown-item" href="/pharmacy/">약국 페이지</a>
                                </div>
                            </li>
                        </ul>
                    </c:if>
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