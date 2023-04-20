<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2022/12/2
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <%--    使用Edge最新的浏览器的渲染技术--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    viewport适口，网页可以根据宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同--%>
    <%--    width 默认宽度与设备宽度相同--%>
    <%--    initial-scale 初始的缩放比 1：1--%>
    <meta name="viewport" charset="width=device-width, initial-scale=1">
    <title>添加图书信息</title>
    <link href="changeBook.css" rel="stylesheet">
    <script src="addBook.js"></script>
</head>
<body>
<div class="container" id="app">
    <div class="title">
        <h3>添加图书页面</h3>
    </div>
    <el-form :model="book" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="图书名" prop="name">
            <el-input v-model.trim.lazy="book.name"></el-input>
        </el-form-item>
        <el-form-item label="图书价格" prop="price">
            <el-input v-model.number="book.price"></el-input>
        </el-form-item>
        <el-form-item label="类别">
            <el-select v-model="book.category" placeholder="类别">
                <el-option
                        v-for="item in options"
                        :key="item.bId"
                        :label="item.name"
                        :value="item.name">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="作者" prop="author">
            <el-input v-model.lazy.trim="book.author"></el-input>
        </el-form-item>
        <el-form-item label="库存" prop="stock">
            <el-input-number v-model="book.stock" @change="handleChange"  size="small"  :min="1" :max="100" label="图书库存"></el-input-number>
        </el-form-item>
        <el-form-item label="图书介绍" prop="introduce">
            <el-input type="textarea" v-model="book.introduce" autosize></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="delivery">
            <el-switch v-model="delivery"></el-switch>
        </el-form-item>
        <el-form-item label="图书备注" prop="desc" v-if="delivery">
            <el-input type="textarea" v-model="book.remarks" autosize></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">立即添加</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
            <el-button type="info" plain @click="goBack">返回</el-button>
        </el-form-item>
    </el-form>
</div>
</body>
</html>
