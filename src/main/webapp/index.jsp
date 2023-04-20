<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/15
  Time: 7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>主页</title>
    <link rel="stylesheet" href="page/page.css">
    <!-- 1. 引入vue -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- 2. 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 3. 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

    <script src="jquery/jquery-3.6.1.min.js"></script>
    <!--    <script src="../../js/include.js"></script>-->
</head>

<body>
<div class="container">
    <!-- 接下来的有点神奇了哈，划重点哦 -->
    <!-- 这里的--i是一个自定义属性 -->
    <a href="experiment1/main1.jsp" style="--i:1">JSP运行环境安装及常用HTML标记使用</a>
    <a href="experiment2/login.jsp" style="--i:2">JSP表单开发及访问数据库</a>
    <a href="experiment3/main.jsp" style="--i:3">JSP内置对象的使用</a>
    <a href="#" style="--i:4">JavaBean及servlet使用</a>
    <a href="#" style="--i:5">Ajax开发及JSP验证码</a>
    <a href="#" style="--i:5">综合训练</a>
    <!--    <a href="#" style="&#45;&#45;i:5">分享</a>-->
    <!--    <a href="#" style="&#45;&#45;i:5">分享</a>-->
    <!--    <a href="#" style="&#45;&#45;i:5">分享</a>-->
</div>
</body>
</html>