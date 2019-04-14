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
<title>注册页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<style>
	#ok:hover{
		cursor:pointer;
	}
	#ok{
		/* float: right; */
	    position: relative;
	    top: -17px;
	    right: -46px;
	}
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 333px;
	   	cursor:pointer;
	}
</style>
</head>
<body>
	<div>
		<header class="layui-elip"
			style="width: 97%;margin-top:150px;text-align:center;font-size:40px;">找回密码</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: auto; margin-right: 340px; width: 660px;">
		<form class="layui-form"  method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="user_name" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 40.5%" id="userName">
				   <span id="clearUserName" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
		
			
			<div class="layui-form-item">
				<label class="layui-form-label">QQ邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="user_email" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 40.5%" id="email">
					<span id="clearEmail" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			<!--   <button class="layui-btn"  id="sendEmail" type="button">发送邮件</button> -->
				<div>
					<span id="ok">发送邮件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 					<i class="layui-icon layui-icon-release " title="发送邮件" id="sendEmail"></i></span>
 -->					<button class="layui-btn layui-btn-radius layui-btn-normal" id="sendEmail" type="button" style="line-height: 30px;height: 30px;">发送邮件</button>
				</div>
			<div class="layui-form-item">
				<label class="layui-form-label">验证码</label>
				<div class="layui-input-block">
					<input type="text" name="user_code" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 40.5%" id="userCode">
				    <span id="clearCode" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
					
				</div>
			</div>

			<div class="layui-form-item"
				style="text-align: center;>
    <div class="layui-input-block">
      <button class="layui-btn"  id="submit" type="button" style="margin-left:-218px;width: 224px;">立即提交</button>	
	<!--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->    
</div>
  </div>
</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
 <script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
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
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
  
  //发送邮件
 $(document).on('click','#sendEmail',function(){
  	var email=$('#email').val();
  	var userName=$('#userName').val();
   	$.ajax({
		type : "post",
		url : "<c:url value='/user/queryUserCode'/>",
		async : false,
		dataType : 'json',
		data:{"user_email":email,"userName":userName},
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			if(msg=='0'){
			layui.use(['form', 'layedit', 'laydate'], function(){
				  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
			  });
				layer.alert('请登录QQ邮箱输入邮件中的验证码完成重置密码',{icon: 6});
			}else{
			layui.use(['form', 'layedit', 'laydate'], function(){
				  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
			  });
				layer.alert('用户名或密码错误，请重新输入',{icon: 5});
			}
		}
	});
  });
  
  //ajax实现输入用户名自动带入邮箱
 	  $('#userName').blur(function(){
		 var userName=$('#userName').val();
		 $.ajax({
			type : "post",
			url : "<c:url value='/user/queryUserEmail'/>",
			async : false,
			data :{"userName":userName},
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for(var i=0;i<msg.length;i++){
					var email=msg[i].email;
					$('#email').val(email);
				}
			}
		});
   	});
  
  
   //ajax  提交表单
 $(document).on('click','#submit',function(){
  	var userName=$('#userName').val();
  	var userCode=$('#userCode').val();
   	$.ajax({
		type : "post",
		url : "<c:url value='/user/resetPassword'/>",
		async : false,
		dataType : 'json',
		data:{"user_code":userCode,"userName":userName},
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			//遍历结果集
			for(var i=0;i<msg.length;i++){
				//判断结果集中是主键还是提示信息
				if(msg[i].userId!=undefined){
					//主键
					var userId=msg[i].userId;
					//跳转至重置密码页面
					location.href ='<c:url value="/user/initResetUserPassword"/>?userId='+userId;
				}
				if(msg[i].infor!=undefined){
					//提示信息
					var infor=msg[i].infor;
					layui.use(['form', 'layedit', 'laydate'], function(){
					  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
				  	});
					layer.alert(infor,{icon: 5});
					$('#userCode').val("");
				}
			}
		}
	});
  });
  
 		 //用户名设置为空
     	$('#clearUserName').click(function(){
     		$('#userName').val("");
     		$('#email').val("");
     	});
	   	//邮箱设置为空
	   	$('#clearEmail').click(function(){
	   		$('#email').val("");
	   	});
	   	//验证码设置为空
	   	$('#clearCode').click(function(){
	   		$('#userCode').val("");
	   	});
});



</script>
</body>
</html>