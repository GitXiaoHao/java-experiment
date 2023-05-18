<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/26
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>注册</title>
  <link href="<%=basePath%>experiment4/page.css" rel="stylesheet">
</head>
<body>
<div id="app">
  <form action="../student/register" method="post">
    <label>姓名
      <input type="text" placeholder="姓名" name="name"></label>
    <label>密码
      <input type="password" placeholder="密码" name="password">
    </label>
    <button class="button-36" role="button" type="submit">注册</button>
  </form>
  <c:if test="${requestScope.msg}">
    ${requestScope.msg}
    <div class="register">
      <a href="${pageContext.request.contextPath}/experiment4/main.jsp">立即登录</a>
    </div>
  </c:if>
</div>
</body>
</html>
