<%@ page import="top.yh.experiment.pojo.Library" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>图书管理</title>
    <link href="listPage.css" rel="stylesheet">
</head>
<body>
<div class="container" id="app">
    <div class="title">
        <h4>图书信息列表</h4>
    </div>
    <div class="query-button-container">
        <el-form :inline="true" :model="queryList" class="demo-form-inline" style="float: left">
            <el-form-item label="书名">
                <el-input v-model="queryList.queryName" placeholder="书名"></el-input>
            </el-form-item>
            <el-form-item label="价格">
                <el-input v-model.number="queryList.queryPrice" placeholder="价格"></el-input>
            </el-form-item>
            <el-form-item label="类别">
                <el-select v-model="name" placeholder="类别">
                    <el-option
                            v-for="item in options"
                            :key="item.bId"
                            :label="item.name"
                            :value="item.name">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="el-icon-search" @click="query">搜索</el-button>
            </el-form-item>
        </el-form>
    </div>
    <div style="float: right;" class="function-button">
        <el-button type="success" @click="addBook">添加图书</el-button>
        <el-button type="danger" id="delSelected">删除选中</el-button>
        <el-button type="success" @click="dialogFormVisible = true">添加图书分类</el-button>
        <el-button type="success" @click="goShopping">购物车</el-button>
    </div>
    <%--    选中框的表单--%>
    <div class="table-container">
        <form id="deleteForm">
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
                    <td><label>
                        <input class="itemSelect" type="checkbox" name="userid" value={{information.id}}>
                    </label></td>
                    <td>{{i + 1}}</td>
                    <td>{{information.name}}</td>
                    <td>{{information.price}}</td>
                    <td>{{information.category}}</td>
                    <td>{{information.author}}</td>
                    <td>{{information.borrowedOrNot === 1 ? '是' : '否'}}</td>
                    <td>{{information.whetherToPurchased === 1 ? '是' : '否'}}</td>
                    <td>
                        <el-button type="success" plain size="mini" @click="operationShopping(information,true)">添加购物车</el-button>
                        <el-button type="danger" plain size="mini" @click="operationShopping(information,false)">删除</el-button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="pagination" style="float: left">
        <el-pagination
                background
                layout="prev, pager, next"
                :total="pageInfo.pages">
        </el-pagination>
    </div>
    <el-dialog title="添加分类" :visible.sync="dialogFormVisible">
        <el-form :model="bookCategory">
            <el-form-item label="分类名称" :label-width="formLabelWidth">
                <el-input v-model="bookCategory.name" autocomplete="off"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="addBookCategory">确 定</el-button>
        </div>
    </el-dialog>
</div>

</body>
<script>
    function deleteUser(id) {
        //用户提示
        if (confirm("您确定要删除吗?")) {

        }
    }

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

    new Vue({
        el: '#app',
        watch:{
          name(val){
              console.log(val)
              this.queryList.queryCategory = val
          }
        },
        data() {
            return {
                shopping:[

                ],
                //分类
                name: '',
                formLabelWidth: '120px',
                bookCategory: {
                    name: ''
                },
                dialogFormVisible: false,
                //行数
                rows: 5,
                //模糊查询
                queryList: {
                    //模糊查询的图书名
                    queryName: null,
                    //模糊查询的图书价格
                    queryPrice: null,
                    //模糊查询的类别
                    queryCategory: null,
                },
                //类别选项
                options: [{
                    bId: '选项1',
                    name: '黄金糕'
                }],
                //图书信息
                informationList: [],
                //分页信息
                pageInfo: {}
            }
        },
        mounted() {
            this.getLibraryByPage()
        },
        //创建后加载数据
        created() {
            this.loadCategory()
        },
        methods: {
            //加载分类类别
            loadCategory() {

                let _this = this;
                $.post("../library/findLibraryCategory", {}, function (result) {
                    if (result.code === 1) {
                        _this.options = result.data
                        // 存储json字符串数据到本地
                        localStorage.setItem('options', JSON.stringify(_this.options))
                    } else {
                        Vue.prototype.$message.error(result.msg);
                    }
                })
            },

            //模糊查询
            query() {
                const currentPage =
                    this.pageInfo.pageNum
            },
            //发送请求下一页的数据
            /**
             * 查找指定的页面
             * @param num 需要+1 还是 -1
             * @param flag 如果为true 就是+1 -1 如果false 就是直接查找第num页
             */
            findNextPage(num = 0, flag) {
                const currentPage = flag ?
                    this.pageInfo.pageNum + num :
                    num
                this.getLibraryByPage(currentPage)
            },
            //分页查询图书
            getLibraryByPage(currentPage = 0) {
                let _this = this
                //发送异步请求
                axios({
                    method: 'post',
                    url: "../library/findLibraryByPage",
                    data: {
                        currentPage: currentPage,
                        rows: _this.rows,
                        queryList: _this.queryList
                    }
                }).then(response => {
                    let result = response.data
                    if (result.code === 1) {
                        _this.informationList = result.data.list
                        _this.pageInfo = result.data
                    } else {
                        Vue.prototype.$message.error(result.msg);
                    }
                })
            },
            //添加图书
            addBook() {
                location.href = "addBook.jsp"
            },
            addBookCategory() {
                let _this = this
                //添加图书分类
                $.post("../library/addBookCategory", {
                    name: _this.bookCategory.name
                }, function (result) {
                    if (result.code === 1) {
                        //再重新加载
                        Vue.prototype.$message({
                            message: '添加成功',
                            type: 'success'
                        });
                        _this.loadCategory()
                        _this.dialogFormVisible = false
                        _this.bookCategory.name = ''
                    } else {
                        Vue.prototype.$message.error(result.msg)
                    }
                })
            },
            //购物车
            goShopping(){
                if(this.ifLogin()){
                    let tempShopping = JSON.parse(localStorage.getItem("shopping"));
                    if(tempShopping !== null){
                        tempShopping.forEach(temp => this.shopping.push(temp))
                    }
                    localStorage.setItem("shopping",JSON.stringify(this.shopping))
                    location.href = "shopping.jsp"
                }
            },
            //添加商品
            /**
             * 添加或者删除商品
             * @param information
             * @param flag true为添加
             */
            operationShopping(information,flag = false){
                //判断是否登录
                if(this.ifLogin()){
                    if(flag){
                        //添加商品
                        this.shopping.push(information)
                    }else{

                    }
                }

            },
            ifLogin(){
                return true
                //判断是否登录
                const user = localStorage.getItem('user');
                if(user === null){
                    //没有登录
                    this.$message({
                        dangerouslyUseHTMLString: true,
                        message: '<strong>没有登录! <a href="../experiment2/main.jsp">点击登录</a></strong>'
                    });
                    return false
                }
                return true
            }
        }

    })
</script>
</html>

