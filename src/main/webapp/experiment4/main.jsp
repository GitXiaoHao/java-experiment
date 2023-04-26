<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/21
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>登录</title>
    <link href="<%=basePath%>experiment4/page.css" rel="stylesheet">
</head>
<body>
<div id="app">
    <form action="../student/login" method="post">
        <label>姓名
            <input type="text" placeholder="姓名" name="name"></label>
        <label>密码
            <input type="password" placeholder="密码" name="password">
        </label>
        <!-- HTML !-->
        <button class="button-36" role="button" type="submit">登录</button>
    </form>
    <c:if test="${requestScope.msg != null}">
        ${requestScope.msg}
        <div class="register">

            <a href="register.jsp">没有账户？立即注册</a>
        </div>
    </c:if>
</div>
</body>
</html>
