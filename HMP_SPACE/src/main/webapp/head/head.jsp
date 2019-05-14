<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部</title>
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<style type="text/css">
<style type="text/css">
.pointer {
	cursor: pointer;
}

.u_num {
	display: inline-block;
	color: #fff;
	background: #fb8240;
	height: 15px;
	line-height: 14px;
	padding: 0 10px;
	text-align: center;
	border-radius: 7px;
	font-size: 12px;
	font-style: normal;
	float: right;
	margin-top: 0px;
}
</style>
</style>
</head>
<body>
<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a
					href='<c:url value="/book/initIndex"/>'>首页</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<a href="">${userName}</a>
				</div>
				<div class="sp-cart" style="margin-right: 22px;">
					<a href="<c:url value='/book/initShopCart'/>"><i
						class="layui-icon" title="购物车">&#xe698;<em class="u_num">${cartCount}</em></i></a>
				</div>
				<div class="sp-cart" style="margin-right: 22px;">
					<a href="<c:url value='/book/orderCartem'/>"><i
						class="layui-icon layui-icon-file" title="我的订单"><em class="u_num">${myOrderCount}</em></i></a>
				</div>
				<div class="sp-cart" style="margin-right: 22px;">
					<a href="<c:url value='/book/myCollection'/>"><i
						class="layui-icon layui-icon-star-fill " title="我的收藏"><em class="u_num">${myCollectionCount}</em></i></a>
				</div>
				<div class="sp-cart">
					<a href="<c:url value='/borrow/myBorrow'/>"><i
						class="layui-icon layui-icon-file-b " title="我的租借"><em class="u_num">${borrowCount}</em></i></a>
				</div>
			</div>
		</div>
	</div>


	<div class="header">
		<div class="headerLayout w1200">
			<div class="headerCon">
				<h1 class="mallLogo">
					<a href="#" title="图书商城"> <img
						src="../layui-v2.4.5/layui/static/img/logo.jpg"
						style="width: 30%; margin-top: 25px;">
					</a>
				</h1>
			</div>
		</div>
		<div class="header mallSearch">
			<form action="" class="layui-form" novalidate style="left: -350px;">
				<input type="text" name="title" required lay-verify="required"
					autocomplete="off" class="layui-input" placeholder="请输入需要的商品"
					id="productName">
				<button class="layui-btn" lay-submit lay-filter="formDemo"
					type="button" onclick="queryBookByBookName()">
					<i class="layui-icon layui-icon-search"></i>
				</button>
				<input type="hidden" name="" value="">
			</form>
		</div>
	</div>
</body>
</html>