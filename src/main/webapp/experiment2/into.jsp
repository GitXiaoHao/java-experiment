<%@ page import="top.yh.experiment.pojo.UserAccount" %><%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/31
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/include.jsp" %>
<html>
<head>
    <title>进入</title>
</head>
<body>
<%
    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
%>
<div class="con">
    <h1>欢迎<%=
    (user).getUsername()
        %></h1>
</div>
<div class="container">
    <div class="btn"><a href="../experiment3/main.jsp">点击进入图书馆</a></div>
</div>
</body>
<style>
    * {
        /* 初始化 取消页面的内外边距 */
        margin: 0;
        padding: 0;
        /* 这个是告诉浏览器：你想要设置的边框和内边距的值是包含在总宽高内的 */
        box-sizing: border-box;
    }
    body{

        flex-direction: column;
        overflow: hidden;
        background: #222222;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;

    }
    .con {
        margin-top: 80px;
        /* 100%的窗口高度 */
        /*height: 100vh;*/
        /* 行高 */
        line-height: 80px;
        font-size: 30px;
        /* 字间距 */
        letter-spacing: 15px;
    }


    #plane {
        color: #fff;
        font-size: 70px;
        /* 绝对定位 */
        position: absolute;
        /* 弹性布局 水平+垂直居中 */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    h1 {
        color: #333;
        /* 转大写 */
        text-transform: uppercase;
        font-size: 90px;
        /* 相对定位 */
        position: relative;
    }

    h1::after {
        content: "欢迎<%=user.getUsername()%>";
        /* 颜色为透明 */
        color: transparent;
        position: absolute;
        top: 0;
        left: 0;
        background: linear-gradient(to right, #ff69b3, #fe0000, #ffa401, #ffff01, #008102, #40e1d2, #410098, #9400d4);
        /* 以文字的范围来裁剪背景图片 */
        background-clip: text;
        -webkit-background-clip: text;
        /* 将元素裁剪为一个圆形（100px表示圆的直径，0% 50%表示圆心的位置） */
        clip-path: circle(140px at 0% 50%);
        /* 执行动画（动画 时长 infinite表示无限次播放） */
        animation: light 5s infinite;
    }

    /* 定义动画 改变圆心的位置 */
    @keyframes light {
        0% {
            clip-path: circle(100px at 0% 50%);
        }
        50% {
            clip-path: circle(100px at 100% 50%);
        }
        100% {
            clip-path: circle(100px at 0% 50%);
        }
    }


    /*底部按钮*/
    .container{
        /*margin-top: 80px ;*/
        /* 弹性布局 */
        /*display: flex;*/
        color: black;
        /* 允许换行 */
        flex-wrap: wrap;
        /* 将元素靠边对齐 */
        justify-content: space-around;
    }
    .container .btn{
        position: relative;
        width: 200px;
        height: 60px;
        margin: 30px;
    }
    .container .btn a{
        /* 绝对定位 */
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        /* 透明度为0.05的白色背景 */
        background: rgba(255,255,255,0.05);
        /* 阴影 */
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        /* 上下边框 */
        border-top: 1px solid rgba(255,255,255,0.1);
        border-bottom: 1px solid rgba(255,255,255,0.1);
        /* 圆角 */
        border-radius: 30px;
        color: #fff;
        z-index: 1;
        font-weight: 400;
        /* 字间距 */
        letter-spacing: 1px;
        /* 去下划线 */
        text-decoration: none;
        /* 动画过渡 */
        transition: 0.5s;
        /* 溢出隐藏 */
        overflow: hidden;
        /* 背景模糊 */
        backdrop-filter: blur(15px);
    }
    .container .btn:hover a{
        letter-spacing: 5px;
    }
    /* 制作扫光效果 */
    .container .btn a::before{
        content: "";
        /* 绝对定位 */
        position: absolute;
        top: 0;
        left: 0;
        width: 50%;
        height: 100%;
        /* 渐变背景 透明到白色 */
        background: linear-gradient(to right,transparent,rgba(255,255,255,0.15));
        /* 沿X轴倾斜45度，向右平移0像素 */
        transform: skewX(45deg) translateX(0);
        transition: 0.5s;
    }
    .container .btn:hover a::before{
        /* 沿X轴倾斜45度，向右平移200% */
        transform: skewX(45deg) translateX(200%);
    }
    /* 制作按钮上下两个发光层 */
    .container .btn::before,
    .container .btn::after{
        content: "";
        /* 绝对定位，横向居中 */
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        width: 40px;
        height: 10px;
        /* 自定义颜色属性--c, 可通过var函数调用 */
        /* --c: gold; */
        background: var(--c);
        border-radius: 5px;
        box-shadow:
                0 0 5px var(--c),
                0 0 15px var(--c),
                0 0 30px var(--c),
                0 0 60px var(--c)
    ;
        transition: 0.5s;
    }
    .container .btn::before{
        bottom: -5px;
    }
    .container .btn::after{
        top: -5px;
    }
    .container .btn:hover::before,
    .container .btn:hover::after{
        height: 50%;
        width: 80%;
        border-radius: 15px;
        transition-delay: 0.3s;
    }
    .container .btn:hover::before{
        bottom: 0;
    }
    .container .btn:hover::after{
        top: 0;
    }
    /* 分别设置自定义颜色属性--c */
    .container .btn:nth-child(1)::before,
    .container .btn:nth-child(1)::after{
        --c: #12c2e9;
    }
    .container .btn:nth-child(2)::before,
    .container .btn:nth-child(2)::after{
        --c: #c471ed;
    }
    .container .btn:nth-child(3)::before,
    .container .btn:nth-child(3)::after{
        --c: #f64f59;
    }
</style>
</html>
