<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
<!-- 引用js，先引用jQuery，在引用bootstarp -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<script type="text/javascript"> 
	function show_confirm() 
	{ 
		var r=confirm("是否确认退出？"); 
		if (r==true) 
		  { 
			window.location.href="Login?msg=remove";
		   } 
		 else 
		   { 
		   alert("你已经取消了此操作！"); 
		   } 
	 } 
 </script>
</head>
<body>
	<div  class="container">
		<h2>房产信息查询系统</h2>
		<h3>用户名：${ulist.getName()} <a onclick="show_confirm()">退出</a></h3>
		<h3><a href="getList">房产信息查询</a></h3>
		<div><h1>欢迎使用房产信息查询系统</h1></div>
	</div>
	
</body>
</html>