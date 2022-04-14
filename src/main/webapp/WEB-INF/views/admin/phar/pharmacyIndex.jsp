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
    <noscript>
        <link rel="stylesheet" href="/resources/css/main2.css"/>
    </noscript>
    <title>Homespital</title>
</head>
<body>
<%--약국 메인 section 태영--%>
<section id="intro" class="main style1 dark fullscreen">
    <div class="content">
        <header>
            <h2>Homespital</h2>
        </header>
        <p>
        <hr>
        <strong> 처방 </strong><strong>| 약 배송</strong><br/></p>
        <footer>
            <a href="#one" class="button style2 down">More</a>
        </footer>
    </div>
</section>

<div id="wrapper">
    <div class="pharmacy">
        <div class="pharmacy-content-box">
            <div class="pharmacy-content">
                <a class="pharmacy-link" href="#">환자 내역</a>
            </div>
            <div class="pharmacy-content">
                <a class="pharmacy-link" href="#">처방 하기</a>
            </div>
            <div class="pharmacy-content">
                <a class="pharmacy-link" href="#">처방 내역</a>
            </div>
            <div class="pharmacy-content">
                <a class="pharmacy-link" href="#">처방 배송</a>
            </div>
        </div>
    </div>
</div>

<section id="one" class="main style2 right dark fullscreen">
    <div class="content box style2">
        <header>
            <h2>안내</h2>
        </header>
        <p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
            Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu,
            id varius justo euismod in. Curabitur egestas consectetur magna.</p>
    </div>
    <a href="#two" class="button style2 down anchored">Next</a>
</section>

<!-- Two -->
<section id="two" class="main style2 left dark fullscreen">
    <div class="content box style2">
        <header>
            <h2>편리함</h2>
        </header>
        <p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.
            Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu,
            id varius justo euismod in. Curabitur egestas consectetur magna.</p>
    </div>
    <a href="#work" class="button style2 down anchored">Next</a>
</section>

<!-- Work -->
<section id="work" class="main style3 primary">
    <div class="content">
        <header>
            <h2>Service</h2>
            <p>직접개발한 화상채팅으로 ~~~</p>
        </header>

        <!-- Gallery  -->
        <div class="gallery">
            <article class="from-left">
                <a href="/resources/img/main/01.jpg" class="image fit"><img src="/resources/img/main/01.jpg"
                                                                            title="The Anonymous Red" alt=""/></a>
            </article>
            <article class="from-right">
                <a href="/resources/img/main/02.jpg" class="image fit"><img src="/resources/img/main/02.jpg"
                                                                            title="Airchitecture II" alt=""/></a>
            </article>
            <article class="from-left">
                <a href="/resources/img/main/03.jpg" class="image fit"><img src="/resources/img/main/03.jpg"
                                                                            title="Air Lounge" alt=""/></a>
            </article>
            <article class="from-right">
                <a href="/resources/img/main/04.jpg" class="image fit"><img src="/resources/img/main/04.jpg"
                                                                            title="Carry on" alt=""/></a>
            </article>
            <article class="from-left">
                <a href="/resources/img/main/05.jpg" class="image fit"><img src="/resources/img/main/05.jpg"
                                                                            title="The sparkling shell" alt=""/></a>
            </article>
            <article class="from-right">
                <a href="/resources/img/main/06.jpg" class="image fit"><img src="/resources/img/main/06.jpg"
                                                                            title="Bent IX" alt=""/></a>
            </article>
        </div>

    </div>
</section>

<!-- Contact -->
<section id="contact" class="main style3 secondary">
    <div class="content">
        <header>
            <h2>Say Hello.</h2>
            <p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum.</p>
        </header>
        <div class="box">
            <form method="post" action="#">
                <div class="fields">
                    <div class="field half"><input type="text" name="name" placeholder="Name"/></div>
                    <div class="field half"><input type="email" name="email" placeholder="Email"/></div>
                    <div class="field"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
                </div>
                <ul class="actions special">
                    <li><input type="submit" value="Send Message"/></li>
                </ul>
            </form>
        </div>
    </div>
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
            var twoT = $('#two').offset().top;

            if (pageTop >= oneT && pageTop < twoT) {
                $('#logo').attr('src', '/resources/img/design/logo_P_nav.png');
            } else {
                $('#logo').attr('src', '/resources/img/design/main_base_nav.png');
            }

        })
    })
</script>
</body>
</html>
