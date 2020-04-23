<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>登录页面</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cookie.js"></script>
	<script type="text/javascript"> 
	function login(){ 
		window.location.href="login.jsp";
	 } 
	
	
	
	 </script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">注册</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="Login?msg=zhu" >
            <input name="cardId" placeholder="身份证号码"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="gender" placeholder="性别"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" placeholder="密码"  type="password" lay-verify="required" class="layui-input">
            <hr class="hr15">
            <input name="password1" placeholder="确认密码"  type="password" lay-verify="required" class="layui-input">
            <hr class="hr15">
            <input value="注册" lay-submit lay-filter="login" lay-filter="add" style="width:49%;" type="submit">
        </form>
      		<input  value="已有账号？去登录" onclick="login()" style="width:49%; float: right; margin-top: -48px" type="submit">
    </div>
</body>
</html>


