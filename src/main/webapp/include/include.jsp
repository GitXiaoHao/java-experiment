<%--
  Created by IntelliJ IDEA.
  User: yuhao
  Date: 2023/3/22
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../error/error.jsp" isELIgnored="false" %>
<%--    导入css全局样式--%>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../jquery/jquery-3.6.1.min.js"></script>
<!-- 1. 引入vue -->
<script src="../vue/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- 2. 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 3. 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="module">
    import { Message } from 'element-ui'
    import axios from 'axios'
    // 挂载到$message上
    Vue.prototype.$message = Message
</script>