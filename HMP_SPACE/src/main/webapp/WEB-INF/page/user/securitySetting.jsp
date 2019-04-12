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
<title>安全设置</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"
	media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body onload="refreshAndClose()">
	<div>
		<header class="layui-elip"
			style="width: 97%;margin-top:65px;text-align:center;font-size:20px;">安全中心</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: auto; margin-right: auto; width: 800px;">
		<form class="layui-form" method="post"
			action="<c:url value='/user/updatePassword'/>">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="user_name" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%"
						value="${userName}" readonly="readonly"> <input
						type="hidden" value="${userId}" id="userId" name="user_id">
						<input type="hidden" value="${flag}" id="flag">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">原密码</label>
				<div class="layui-input-block">
					<input type="password" name="user_password" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%"
						id="oldPassword" lay-filter="oldPassword">
						<span id="ok"><i class="layui-icon layui-icon-ok" style="font-size: 30px; color: #00EE00;"></i></span>
						<span id="close"><i class="layui-icon layui-icon-close" style="font-size: 30px; color: #FF0000;"></i></span>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新密码</label>
				<div class="layui-input-block">
					<input type="password" name="newPassword" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" id="newPassword">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-block">
					<input type="password" name="surePassword" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" id="surePassword">
				</div>
			</div>

			<div class="layui-form-item"
				style="text-align: center;>
    <div class="layui-input-block">
 	  <button class="layui-btn" lay-submit="" lay-filter="demo1">确认修改</button> 
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
  $('#ok').hide();
  $('#close').hide();
  form.render();
  
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
      //监听提交
  form.on('submit(demo1)', function(data){
  	var newPassword=$('#newPassword').val();
  	var surePassword=$('#surePassword').val();
  	layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
  	if(newPassword==surePassword){
  		  return true;
  	}else{
  		  return false;
  	}
	});
});
	 //ajax实现原密码验证
 	  $('#oldPassword').blur(function(){
		 var oldPassword=$('#oldPassword').val();
		 var userId=$('#userId').val();
		 $.ajax({
			type : "post",
			url : "<c:url value='/user/checkOldPassword'/>",
			async : false,
			data :{"oldPassword":oldPassword,"userId":userId},
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				var flag=msg[0];
				if(flag==0){
					$('#ok').show();
					$('#close').hide();
				}else{
					$('#ok').hide();
					$('#close').show();
				}
			}
		});
	});
	
	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
	    	opener.location.reload();
			window.close();
		}
	}
</script>
</body>
</html>