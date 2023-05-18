<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/5/12
  Time: 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body {
        overflow: hidden;
        display: flex;
        flex-direction: column;
        text-align: center;
        align-content: center;
        align-items: center;
        justify-content: center;
        margin: 10px 10px;
    }

    a {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .query {
        display: flex;
        flex-direction: row;
    }

    table {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
        width: 500px;
    }

    table td, table th {
        border: 1px solid #cad9ea;
        color: #666;
        height: 30px;
    }

    table thead th {
        background-color: #CCE8EB;
        width: 100px;
    }

    table tr:nth-child(odd) {
        background: #fff;
    }

    table tr:nth-child(even) {
        background: #F5FAFA;
    }

</style>
<body>
<label class="getAll">显示所有学生信息</label>
<div class="query">
    <label>请输入要查询的学生姓名（支持模糊查询）：
        <input type="text" name="stuName" class="queryInput">
        <button type="button" onclick="queryStu()">查询</button>
    </label>
</div>
<c:if test="${sessionScope.stuList != null}">
    <table>
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>功能</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.stuList}" var="stu">
            <tr>
                <td>${stu.id}</td>
                <td>${stu.name}</td>
                <td>${stu.sex == null ? '男' : stu.sex}</td>
                <td>
                    <a href="javascript:void(0);" id="del">删除</a>
                    <a href="javascript:void(0);" id="update">修改</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<a href="<%=basePath%>/experiment6/add.jsp">添加学生信息</a>
</body>
<script>


    function getAllInformation() {
        let xmlHttp = new XMLHttpRequest()
        xmlHttp.open('get', "../student/getStu?name=" + document.querySelector('.queryInput').value, true)
        xmlHttp.send()
        location.reload()
    }
    document.querySelector('.getAll').onclick = getAllInformation
    document.querySelector('#del').onclick = delStu
    document.querySelector('#update').onclick = updateStu

    function updateStu(stu) {
        // delStu(stu)
        location.href = "/experiment6/update.jsp?name=" + stu.name + "&no=" + stu.no + "&sex=" + stu.sex
    }

    function delStu(stu) {
        let xmlHttp = new XMLHttpRequest()
        xmlHttp.open('get', "../student/delStu?name=" + stu.name, true)
        xmlHttp.send()
        getAllInformation()
    }

    function queryStu() {
        getAllInformation()
    }
</script>
</html>
