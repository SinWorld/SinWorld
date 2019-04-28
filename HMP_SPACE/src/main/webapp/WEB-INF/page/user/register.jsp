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
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 306px;
	   	cursor:pointer;
	}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
</head>
<body>
	<div>
		<header class="layui-elip"
			style="width: 95%;margin-top:50px;text-align:center;font-size:40px;">注册</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: auto; margin-right: 300px; width: 800px;">
		<form class="layui-form" action="<c:url value='/user/addUser'/>" method="post" enctype="multipart/form-data">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="user_name" lay-verify="username"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="userName">
					 <span id="clearUserName" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">用户密码</label>
				<div class="layui-input-block">
					<input type="password" name="user_password" lay-verify="password"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="password">
					 <span id="clearPassword" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-block">
					<input type="password" name="" lay-verify="surePassword"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="surePassword">
					 <span id="clearSurePasswprd" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-inline" style="margin-bottom: 0px;">
					<label class="layui-form-label">出生年月</label>
					<div class="layui-input-inline">
						<input type="text" name="user_brithday" id="date" lay-verify="date"
							placeholder="请选择日期" autocomplete="off" class="layui-input"
							style="width: 85.5%">
					</div>
				</div>
			
			<div class="layui-form-item" style="float: right;position: relative;right:311px; margin-bottom: 0px;" >
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="user_sex" value="0" title="男" checked  lay-filter="sex">
					<input type="radio" name="user_sex" value="1" title="女"  lay-filter="sex">
				</div>
			</div>

			<div class="layui-form-item" style="margin-top: 15px;">
				<label class="layui-form-label">省/市</label>
				<div class="layui-input-inline">
					<select name=user_province id="provinces" lay-filter="provinces" lay-verify="provinces">
						<option value="" selected="selected">请选择省</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="user_city" id="city" lay-verify="city">
						<option value="">请选择市</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: -18px;">
				<label class="layui-form-label">详细地址</label>
				<div class="layui-input-block">
					<input type="text" name="user_detail_address" lay-verify="address"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="address">
					 <span id="clearAddress" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>


			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">联系方式</label>
				<div class="layui-input-block">
					<input type="text" name="user_phone" lay-verify="phone"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="phone">
					 <span id="clearPhone" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="user_email" lay-verify="email"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="email">
					<span id="clearEmail" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">身份证号</label>
				<div class="layui-input-block">
					<input type="text" name="user_idCard" lay-verify="idCard"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="idCard">
					<span id="clearIdCard" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			 <div class="layui-upload">
                 <label class="layui-form-label">头像:</label>
                 <div class="layui-upload layui-input-block">
                     <input type="hidden" name="user_uImage" id="img" required lay-verify="photo" />
                     <button type="button" class="layui-btn layui-btn-primary" id="fileBtn"><i class="layui-icon">&#xe67c;</i>选择文件</button>
                     <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>
                     <img alt="头像"  style="width: 10%" id="photo">
                 </div>
            </div>

			<div class="layui-form-item"
				style="text-align: center;margin-left: -210px;>
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;">立即提交</button>
     <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
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
  form.render();
  querySheng();
  layer.open({
  	type:2,
  	title:'12',
  	area: ['50%','60%'],
  	move:false,
  	resize:false,
  	content:['https://www.baidu.com','no']
  });
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
 
 //ajax实现查询所有的省
function querySheng() {
	$.ajax({
		type : "post",
		url : "<c:url value='/user/province'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			//$("#provinces").html("");
			//var json = JSON.parse(msg)
			
			for (var i = 0; i < msg.length; i++) {
				$("#provinces").append(
						"<option value='"+msg[i].shengDM+"'>"+ msg[i].shengMC +"</option>");
						
			}
			form.render('select');
		}
	});
}

//ajax实现省市二级联动
	form.on('select(provinces)', function(data){
			var shengDM=$('#provinces').val();
			$.ajax({
				type : "post",
				url : "<c:url value='/user/shengShiLD'/>",
				async : false,
				data:{"shengDM":shengDM},
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					$("#city").html("");
					//var json = JSON.parse(msg)
					for (var i = 0; i < msg.length; i++) {
						$("#city").append(
								"<option value='"+msg[i].shiDM+"'>"+ msg[i].shiMC +"</option>");
					}
					form.render('select');
				}
			});
	});
	
 	//用户名清除
   	$('#clearUserName').click(function(){
   		$('#userName').val("");
   	});
   	//密码清除
   	$('#clearPassword').click(function(){
   		$('#password').val("");
   	});
   	//确认密码清除
   	$('#clearSurePasswprd').click(function(){
   		$('#surePassword').val("");
   	});
   	//详细地址清除
   	$('#clearAddress').click(function(){
   		$('#address').val("");
   	});
   	//年龄清除
   	$('#clearAge').click(function(){
   		$('#age').val("");
   	});
   	//联系方式清除
   	$('#clearPhone').click(function(){
   		$('#phone').val("");
   	});
   	//邮箱清除
   	$('#clearEmail').click(function(){
   		$('#email').val("");
   	});
   	//身份证号清除
   	$('#clearIdCard').click(function(){
   		$('#idCard').val("");
   	});
   	
   	
   	form.verify({
		  username: function(value, item){ //value：表单的值、item：表单的DOM对象
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '用户名不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '用户名首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '用户名不能全为数字';
		    }
		  } 
		  ,password: function(value){
		     if(value.length < 6){
		     	 return '密码至少6位';
		     }
		   }
		   ,surePassword: function(value){
		   	var password=$('#password').val();
		     if(value!= password){
		     	 return '确认密码与密码不一致';
		     }
		   }
		   ,provinces: function(value){
		     if(value==""){
		     	 return '所属省份不能为空';
		     }
		   }
		   ,city: function(value){
		     if(value==""){
		     	 return '所属市不能为空';
		     }
		   }
		   ,address: function(value){
		     if(value==""){
		     	 return '详细地址不能为空';
		     }
		   }
		   ,phone:[/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']
		   ,email:[/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
		   ,idCard: function(value){
		     if(value.length!=18){
		     	 return '身份证号必须为18位';
		     }
		   }
		    ,photo: function(value){
		     if(value==""){
		     	 return '头像不能为空';
		     }
		   }
	}); 
   	
   	
   	//ajax实现用户名验证
 	  $('#userName').blur(function(){
		 var userName=$('#userName').val();
		 $.ajax({
			type : "post",
			url : "<c:url value='/user/checkUserName'/>",
			async : false,
			data :{"userName":userName},
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				if(msg.length>0){
					if(msg==0){
						//该用户名可用
						/*layui.use(['form', 'layedit', 'laydate'], function(){
					  		var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
				  		});
						layer.alert('该用户名可用',{icon: 6});*/
					}
					if(msg==1){
						//该用户名不可用
						layui.use(['form', 'layedit', 'laydate'], function(){
					  		var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
				  		});
						layer.alert('该用户名已存在,请换用户名',{icon: 5});
						$('#userName').val("");
					}
				}	
			}
		});
   	});
});

	layui.use('upload',function(){
          var upload = layui.upload;
          upload.render({
              elem: '#fileBtn'
              ,url: "<c:url value='/user/updatePersonalById'/>"
              ,accept: 'file'
              ,auto: false
              ,bindAction: '#uploadBtn'
             ,done: function(res){
                  //alert(res.data.src);
                  //$("[name=user_uImage]").val(res.data.src);
                  $('#img').val(res.data.src);
                  $('#photo').attr("src","/HMP_SPACE/"+res.data.src);
              }
          });
     });
</script>
</body>
</html>