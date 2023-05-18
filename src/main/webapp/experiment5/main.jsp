<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page isELIgnored="false" %>
<%@ include file="../include/include.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>/experiment5/main.css">
</head>
<body>
<div class="container">
    <div class="box">
        <div class="right ipt-box">
            <div class="container2">
                <div class="register-box">
                    <h2 class="register-title">
                        <span>没有账号，去</span>注册
                    </h2>
                    <form action="#" id="registerForm">
                        <div class="input-box">
                            <input type="text" name="name" placeholder="用户名" class="input">
                            <input type="password" name="password" placeholder="密码" autocomplete="off"
                                   class="password1 input">
                            <label>
                                <input type="text" placeholder="验证码" class="input" name="RegisterCode">
                                <a href="javascript:refreshCode('Register')" class="checkCode">
                                    <img class="checkCode"
                                         src="${pageContext.request.contextPath}/student/checkCode?code=Register"
                                         id="Register"
                                         alt="code"></a>
                            </label>
                            <div class="login_msg">${requestScope.login_msg}</div>
                        </div>
                        <button class="btn-register" onclick="registerGo()" type="button">注册</button>
                    </form>
                </div>
                <div class="login-box slide-up">
                    <div class="center">
                        <h2 class="login-title">
                            <span>已有账号，去</span>登录
                        </h2>
                        <form action="#" id="loginForm">
                            <div class="input-box">
                                <input type="text" name="name" placeholder="用户名" autocomplete="off" class="input">
                                <input type="password" name="password" placeholder="密码" class="passwordLogin input">
                                <label>
                                    <input name="LoginCode" type="text" placeholder="验证码" class="input">
                                    <a href="javascript:refreshCode('Login')">
                                        <img class="checkCode"
                                             src="${pageContext.request.contextPath}/student/checkCode?code=Login"
                                             id="Login" alt="code">
                                    </a>
                                </label>
                            </div>
                            <button onclick="loginGo()" type="button">登录</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>/experiment5/main.js"></script>
<script>
    //切换验证码
    function refreshCode(code) {
        //获取验证码的图片对象
        const elementById = document.getElementById(code);
        elementById.src = "${pageContext.request.contextPath}/student/checkCode?code=" + code + "&time=" + new Date().getTime();
    }

    function registerGo() {
        let data = document.getElementById("registerForm")
        let dataNow = {
            name: data.name.value,
            password: data.password.value,
            RegisterCode: data.RegisterCode.value
        }
        send(dataNow, 'register')
    }

    function loginGo() {
        let data = document.getElementById("loginForm")
        let dataNow = {
            name: data.name.value,
            password: data.password.value,
            LoginCode: data.LoginCode.value
        }
        send(dataNow, 'login')
    }

    function send(data, url) {
        $.post(
            "../student/" + url + "?code=1&name=" + data.name + "&password=" + data.password + "&RegisterCode=" + data.RegisterCode + "&LoginCode=" + data.LoginCode,
            {
                name: data.name,
                password: data.password,
                RegisterCode: data.RegisterCode,
                LoginCode: data.LoginCode
            },
            function (result) {
                if (result.code === 1) {
                    Vue.prototype.$message({
                        message: result.data,
                        type: 'success'
                    });
                    if(url === 'login'){
                        location.href = "<%=basePath%>/experiment4/success.jsp";
                    }
                } else {
                    Vue.prototype.$message.error(result.msg);
                }
            },
            "json"
        )
    }
</script>
</body>
</html>