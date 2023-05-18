<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/5/17
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>添加信息</title>
    <link href="<%=basePath%>experiment6/page.css" rel="stylesheet">
</head>
<body>
<div class="app">
    <form action="#" name="addForm" id="addForm">
        <label> 学号：
            <input placeholder="请输入学生学号" type="text" name="no">
        </label>
        <label>
            姓名：
            <input placeholder="请输入学生姓名" type="text" name="name">
        </label>
        <label>
            性别：
            男 <input type="radio" value="男" name="gender" checked="checked"/>
            女 <input type="radio" value="女" name="gender"/>
        </label>
        <button type="button" onclick="add()">添加</button>
    </form>
    <a href="main.jsp">显示所有学生信息</a>
</div>
<script>

    function add() {
        let xmlHttp = new XMLHttpRequest()
        let querySelector = document.querySelector("#addForm");
        xmlHttp.open("get", "../student/addStu?name=" + querySelector.name.value + "&no=" + querySelector.no.value
            + "&gender=" + querySelector.gender.value, true)
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.status === 200 && xmlHttp.readyState === 4) {
                alert(xmlHttp.responseText)
                location.href = 'main.jsp'
            } else {
                alert(xmlHttp.responseText)
            }
        }
    }
</script>
</body>
</html>
