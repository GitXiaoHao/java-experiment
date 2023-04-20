<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/24
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" language="java" %>
<h1>服务器正在维护...</h1>
<%
  //获取错误信息
  String message = exception.getMessage();
  System.out.println(message);
%>