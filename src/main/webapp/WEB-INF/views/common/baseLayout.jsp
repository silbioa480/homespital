<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%-- <!-- 목업 코드, 아래 영역을 주석처리하면 로그아웃 처리된 것으로 짜볼 수 있음 -->
<%@ page import="com.ilinbun.mulcam.dto.User"%>
<%!User user = new User(1, "mockup@mock.up", "목업", "", "#", 5, 1);%>
<c:set var="user" value='<%=user%>' />
<!-- 목업 코드 --> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <%--    <link rel="stylesheet" href="/resources/css/main.css" />--%>
    <%--    <noscript><link rel="stylesheet" href="/resources/css/main2.css" /></noscript>--%>
    <style>
        #headertitle:link, #headertitle:visited, #headertitle:hover, #headertitle:active {
            color: black;
        }

        @font-face {
            font-family: 'Yeongdo-Rg';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/Yeongdo-Rg.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'SUIT-Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'SUIT-Regular';
        }
    </style>
</head>
<body>
<%--<div style="background-color:#1abc9c; position: absolute; width: 100%; height:400px;"></div>--%>
<tiles:insertAttribute name="navbar"/>
<%--<div class="container px-4 px-lg-5 mt-5" style="max-width: 1200px;">--%>
<tiles:insertAttribute name="body"/>
<%--</div>--%>
<tiles:insertAttribute name="U_footer"/>


<%--<script src="/resources/js/login/login.js"></script>--%>
</body>
</html>