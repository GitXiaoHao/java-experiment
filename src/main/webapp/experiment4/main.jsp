<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/21
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<div id="app">
    <form action="../student/login" method="post">
        <label>姓名
            <input type="text" placeholder="姓名" name="name"></label>
        <label>密码
            <input type="password" placeholder="密码" name="password">
        </label>
        <button type="submit">登录</button>
    </form>
</div>
</body>
</html>
