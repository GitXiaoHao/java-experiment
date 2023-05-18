<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/5/17
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>修改信息</title>
    <link href="<%=basePath%>experiment6/page.css" rel="stylesheet">
</head>
<body>
<%
    String name = request.getParameter("name");
    String no = request.getParameter("no");
    String sex = request.getParameter("sex");
    request.setAttribute("sex",sex);
%>
<div class="app">
    <form action="#" id="updateForm">
        <label> 学号：
            <input placeholder="请输入学生学号" type="text" name="no" value="<%=no%>">
        </label>
        <label>
            姓名：
            <input placeholder="请输入学生姓名" type="text" name="name" value="<%=name%>">
        </label>
        <label>
            性别：
            <c:if test='${requestScope.sex == null || requestScope.sex == "1"}'>
                男 <input type="radio" value="男" name="gender" checked="checked"/>
                女 <input type="radio" value="女" name="gender"/>
            </c:if>
            <c:if test='${requestScope.sex != null || requestScope.sex == "0"}'>
                男 <input type="radio" value="男" name="gender"/>
                女 <input type="radio" value="女" name="gender" checked="checked"/>
            </c:if>
        </label>
        <button type="button" onclick="updateStudent()">修改</button>
    </form>
    <a href="main.jsp">显示所有学生信息</a>
</div>
</body>
<script>
    //先删除

    function updateStudent(){
        let xmlHttp = new XMLHttpRequest()
        let querySelector = document.querySelector("#updateForm");
        xmlHttp.open("get", "../student/addStu?name=" + querySelector.name.value + "&no=" + querySelector.no.value
            + "&gender=" + querySelector.gender.value, true)
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.status === 200 && xmlHttp.readyState === 4) {
                alert("修改成功")
                location.href = 'main.jsp'
            } else {
                alert(xmlHttp.responseText)
            }
        }
    }
</script>
</html>
