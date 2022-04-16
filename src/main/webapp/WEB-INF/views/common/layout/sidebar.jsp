<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

</style>
<link rel="stylesheet" href="/resources/css/sidebar.css">
<body>
<!-- Header -->
<div id="sidebar">
    <div class="d-flex flex-column align-items-center">
        <%--        <span class="image avatar"><img src="/resources/img/doctorList/doctor01.jpg" alt=""/></span>--%>
        <h1 id="logo"><a href="/">Homespital</a></h1>
        <p>${name}님 안녕하세요.</p>

    </div>
    <nav id="nav">
        <ul>
            <li><a href="#one" class="active">필수정보입력</a></li>
            <li><a href="#two">주소 입력</a></li>
            <li><a href="#three">결제 정보 입력</a></li>
        </ul>
    </nav>
    <%--    <footer>--%>
    <%--        <ul class="icons">--%>
    <%--            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>--%>
    <%--            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>--%>
    <%--        </ul>--%>
    <%--    </footer>--%>
</div>


<!-- END header -->

<%--<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">--%>
<%--    --%>
<%--</header>--%>


</body>

</html>