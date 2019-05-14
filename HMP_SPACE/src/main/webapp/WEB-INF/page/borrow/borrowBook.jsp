<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借阅书籍</title>
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
		style="width: 97%;margin-top:50px;text-align:center;font-size:20px;">书籍借阅</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: 25px; margin-right: 300px; width: 415px;">
		<form class="layui-form"action="<c:url value='/borrow/addBorrowBook'/>" method="post">
			<input type="hidden" name="bookId" id="bookId">
			<input type="hidden" name="count" id="count">
			<input type="hidden" value="${flag}" id="flag"> 
			<div class="layui-inline" style="margin-bottom: 0px;">
					<label class="layui-form-label" style="width: 170px;">约定还书日期</label>
					<div class="layui-input-inline">
						<input type="text" name="appoint_return_time" id="date" lay-verify="date"
							placeholder="请选择日期" autocomplete="off" class="layui-input"
							style="width: 55.5%">
					</div>
			</div>
			
			<div class="layui-form-item"
				style="text-align: center;margin-left:44px; margin-top:10px;>
    <div class="layui-input-block">
    <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:53%">立即提交</button> 
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
  
   //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
   //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
 	var theRequest=GetRequest();
 	//将url中的参数传入后端
 	$('#bookId').val(theRequest.bookId);
 	$('#count').val(theRequest.count);
});

function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	}
}
	
</script>
</body>
</html>