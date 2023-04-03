<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/31
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>图书管理</title>
</head>
<body>

<div class="container">
    <h4>图书信息列表</h4>
    <div style="float:left;">
        <form class="form-inline"
              action="../library/findLibraryByPage?currentPage=${requestScope.pageInfo.currentPage}&rows=5"
              method="post">
            <div class="form-group">
                <label for="exampleInputName2">书名</label>
                <input name="name" type="text" class="form-control"
                       value="${requestScope.pageInfo.name}"
                       id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">价格</label>
                <input name="address" type="text" class="form-control"
                       value="${requestScope.pageInfo.address}"
                       id="exampleInputName3">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">类别</label>
                <input name="email" type="text" class="form-control"
                       value="${requestScope.pageInfo.email}"
                       id="exampleInputEmail2">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>
    <div style="float: right; margin:5px;">
        <a class="btn btn-primary" href="addUser.jsp">添加用户</a>
        <a class="btn btn-primary" href="javascript:void (0);" id="delSelected">删除选中</a>
        <%--        <a class="btn btn-primary" href="addUser.jsp">删除用户</a>--%>
    </div>
    <%--    选中框的表单--%>
    <form action="${pageContext.request.contextPath}/deleteSelectServlet"
          id="deleteForm"
          method="post">
        <table class="table table-hover">
            <tr>
                <th><label>
                    <input type="checkbox" id="allSelect">
                </label></th>
                <th>编号</th>
                <th>书名</th>
                <th>价格</th>
                <th>类别</th>
                <th>作者</th>
                <th>是否被借阅</th>
                <th>是否被购买</th>
                <th>操作</th>
            </tr>
            <tr v-for="(information,i) in informationList">
                <td>{{i+1}}</td>
                <td>{{information.name}}</td>
                <td>{{information.gender}}</td>
                <td>{{information.age}}</td>
                <td>{{information.address}}</td>
                <td>{{information.qq}}</td>
                <td>{{information.email}}</td>
            </tr>
        </table>
    </form>

    <div id="pagination" style="float: left">
        <c:if test="${requestScope.pageInfo.currentPage == 1}">
            <a style="pointer-events: none; opacity: 0.2;">&#9668;</a>
        </c:if>
        <c:if test="${requestScope.pageInfo.currentPage != 1}">
            <a href="${pageInfoContext.request.contextPath}/findUserByPageServlet?currentPage=${requestScope.pageInfo.currentPage - 1}&rows=5&
                name=${requestScope.pageInfo.name}&
                address=${requestScope.pageInfo.address}&
                email=${requestScope.pageInfo.email}">&#9668;</a>
        </c:if>
        <span>
            <c:forEach begin="1" end="${requestScope.pageInfo.totalPage}" var="i">
                <c:if test="${requestScope.pageInfo.currentPage == i}">
                     <a class="current"
                        href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&
                         name=${requestScope.pageInfo.name}&
                         address=${requestScope.pageInfo.address}&
                         email=${requestScope.pageInfo.email}
                    ">${i}</a>
                </c:if>
                <c:if test="${requestScope.pageInfo.currentPage != i}">
                    <a class=""
                       href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=&
                        name=${requestScope.pageInfo.name}&
                        address=${requestScope.pageInfo.address}&
                        email=${requestScope.pageInfo.email}
                    ">${i}</a>
                </c:if>
            </c:forEach>
        </span>
        <c:if test="${requestScope.pageInfo.currentPage == requestScope.pageInfo.totalPage}">
            <a style="pointer-events: none;opacity: 0.2;">&#9658;</a>
        </c:if>
        <c:if test="${requestScope.pageInfo.currentPage != requestScope.pageInfo.totalPage}">
            <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${requestScope.pageInfo.currentPage + 1}&rows=5&
                name=${requestScope.pageInfo.name}&
                address=${requestScope.pageInfo.address}&
                email=${requestScope.pageInfo.email}
            ">&#9658;</a>
        </c:if>
    </div>
    <label style="float: bottom; font-size: 25px; margin-left: 5px">共${requestScope.pageInfo.totalCount}条记录，共${requestScope.pageInfo.totalPage}页</label>
</div>
</body>

<script>
    function deleteUser(id) {
        //用户提示
        if (confirm("您确定要删除吗?")) {
            location.href = "${pageContext.request.contextPath}/delUserServlet?id =" + id;
        }
    }
        new Vue({
            el: "#deleteForm",
            data() {
                return {
                    informationList: []
                }
            },
            mounted() {
                let _this = this;
                //发送异步请求
                $.post("findUserByPageServlet", {}, function (information) {
                    _this.informationList = information.list;
                });
            }
        })
        // 给删除选中按钮添加单击事件
        const delId = document.getElementById("delSelected");
        delId.onclick = function () {
            if (confirm("您确定要删除吗?")) {
                //判断是否有选中条目
                let flag = false;
                //获取所有的选框
                const name = document.getElementsByName("userid");
                for (let i = 0; i < name.length; i++) {
                    if (name[i].checked) {
                        //有一个选中
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    //有条目选中
                    document.getElementById("deleteForm").submit();
                }
            }
        }
        //使用JQuery
        $("#allSelect").click(function () {
            $(".itemSelect").prop("checked", this.checked);
        });

</script>
</html>

