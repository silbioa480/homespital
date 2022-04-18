<%--
  Created by IntelliJ IDEA.
  User: styli
  Date: 2022-04-06
  Time: 오후 7:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <%--    <link rel="stylesheet" href="/resources/css/main.css" />--%>
    <link rel="stylesheet" href="/resources/css/pharMain.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <noscript>
        <link rel="stylesheet" href="/resources/css/main2.css"/>
    </noscript>
    <title>Homespital</title>
</head>
<body class="is-preload" style="overflow-x: hidden;">
<%--&lt;%&ndash;약국 메인 section 태영&ndash;%&gt;--%>
<%--<section id="intro" class="main style1 dark fullscreen">--%>
<%--    <div class="content">--%>
<%--        <header>--%>
<%--            <h2>Homespital</h2>--%>
<%--        </header>--%>
<%--        <p>--%>
<%--        <hr>--%>
<%--        <strong> 처방 </strong><strong>| 약 배송</strong><br/></p>--%>
<%--        <footer>--%>
<%--            <a href="#one" class="button style2 down">More</a>--%>
<%--        </footer>--%>
<%--    </div>--%>
<%--</section>--%>
<%--약국메인 배너 수정 태영--%>
<section id="banner">
    <div class="inner">
        <div class="inner-text">
            <h2 class="main-text">home+hospital</h2>
            <h2 class="sub-text">홈스피탈</h2>
        </div>
        <div class="inner-side">
            <p class="textP">약국이 행복해지는</p>
            <p>편리한 방법을 제공합니다.</p>
            <p>홈스피탈</p>
        </div>
    </div>
    <%--약국 메인 화면 이미지 태영      --%>
    <div class="image-box">
        <img width="250px" height="300px" src="/resources/img/design/p_main_image_round.png" alt="로그인메인이미지"/>
    </div>
</section>


<%--<div id="wrapper">--%>
<%--    <div class="pharmacy">--%>
<%--        <div class="pharmacy-content-box">--%>
<%--            <div class="pharmacy-content">--%>
<%--                <a class="pharmacy-link" href="#">환자 내역</a>--%>
<%--            </div>--%>
<%--            <div class="pharmacy-content">--%>
<%--                <a class="pharmacy-link" href="#">처방 하기</a>--%>
<%--            </div>--%>
<%--            <div class="pharmacy-content">--%>
<%--                <a class="pharmacy-link" href="#">처방 내역</a>--%>
<%--            </div>--%>
<%--            <div class="pharmacy-content">--%>
<%--                <a class="pharmacy-link" href="#">처방 배송</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- One -->
<section id="one">
    <div class="gallery">
        <article class="from-left" style="display:table">
            <div class="content box style2 information-left">
                <img class="information-left-in" src="/resources/img/design/p_01.png" width="300" />
            </div>
        </article>
        <article class="from-right" style="display:table">
            <div class="content box style2 information-right">
                <div class="information-right-in">
                    <h1 style="color:#FD9F28  ; font-size: 50px">약국 업무 절감</h1><br>
                    <h2>홈스피탈과 함께<br>무엇이 좋아졌나요?</h2><br>
                    <div>
                        <p>홈스피탈은 전자차트와 연동된 반응형 웹 서비스로<br><br>
                            예약,접수,수납 업무로 바쁜 병원의 행정 업무를 줄여줍니다.<br><br></p>
                        <h3 style="color:#FFCD4A ">약사님들을 위한<br><br>처방전 도착 알림 시스템</h3><br><br>
                        <p>환자의 처방접수/현장 제조 및 결제의 복잡한 업무를 한번에<br><br>
                            약사님들께 대기중인 예약 알림을 사이트로 알려줍니다.</p>
                    </div>
                </div>
            </div>
        </article>
    </div>
    <%--    <a href="#two" class="button style2 down anchored">Next</a>--%>
</section>

