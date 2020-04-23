<%@page import="javafx.scene.shape.Line"%>
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
</head>
<body>
	<div class="container">
		<%@ include file="index.jsp" %>
		<div >
			<h3>欢迎使用房产信息查询系统</h3>
			<form action="getList?pageIndex=1">
				<p>查询类型：
					<select name="type">
						<option value="1">用户名</option>
						<option value="2">身份证</option>
					</select>   
					<input type="text" name="text">  
					<input type="submit" value="搜索">
				</p>
			</form>
			<div>
				<table class="table table-hover  table-striped" >
					<tr> 
						<th>序号</th>
						<th>项目名称</th>
						<th>产权人</th>
						<th>身份证号</th>
						<th>房屋类型</th>
						<th>使用面积</th>
						<th>建造时间</th>
					</tr>
					<c:if test="${empty wu}"  var="w">
						<c:forEach items="${pg.pageLists }" var="e">
							<tr>
								<td>${e.id}</td>
								<td>${e.projectName }</td>
								<td>${e.users.name }</td>
								<td>${e.cardId }</td>
								<td>${e.houseType}</td>
								<td>${e.area}</td>
								<td>${e.buildTime }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${!w }">
						<p>抱歉，暂时没有信息！！！</p>
					</c:if>
				</table>
				<div class="row text-center">
					<ul class="pagination">
						<li><a href="getList?pageIndex=${pg.currPage-1 }">&laquo;</a></li><!-- 上一页 -->
								<c:forEach begin="1" end="${pg.totalPages}" varStatus="i">
									<li><a href="getList?pageIndex=${i.index} ">${i.index }</a></li>
								</c:forEach> 
						<li><a href="getList?pageIndex=${pg.currPage+1}">&raquo;</a></li><!--下一页  -->
						<li>共${pg.totalPages}页||当前${pg.currPage}页</li>
					</ul>
				</div> 
			</div>
		</div>
	</div>
</body>
</html>