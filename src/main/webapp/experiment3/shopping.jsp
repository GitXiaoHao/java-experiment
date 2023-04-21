<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/4/20
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="shopping.css">
</head>
<body>
<div class="wrap clearfix" id="app">
    <div class="location">当前位置：<a href="main.jsp">首页</a><span>&gt;</span><b class="red">购物车</b></div>
    <table width="100%" class="cartTable" cellspacing="0" cellpadding="10px">
        <!-- 首行 -->
        <tr class="title">
            <td width="50"><input type="checkbox" name="" class="choose_all"></td>
            <td width="100" class=""><span style="margin-left: -10px;">全选</span></td>
            <td width="150">图片</td>
            <td width="400">商品信息</td>
            <td width="150">单价（元）</td>
            <td width="150">数量</td>
            <td width="150">金额（元）</td>
            <td width="80">操作</td>
        </tr>

        <!-- 商品具体信息 -->
        <tr class="row" v-for="(item,i) in shopping" :key="i">
            <td><input type="checkbox" name="" class="choose"></td>
            <td class="tal"><a href="#" class="pic"><img :src="item.lImage" alt=""></a></td>
            <td class="tal"><a href="#">{{ item.introduce.substring(0,30) }}</a></td>
            <td>
                <span class="tdl">{{item.price}}</span>
                <br>
                <b class="unit">{{item.price}}</b>
            </td>
            <td>
                <el-input-number v-model="num" @change="handleChange(item)" :min="1" :max="50" label="图书数量"></el-input-number>
            </td>
            <td><b class="u-price">{{item.price}}</b></td>
            <td><a href="#" class="btn-del">删除</a></td>
        </tr>
        <tr class="count">
            <td colspan="7">
                <div class="jiesuan clearfix">
                    <div class="left fl">
                        <p><input type="checkbox" name="" class="choose_all"> 全选&nbsp;&nbsp;&nbsp;<a href="#" class="del_check">删除选中商品</a></p>
                    </div>
                    <div class="right fr clearfix">
                        <p>商品总计：￥465.00</p>
                        <p>活动优惠：-￥0.00</p>
                        <p>已选商品<span class="red t-number"> 0 </span>件 总价(不含运费、税费)：<span class="red t-price">￥0.00</span></p>
                        <!-- <div><a href="#" class="btn pay">结算</a></div> -->
                        <a href="#" class="btn pay fr">结算</a>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

<!-- 引入JS文件 -->
<script src="shopping.js"></script>
</body>
</html>