<!-- Two -->
<section id="two">
    <div class="gallery">
        <article class="from-left">
            <div class="content box style2 information-left">
                <div class="information-left-in">
                    <h1 style="color:#FD9F28 ;font-size: 48px">환자 재방문율 상승</h1><br>
                    <h2>이미 여려 병원이<br>홈스피탈을 이용하고 있습니다.</h2><br>
                    <div>
                        <p>홈스피탈을 사용하는 병원과 연계하여<br><br>처방전 접수를 사이트로 받아보세요.<br><br>
                            이를 경험한 환자는 우리약국에 다시 예약하게 됩니다.<br><br>
                    </div>
                </div>
            </div>
        </article>
        <article class="from-right">
            <div class="content box style2 information-right">
                <div class="information-right-in">
                    <img src="/resources/img/design/p_02.png" width="600px;" />
                </div>
            </div>
        </article>
    </div>
    <%--    <a href="#work" class="button style2 down anchored">Next</a>--%>
</section>

<%--<!-- Work -->--%>
<section id="Three">
    <div class="gallery">
        <article class="from-left">
            <div class="content box style2 information-left">
                <img class="information-left-in" src="/resources/img/design/p_03.png" width="500px;" />
            </div>
        </article>
        <article class="from-right">
            <div class="content box style2 information-right">
                <div class="information-right-in">
                    <h1 style="color:#FD9F28;font-size: 50px">편리한 약재 전달로</h1><br>
                    <h2>약제 조제에 더욱<br>집중하실 수 있습니다.</h2><br>
                    <div>
                        <p>배송/내방 어느쪽이던<br><br>약사님께서는 약 제조만 하시면 될 수 있도록 하였습니다.<br><br><br>
                            배송의 경우 홈스피탈과 제휴된 라이더가 픽업하고<br><br>
                            환자가 직접 내방할 경우 약사님께서는 약제 조제 후<br><br>다른일을 보시면서 기다리시면 됩니다.</p>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<section id="Four">
    <div class="gallery">
        <article class="from-left">
            <div class="content box style2 information-left">
                <div class="information-left-in">
                    <h1 style="color:#FD9F28;font-size: 50px">자동결제</h1><br>
                    <h2>운영에 대한 고민 <br>편리하게 해결하세요</h2><br>
                    <div>
                        <p>처방전 접수 후<br><br>환자 정보 입력하고,처방 기록하고,결제 안내하고<br><br>반복적인 단순 업무는 이제 그만!!</p>
                        <br><br><br>
                        <h3 style="color:#FFCD4A">전자 진료 시스템으로</h3><br><br>
                        <p>약국과 환자 모두 간편한 접수/예약부터 실물카드 없이<br><br>
                            진료비 자동결제가 가능합니다.<br><br>
                            홈스피탈 접수/예약을 통해<br><br>
                            지난 처방결과 확인도 할 수 있습니다.
                    </div>
                </div>
            </div>
        </article>
        <article class="from-right">
            <div class="content box style2 information-right">
                <div class="information-right-in">
                    <img src="/resources/img/design/p_04.png" width="600px;" />
                </div>
            </div>
        </article>
    </div>
    <%--    <a href="#work" class="button style2 down anchored">Next</a>--%>
</section>

<script src="/resources/js/main/jquery.min.js"></script>
<script src="/resources/js/main/jquery.poptrox.min.js"></script>
<script src="/resources/js/main/jquery.scrolly.min.js"></script>
<script src="/resources/js/main/jquery.scrollex.min.js"></script>
<script src="/resources/js/main/browser.min.js"></script>
<script src="/resources/js/main/breakpoints.min.js"></script>
<script src="/resources/js/main/util.js"></script>
<script src="/resources/js/main/main.js"></script>
<%--스크롤스파이--%>
<script>
    $(document).ready(function () {
        // var scrollResult = 0;
        $(window).scroll(function () {
            var pageTop = $(window).scrollTop();
            var oneT = $('#one').offset().top;
            // var twoT = $('#two').offset().top;

            if (pageTop >= oneT) {
                $('#logo').attr('src', '/resources/img/design/logo_P_nav.png');
            } else {
                $('#logo').attr('src', '/resources/img/design/main_base_nav.png');
            }

        })
    })
</script>
</body>
</html>
