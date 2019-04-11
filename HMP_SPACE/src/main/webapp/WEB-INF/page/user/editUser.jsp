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
<title>用户基本信息</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()">
	<div>
		<header class="layui-elip"
			style="width: 97%;margin-top:65px;text-align:center;font-size:20px;">基本资料</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: auto; margin-right: auto; width: 800px;">
		<form class="layui-form"  method="post"  action="<c:url value='/user/editUser'/>">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="user_name" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_name}" readonly="readonly">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="user_sex" value="0" title="男" id="man">
					<input type="radio" name="user_sex" value="1" title="女" id="woman">
					<input type="hidden" value="${user.user_sex}" id="sex">
					<input type="hidden" id="flag" value="${flag}">
					<input type="hidden" value="${userId}" id="userId" name="user_id">
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-top: 10px;">
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-block">
					<input type="text" name="user_age" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_age}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">联系方式</label>
				<div class="layui-input-block">
					<input type="text" name="user_phone" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_phone}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="user_email" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_email}">
				</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label">出生年月</label>
				<div class="layui-input-inline">
					<input type="text" name="user_brithday" id="date" lay-verify="date"
						placeholder="请选择日期" autocomplete="off" class="layui-input"
						style="width: 85.5%" value="${brithday}">
				</div>
			</div>

			<div class="layui-form-item" style="margin-top: 15px;">
				<label class="layui-form-label">省/市</label>
				<div class="layui-input-inline">
					<select name=user_province id="provinces" lay-filter="provinces">
						<option value="${province.shengDM}">${province.shengMC}</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="user_city" id="city">
						<option value="${city.shiDM}">${city.shiMC}</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">详细地址</label>
				<div class="layui-input-block">
					<input type="text" name="user_detail_address" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_detail_address}">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">身份证号</label>
				<div class="layui-input-block">
					<input type="text" name="user_idCard" lay-verify="title"
						autocomplete="off" class="layui-input" style="width: 85.5%" value="${user.user_idCard}">
				</div>
			</div>

			<div class="layui-form-item"
				style="text-align: center;>
    <div class="layui-input-block">
 	  <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button> 
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
  form.render();
  querySheng();
  setSex(form);
  
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
	
	function setSex(form){
		var sexValue=$('#sex').val();
		var man=$('#man');
		var woman=$('#woman');
		if(sexValue==0){
			man[0].checked=true;
			form.render()
		}
		if(sexValue==1){
			woman[0].checked=true;
			form.render()
		}
	}
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