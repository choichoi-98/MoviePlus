<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>친구목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style>
    .divFriendTr {
        height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-left: 14px;
        margin: 0px;
        width: calc(100% - 14px);
        clear: both;
    }

    .divChatTr {
        min-height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-left: 10px;
        margin: 0px;
        width: calc(100% - 10px);
        clear: both;
        font-size: 13px;
    }

    .divChatTrMy {
        min-height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-right: 30px;
        margin: 0px;
        width: calc(100% - 30px);
        clear: both;
        font-size: 13px;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script>
  function openChat(){
    $("#MAIN").css("leff", ($(document).width()+ 100));
    $("#MAIN").load("chat.html", function(){
        $("#MAIN").animate({left:0, top:0});
    });
  }
</script>
</head>
<body style="margin: 0px">

  <div style="width:100%; display:inline-block; height: 630px; padding:0px; margin: 0px; position: relative; left: 0px; top:0px;" id="MAIN">
    <div style="width: 20%; display: inline-block; height: 100%; background-color: #ececed; padding: 0px; margin: 0px; padding-top: 10px; text-align: center; float: left;">
        <i class="fas fa-user" style="font-size: 28px; color: #909297;"></i>
    </div>
    <div style="width: 76%; display: inline-block; height: 100%; background-color: #ffffff; padding: 0px; margin: 0px; padding-top: 10px; float: left;">
        <div style="width: 100%; height: 30px; padding: 0px; margin: 0px; color: black; padding-left: 14px;">
            친구
        </div>
        <div style="width: 100%; height: calc(100% - 30px); padding: 0px; margin: 0px; margin-bottom: -30px; color: black; overflow-y: auto" id="divMemberList">
            <div class="divFriendTr">
                <div style="float: left;">
                    <img src="/kakaoimg/kakaoicon.png" style="width: 33px; height: 33px;">
                </div>
                <div style="float: left; margin-left: 7px;" onclick="openChat();">
                    슈퍼맨
                </div>
            </div>
            <div class="divFriendTr">
                <div style="float: left;">
                    <img src="/kakaoimg/kakaoicon.png" style="width: 33px; height: 33px;">
                </div>
                <div style="float: left; margin-left: 7px;">
                    스파이더맨
                </div>
            </div>
        </div>
    </div>
</div>
<div style="width: 0%; height: 0px; padding: 0px; margin: 0px; position: relative; left: 0px; top: 0px;" id="BACKGROUND"></div>
</body>
</html>