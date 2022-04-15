<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <!-- Latest minified Bootstrap & JQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>--%>
    <!-- Custom styles for this template -->
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        .notosanskr * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .btn.active {
            display: none;
        }

        .btn span:nth-of-type(1) {
            display: none;
        }

        .btn span:last-child {
            display: block;
        }

        .btn.active span:nth-of-type(1) {
            display: block;
        }

        .btn.active span:last-child {
            display: none;
        }
    </style>
    <%--    <link rel="stylesheet" type="text/css" href="/css/main.css"/>--%>
</head>
<body class="text-center">

<!-- Begin page content -->
<div class="d-flex flex-column justify-content-start"
     style="width: 100%; background-color: #33CC99; color: #2A2D42;">
    <%--    <div class="d-flex align-items-end">--%>
    <img src="/resources/img/design/chat_white_logo.png" width="120px" class="p-2 d-block">
    <h5 class="px-3 text-start" style="color: #2A2D42; font-family: 'Noto Sans KR';"><strong>화상 진료실</strong></h5>


    <%--    </div>--%>
</div>
<main role="main" class="container-fluid">

    <input type="hidden" id="id" name="id" value="${id}"/>
    <div class="col-lg-12 mb-3">
        <div class="mb-3">
            <%--            ${uuid != null ? '유저: '+ uuid : ''}--%>
            <%--            ${id != null ? '@ 채팅방 #'+ id  : ''}--%>
        </div>
        <div class="col-lg-12 mb-3">
            <div class="d-flex justify-content-around mb-3">
                <div id="buttons" class="row">
                    <%--                    <div class="btn-group mr-2" role="group">--%>
                    <%--                        <div class="mr-2" data-toggle="buttons">--%>
                    <%--                            <label class="btn btn-outline-success" id="video_off">--%>
                    <%--                                <input type="radio" name="options" style="display:none" autocomplete="off">Video On--%>
                    <%--                            </label>--%>
                    <%--                            <label class="btn btn-outline-warning active" id="video_on">--%>
                    <%--                                <input type="radio" name="options" style="display:none" autocomplete="off" checked>Video--%>
                    <%--                                Off--%>
                    <%--                            </label>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="mr-2" data-toggle="buttons">--%>
                    <%--                            <label class="btn btn-outline-success" id="audio_off">--%>
                    <%--                                <input type="radio" name="options" style="display:none" autocomplete="off">Audio On--%>
                    <%--                            </label>--%>
                    <%--                            <label class="btn btn-outline-warning active" id="audio_on">--%>
                    <%--                                <input type="radio" name="options" style="display:none" autocomplete="off" checked>Audio--%>
                    <%--                                Off--%>
                    <%--                            </label>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <!--<button type="button" class="btn btn-outline-success" id="audio" data-toggle="button">Audio</button>-->
                    <a href="/meeting/room/${id}/user/${uuid}/exit">
                        <button type="button" class="btn btn-outline-dark" id="exit" name="exit">
                            진료실 퇴장
                        </button>
                    </a>
                </div>
            </div>
        </div>

        <div class="row justify-content-around mb-3 mx-2">
            <div class="col-lg-6 mb-3 border rounded-3 border-dark">
                <video id="local_video" autoplay playsinline muted></video>
            </div>
            <div class="col-lg-6 mb-3 border rounded-3 border-dark">
                <video id="remote_video" autoplay playsinline></video>
            </div>
        </div>

        <div id="chatBox">
        </div>

        <input type="text" id="chatMsg">
        <button id="sendBtn" onclick="sendChat()">전송</button>
    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/meeting/webrtc_client.js"></script>

<%--<input type="text" id="chatId" placeholder="채팅 아이디를 입력하세요"><br/>--%>
<%--<input type="text" id="chatMsg">--%>
<%--<input type="button" id="msgBtn" value="전송"><br>--%>
<%--<textarea rows="10" cols="30"></textarea>--%>
</body>


<script>


    /*
    $(document).ready(function () {
        $("#msgBtn").click(function (e) {

        });
    });
    */

</script>
</html>