<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付页面</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<style type="text/css">
	body{ text-align:center} 
	.box{ margin:0 auto; width:810px; height:80px;}
</style>
</head>
<body style="background:#87CEEB">
	<div class="box">
		<span style="font-size: 30px;color: red;margin-top: 10px;">请任选一种支付方式</span>
		<br/>
		<span ><img src="<c:url value="/layui-v2.4.5/layui/images/alipay/alipay.jpg"/>" style="width: 400px;height: 500px;margin-top: 50px;"></span>
		<span ><img src="<c:url value="/layui-v2.4.5/layui/images/alipay/wxpay.png"/>" style="width: 400px;height: 500px;margin-top: 50px;"></span>
		<br>
		<span style="font-size: 40px;color: red;line-height: 70px;">请支付:${sumTotalPrice}￥</span>
		<br>
		 <button class="layui-btn layui-btn-normal" style="width: 720px;height: 40px;font-size: 30px;" type="button" onclick="myOrders()">我的订单</button>
	</div>
	
	<script type="text/javascript">
	function myOrders(){
		window.open("<c:url value='/book/orderCartem'/>");
	}
	</script>
</body>
</html>