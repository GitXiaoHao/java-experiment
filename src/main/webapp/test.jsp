<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/1
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String thisName, thisPassword, reqMethod, reqParam;
    String[] param;
    thisName = thisPassword = "";
    reqMethod = request.getMethod();
    if ("GET".equalsIgnoreCase(reqMethod)) {
        reqParam = request.getQueryString();
        if (reqParam != null) {
            param = reqParam.split("&");
            thisName = param[0].substring("name".length() + 1);
            thisPassword = param[1].substring("pwd".length() + 1);
        }
    } else if ("POST".equalsIgnoreCase(reqMethod)) {
        thisName = request.getParameter("name");
        thisPassword = request.getParameter("pwd");
    }
    if ("yu".equalsIgnoreCase(thisName) && "123456".equalsIgnoreCase(thisPassword)) {
        response.getWriter().println(reqMethod + "was used. Hello, " + thisName);
    }else{
        response.getWriter().println("Failed to sign in!");
    }
%>
</body>
</html>
