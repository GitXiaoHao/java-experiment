<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/15
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--    使用Edge最新的浏览器的渲染技术--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    viewport适口，网页可以根据宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同--%>
    <%--    width 默认宽度与设备宽度相同--%>
    <%--    initial-scale 初始的缩放比 1：1--%>
    <meta name="viewport" charset="width=device-width, initial-scale=1">
    <title>Document</title>
    <link href="main1.css" rel="stylesheet">
    <script src="../jquery/jquery-3.6.1.min.js"></script>
    <!-- 1. 引入vue -->
    <script type="text/babel" src="../vue/vue.min.js"></script>
</head>
<body>
<div id="app">
    <div class="head">
        <div class="msg-register">
            <span> 没有账户？</span>
            <a href="#" class="switch-register">注册</a>
        </div>
        <div class="msg-login" style="display:none;">
            <span>已有账户</span>
            <a href="#" class="switch-login">登录</a>
        </div>
    </div>
    <!--左边-->
    <div class="left">
        <a class="personalInformation">点击此处查看个人信息</a>
        <div class="information" style="display: none">
            <span>班级：K计算机212</span>
            <span>学号：2021900456</span>
            <span>姓名：余豪</span>
            <span>个人信息：无</span>
        </div>
    </div>
    <div class="container">
        <div class="login-wrapper">
            <div class="header">登录页面</div>
            <div class="form-wrapper">
                <label>
                    <input type="text" name="username" placeholder="用户名"
                           class="input-item" v-model="loginForm.loginUsername">
                </label>
                <label>
                    <input type="password" name="password" placeholder="密码"
                           class="input-item" v-model="loginForm.loginPassword">
                </label>
                <div class="btn">登录</div>
            </div>
        </div>
        <div class="register-wrapper" style="display:none;">
            <div class="header">注册页面</div>
            <div class="form-wrapper">
                <label>
                    <input type="text" name="username" placeholder="用户名" class="input-item" v-model="registerForm.registerUsername">
                </label>
                <label>
                    <input type="password" name="password" placeholder="密码" class="input-item" v-model="registerForm.registerPassword">
                </label>
                <label class="input"> 性别
                    <span class="gender">    <input type="radio" name="sex" value="1" v-model="registerForm.sex"
                                                    checked/>
                  男</span>
                    <span class="gender2">   <input type="radio" name="sex" value="0" v-model="registerForm.sex"/>
                  女</span>
                </label>
                <label class="hobby">兴趣爱好
                    <input type="checkbox" v-model="registerForm.hobby" value="travel" name="hobby"/>旅游
                    <input type="checkbox" v-model="registerForm.hobby" value="motion" name="hobby"/>运动
                    <input type="checkbox" v-model="registerForm.hobby" value="deliciousFood" name="hobby"/>美食
                </label>
                <div class="btn">注册</div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="main-jsp.js"></script>
</html>
