<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<style>
.close {
	float: right;
	position: relative;
	top: -28px;
	right: 265px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="head.jsp"%>

	<div class="content content-nav-base shopcart-content">
		<div class="main-nav">
			<div class="inner-cont0">
				<div class="inner-cont1 w1200">
					<div class="inner-cont2">
					    <a href='<c:url value="/book/allProduct"/>' class="active">所有商品</a>
						<a href='<c:url value="/book/buyTodady"/>'>今日团购</a> 
						<a href="information.html">商城资讯</a>
						<a href="about.html">关于我们</a>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-bg w1200">
			<h3>夏季清仓</h3>
		</div>
		<div class="cart w1200">
			<div class="cart-table-th">
				<div class="th th-item">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price">
					<div class="th-inner">单价</div>
				</div>
				<div class="th th-amount">
					<div class="th-inner">数量</div>
				</div>
				<div class="th th-sum">
					<div class="th-inner">小计</div>
				</div>
			</div>
			<form id="form" method="post">
				<div class="OrderList">
					<div class="order-content" id="list-cont">
						<c:forEach items="${carts}" var="c">
							<ul class="item-content layui-clear">
								<li class="th th-item"  style="width: 346px;">
									<div class="item-cont">
										<a href="javascript:;"><img
											src='<c:url value="/${c.bookInforMation.getBook_image()}"/>'
											alt=""></a>
											<br/>
										<div class="text">
											<div class="title" style="line-height: 50px;">${c.bookInforMation.getBook_name()}</div>
											<!--    <p><span>粉色</span>  <span>130</span>cm</p> -->
										</div>
									</div>
								</li>
								<li class="th th-price" style="width:193px;line-height: 80px;"><span class="th-su">${c.bookInforMation.getBook_price()}</span>
								</li>
								<li class="th th-amount">
									<div class="box-btn layui-clear" style="line-height: 80px;">
										
											${c.count}
									</div>
								</li>
								<li class="th th-sum" style="width: 205px;"><span class="sum" style="line-height: 80px;">${c.totalPrice}</span>
								</li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="layui-form-item" style="margin-bottom: 0px;">
					<label class="layui-form-label">收货人</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text"  lay-verify="shouhuor"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="shr" value="${address.address_name}" disabled="disabled"> <span id="clearAuthor" class="close"></span>
					</div>
				</div>

				<div class="layui-form-item"
					style="margin-bottom: 0px; margin-top: 10px;">
					<label class="layui-form-label">收货地址</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text"  lay-verify="shouhuodz"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="shdz" value="${address.address_adr}" disabled="disabled"> <span id="clearAuthor" class="close"></span>
					</div>
				</div>

				<div class="layui-form-item" style="margin-bottom: 0px;margin-top: 10px;">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text"  lay-verify="lianxifs"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="lxfs" value="${address.address_phone}" disabled="disabled"> <span id="clearAuthor" class="close"></span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript">
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['form','mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    var form= layui.form
    // 模版导入数据
    // var html = demo.innerHTML,
    // listCont = document.getElementById('list-cont');
    // mm.request({
    //   url: '../json/shopcart.json',
    //   success : function(res){
    //     listCont.innerHTML = mm.renderHtml(html,res)
    //     element.render();
    //     car.init()
    //   },
    //   error: function(res){
    //     console.log(res);
    //   }
    // })
    // 
    //car.init()
});
</script>

</body>
</html>