<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>用户收货地址</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 260px;
	   	cursor:pointer;
	}
</style>
</head>
<body onload="refreshAndClose()">
 <div>
	<header class="layui-elip"
		style="width: 97%;margin-top:50px;text-align:center;font-size:20px;">基本信息</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: 130px; margin-right: 300px; width: 695px;">
		<form class="layui-form"action="<c:url value='/book/editAddress'/>" method="post">
			<input type="hidden" value="${address.address_id}" name="address_id">
			<input type="hidden" value="${flag}" id="flag"> 
			<div class="layui-form-item">
				<label class="layui-form-label">收货人</label>
				<div class="layui-input-block">
					<input type="text" name="address_name" lay-verify="address_name"
						autocomplete="off" class="layui-input" style="width: 56.5%" value="${address.address_name}" id="address_name">
					<span id="clearAddressName" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">联系方式</label>
				<div class="layui-input-block">
					<input type="text" name="address_phone" lay-verify="address_phone"
						autocomplete="off" class="layui-input " style="width: 56.5%" value="${address.address_phone}" id="address_phone">
					<span id="clearAddressPhone" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: -18px;">
				<label class="layui-form-label">收货地址</label>
				<div class="layui-input-block">
					<input type="text" name="address_adr" lay-verify="address_adr"
						autocomplete="off" class="layui-input" style="width: 56.5%" value="${address.address_adr}" id="address">
					 <span id="clearAddress" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item"
				style="text-align: center;margin-left: -140px; margin-top:10px;>
    <div class="layui-input-block">
    <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%">立即提交</button> 
      <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
 <script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
   //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
 	
});
	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		}
	}
	//收件人清除
   	$('#clearAddressName').click(function(){
   		$('#address_name').val("");
   	});
   	//联系方式清除
   	$('#clearAddressPhone').click(function(){
   		$('#address_phone').val("");
   	});
   	//收货地址清除
   	$('#clearAddress').click(function(){
   		$('#address').val("");
   	});
 
</script>
</body>
</html>