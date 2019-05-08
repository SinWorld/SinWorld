<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
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
				<div class="th th-item" style="width: 20%">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price" style="width: 20%">
					<div class="th-inner">作者</div>
				</div>
				<div class="th th-price" style="width: 20%">
					<div class="th-inner">单价</div>
				</div>
				<div class="th th-price" style="width: 20%">
					<div class="th-inner">简介</div>
				</div>
				<div class="th th-price" style="width: 20%">
					<div class="th-inner">操作</div>
				</div>
			</div>
			<form id="form" method="post">
				<div class="OrderList">
					<div class="order-content" id="list-cont">
					<input type="hidden" id="url" value='<c:url value="/"/>'>
						<c:forEach items="${collections}" var="c">
							<ul class="item-content layui-clear">
								<li class="th th-item"  style="width: 20%">
									<div class="item-cont">
										<a href="javascript:;"><img
											src='<c:url value="/${c.book_image}"/>'
											alt=""></a>
											<br/>
										<div class="text" style="width: 200px;">
											<div class="title" style="line-height: 50px;">${c.book_name}</div>
											<!--    <p><span>粉色</span>  <span>130</span>cm</p> -->
										</div>
									</div>
								</li>
								<li class="th th-price" style="width:20%;line-height: 80px;"><span class="th-su">${c.book_author}</span>
								</li>
								<li class="th th-price" style="width:20%;line-height: 80px;"><span class="th-su">${c.book_price}</span>
								</li>
								<li class="th th-price" style="width:20%;margin-top: 30px;"><span class="th-su">${c.book_synopsis}</span>
								</li>
								<li class="th th-op" style="width:20%;line-height: 80px;"><a
									onclick="qxCollection(${c.book_id})"><span class="dele-btn" style="line-height: 80px;color: red">取消收藏</span></a></li>
							</ul>
						</c:forEach>
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
   
});
  
  function qxCollection(bookId){
	  layer.confirm('您确定要取消该类商品的收藏吗？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示'},function(index){
			  //获取表单
			  var form=document.getElementById('form');
			  var url=$('#url').val();
			  form.action=url+"/book/qxCollection?bookId="+bookId;
			  form.submit();
			  layer.close(index);
		  }
	  );
  }
</script>

</body>
</html>