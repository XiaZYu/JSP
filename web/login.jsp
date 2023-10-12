<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 25/9/2023
  Time: 上午2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="login-register">
    <div class="contain">
        <div id="big-box" class="big-box">
            <form id="exportForm" class="big-contain" action="User" method="post">
                <div id="title" class="btitle">账户登录</div>
                <div class="bform">
                    <input type="text" id="username" name="username" placeholder="用户名" title="请填写用户名"
                           required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('')" value="${messageModel.object.username}"/>
                    <input type="password" id="password" name="password" placeholder="密码" title="请填写密码"
                           required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('')"/>
                    <span class="errTips">${messageModel.msg}</span>
                    <input type="hidden" id="event" name="event" />
                </div>
                    <button id="bbutton" class="bbutton" onclick="ExpoetDate()">登录</button>
            </form>
        </div>
        <div id= "small-box" class="small-box">
            <div class="small-contain">
                <div id="stitle" class="stitle">你好，朋友!</div>
                <p id="scontent" class="scontent">开始注册，和我们一起旅行</p>
                <button id="sbutton" class="sbutton" onclick="changeType()">注册</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script>
    let i = 1;
    let event = "login";

    function changeType() {
        if (i === 1) {
            document.getElementById("small-box").style.left = "0";
            document.getElementById("big-box").style.left = "30%";
            document.getElementById("title").innerHTML = "创建账户";
            document.getElementById("bbutton").innerHTML = "注册";
            document.getElementById("stitle").innerHTML = "欢迎回来!";
            document.getElementById("scontent").innerHTML = "与我们保持联系，请登录你的账户";
            document.getElementById("sbutton").innerHTML = "登录";
            document.getElementById("password").title =  "密码：包含数字和字母，长度不超过20";
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
            event = "register";
            i++;
        } else {
            document.getElementById("small-box").style.left = "70%";
            document.getElementById("big-box").style.left = "0%";
            document.getElementById("title").innerHTML = "账户登录";
            document.getElementById("bbutton").innerHTML = "登录";
            document.getElementById("stitle").innerHTML = "你好，朋友!";
            document.getElementById("scontent").innerHTML = "开始注册，和我们一起旅行";
            document.getElementById("sbutton").innerHTML = "注册";
            document.getElementById("password").title =  "请填写密码";
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
            event = "login";
            i--;
        }
    }

    function ExpoetDate(){
        document.getElementById("event").value = event;
    }
        //禁用“确认重新提交表单”
        window.history.replaceState(null, null, window.location.href);

</script>
<style>
    .login-register{
        width: 100vw;
        height: 100vh;
        box-sizing: border-box;
    }
    .contain{
        width: 60%;
        height: 60%;
        position: relative;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 0 3px #f0f0f0,
        0 0 6px #f0f0f0;
    }
    .big-box{
        width: 70%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        transform: translateX(0%);
        transition: all 1s;
    }
    .big-contain{
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .btitle{
        font-size: 1.5em;
        font-weight: bold;
        color: rgb(57,167,176);
    }
    .bform{
        width: 100%;
        height: 40%;
        padding: 2em 0;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
    }
    .bform .errTips{
        display: block;
        width: 50%;
        text-align: left;
        color: red;
        font-size: 0.7em;
        margin-left: 1em;
    }
    .bform input{
        width: 50%;
        height: 70px;
        border: none;
        outline: none;
        border-radius: 10px;
        margin-top: 5px;
        padding-left: 2em;
        background-color: #f0f0f0;
    }
    .bbutton{
        width: 20%;
        height: 40px;
        border-radius: 24px;
        border: none;
        outline: none;
        background-color: rgb(57,167,176);
        color: #fff;
        font-size: 0.9em;
        cursor: pointer;
    }
    .small-box{
        width: 30%;
        height: 100%;
        background: linear-gradient(135deg,rgb(57,167,176),rgb(56,183,145));
        top: 0;
        left: 70%;
        position: absolute;
        transform: translateX(0%);
        transition: all 1s;
    }
    .small-contain{
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .stitle{
        font-size: 1.5em;
        font-weight: bold;
        color: #fff;
    }
    .scontent{
        font-size: 0.8em;
        color: #fff;
        text-align: center;
        padding: 2em 4em;
        line-height: 1.7em;
    }
    .sbutton{
        width: 60%;
        height: 40px;
        border-radius: 24px;
        border: 1px solid #fff;
        outline: none;
        background-color: transparent;
        color: #fff;
        font-size: 0.9em;
        cursor: pointer;
    }
</style>
</html>
