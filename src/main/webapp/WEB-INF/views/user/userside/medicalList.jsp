<%--모든 진료항 목 출력페이지 view 태영--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>진료과 목록</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/doctorList.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/medicalList.css"/>
    <link rel="stylesheet" href="/resources/css/sidebar.css">
</head>
<style>
    a:link, a:visited, a:hover, a:active {
        color: grey;
        text-decoration: none;
    !important
    }
</style>
<body class="is-preload">
<%--    <section id="sidebar">--%>
<%--      <div class="inner">--%>
<%--        <nav>--%>
<%--          <ul>--%>
<%--            <li><a href="#intro" class="link-text">진료과 선택</a></li>--%>
<%--            <li><a href="#one" class="link-text">의료진 선택</a></li>--%>
<%--            <li><a href="#two" class="link-text">비대면 진료 신청</a></li>--%>
<%--          </ul>--%>
<%--        </nav>--%>
<%--      </div>--%>
<%--    </section>--%>

<%--side-nav 시작 by 소연 4/7--%>
<div id="sidebar">
    <div class="d-flex flex-column align-items-center">
        <%--        <span class="image avatar"><img src="/resources/img/doctorList/doctor01.jpg" alt=""/></span>--%>
        <h1 id="logo"><a href="/">Homespital</a></h1>
    </div>
    <nav id="nav">
        <ul>
            <li><a href="/list" class="active">진료과선택</a></li>
            <li><a href="/doctorList">의료진선택</a></li>
        </ul>
    </nav>
    <footer>
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
        </ul>
    </footer>
</div>
<%--side-nav 끝 by 소연 4/7--%>

<%--진료과 검색 태영--%>
<div id="searcharea">
    <div class="search">
        <form action="medicalSearch" method="post">
            <input type="search" placeholder="원하시는 진료과를 입력하세요" name="mediSearch" id="mediSearch"/>
            <button type="submit" id="searchMedical">검색</button>
        </form>
    </div>
</div>


<%--진료항목리스트 출력 태영--%>
<div id="wrapper">
    <div class="medicalList">
        <c:forEach var="data" items="${list}">

            <a href="/doctorList?doctor_diagnosis_type=${data.medical_name}" class="databox"
               style="background-image: url('/resources/img/design/${data.medical_image}');
                       width: 200px;height: 200px;background-repeat:no-repeat; display: table">

                <p class=" medicalLink" style="display:table-cell; vertical-align: bottom">
                        ${data.medical_name}</p>
            </a>
        </c:forEach>
    </div>
</div>


<%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>

<%--<script>--%>
<%--&lt;%&ndash;   autocomplete 태영 &ndash;%&gt;--%>
<%--    $(function(){--%>
<%--        $('#mediSearch').autocomplete({--%>
<%--            source:function(request,response){--%>
<%--                $.ajax({--%>
<%--                    type:"post",--%>
<%--                    url:"/mediSearch",--%>
<%--                    dataType:"json",--%>
<%--                    contentType:"application/json; charset=UTF-8",--%>
<%--                    success:function(data,textStatus){--%>
<%--                        console.log(data);--%>
<%--                        var fillterdArray=data.array().filter();--%>
<%--                        console.log(fillterdArray);--%>
<%--                        response(--%>
<%--                            $.map(fillterdArray,function(item){--%>
<%--                                return{--%>
<%--                                    label:item.key,--%>
<%--                                    value:item.value--%>
<%--                                }--%>
<%--                            })--%>
<%--                        )--%>
<%--                    }--%>
<%--                })--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>
</body>
</html>
