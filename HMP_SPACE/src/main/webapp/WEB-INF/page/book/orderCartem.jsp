<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body style="background:#87CEEB">
<div style="text-align: center;line-height: 100px;">
	<span style="font-size: 40px;">我的订单</span>
	<input type="hidden" value='<c:url value="/"/>' id="url">
</div>
<table class="layui-hide" id="test" lay-filter="demo"></table>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  var url=$('#url').val();
  table.render({
    elem: '#test'
    ,url:url+"book/ShopCartList"
    ,cols: [[
       {field:'index', width:"20%", title: '序号', sort: true,type:'numbers'}
       ,{field:'order_number', width:"40%",align:'center', title: '订单号'}
       ,{field:'create_time', width:"20%", align:'center', title: '下单时间'}
       ,{field:'involve_money', width:"10%",align:'center', title: '总金额'}
       ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
    ]]
    ,page: true
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	//得到订单主键
    	var messageId=data.form_message_id;
    	//打开操作页面
    	window.open("<c:url value='/book/orderCartemInfor'/>?messageId="+messageId);
    } 
  });
});
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">订单详情</a>
</script>
</body>
</html>