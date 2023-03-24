<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/17
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link href="login.css" rel="stylesheet">

</head>
<body>
<div id="app">
    <div class="container login">
        <h1>登录</h1>
        <el-form status-icon :rules="loginRules" ref="loginRuleForm" :model="loginForm">
            <el-input type="text" class="tbx" placeholder="用户名" v-model="loginForm.username"></el-input>
            <el-input type="password" class="tbx" placeholder="密码" v-model="loginForm.password"></el-input>
            <el-button @click="loginSubmitForm('loginRuleForm')">登录</el-button>
            <div>没有账号？<a href="javascript:registerGo()">去注册</a></div>
        </el-form>
    </div>
    <div class="register" style="display:none;">
        <h1>注册</h1>
        <el-form :model="registerForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                 class="demo-ruleForm">
            <el-form-item label="用户名" prop="username">
                <el-input v-model="registerForm.username"></el-input>
            </el-form-item>
            <el-form-item label="姓名" prop="name">
                <el-input v-model="registerForm.name"></el-input>
            </el-form-item>
            <el-form-item label="电话" prop="tel">
                <el-input v-model.number.trim="registerForm.tel"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
                <el-input v-model="registerForm.email"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
                <el-input type="password" v-model.trim="registerForm.password" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="年龄" prop="age">
                <el-input v-model.number="registerForm.age"></el-input>
            </el-form-item>
            <el-form-item label="验证码" prop="code">
                <el-input v-model.number="registerForm.code"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="verificationForm('ruleForm')" class="verification"
                           :disabled="verificationStatus === 0">点击进行邮箱验证
                </el-button>
                <el-button type="primary" @click="registerSubmitForm('ruleForm')" class="submit">提交</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
                <el-button type="info" plain @click="cancel()">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
    <div class="square">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="circle">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
</body>
<script type="module">
    import { Message } from 'element-ui'
    // 挂载到$message上
    Vue.prototype.$message = Message
</script>
<script src="login.js"></script>
</html>
