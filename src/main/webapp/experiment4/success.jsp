<%@ page import="top.yh.experiment.pojo.Student" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/26
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>登录成功</title>
    <link href="<%=basePath%>experiment4/page.css" rel="stylesheet">
</head>
<body>
<div id="app">
    <c:if test="${sessionScope.student != null}">
        登录成功！欢迎回来 ${sessionScope.student.name}
    </c:if>

</div>
</body>
</html>
