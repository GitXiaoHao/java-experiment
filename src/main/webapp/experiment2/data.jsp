<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="top.yh.experiment.service.UserAccountService" %>
<%@ page import="top.yh.experiment.service.impl.UserAccountServiceImpl" %>
<%@ page import="top.yh.experiment.utils.Result" %>
<%@ page import="top.yh.experiment.pojo.UserAccount" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/12
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>用户所有信息</title>
</head>
<body>
<%
    UserAccountService userAccountService = new UserAccountServiceImpl();
    Result result = userAccountService.getAllUserAccount();
    //Result result = userAccountService.getAllUserAccount();
    Object userAccountList =  result.getData();
    request.setAttribute("userAccountList",userAccountList);
%>
<table class="table table-hover">
    <tr>
        <th><label>
            <input type="checkbox" id="allSelect">
        </label></th>
        <th>用户名</th>
        <th>密码（md5加密）</th>
        <th>姓名</th>
        <th>电话</th>
        <th>邮箱</th>
    </tr>
    <c:forEach items="${userAccountList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
        </tr>
    </c:forEach>
</table>

<a href="into.jsp">点击跳转</a>
</body>
</html>
