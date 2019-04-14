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
<title>重置密码</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 380px;
	   	cursor:pointer;
	}
</style>
</head>
<body>
	<div>
		<header class="layui-elip"
			style="width: 97%;margin-top:150px;text-align:center;font-size:40px;">重置密码</header>
	</div>
	<div
		style="margin-top: 11px; margin-left: auto; margin-right: 244px; width: 800px;">
		<form class="layui-form"  method="post" action="<c:url value='/user/resetUserPassword'/>">
			<div class="layui-form-item">
				<label class="layui-form-label">新密码</label>
				<div class="layui-input-block">
					<input type="password" name="newPassword" lay-verify="password"
						autocomplete="off" class="layui-input" style="width: 45.5%" id="userName">
					 <span id="clearPassword" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
					<input type="hidden" id="userId" name="userId">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-block">
					<input type="password" name="surePassword" lay-verify="surePassword"
						autocomplete="off" class="layui-input" style="width: 45.5%" id="email">
					<span id="clearSurePassword" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item"
				style="text-align: center;>
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:39%;margin-left: -267px;">立即提交</button>
<!--       <button type="reset" class="layui-btn layui-btn-primary">重置</button>
 -->    </div>
  </div>
</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
 <script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
  UrlSearch();
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
  
function UrlSearch() {
   var name,value;
   var str=location.href; //取得整个地址栏
   var num=str.indexOf("?")
   str=str.substr(num+1); //取得所有参数   stringvar.substr(start [, length ]
   var arr=str.split("&"); //各个参数放到数组里
    console.log(arr)
   for(var i=0;i < arr.length;i++){
        num=arr[i].indexOf("=");
        if(num>0){
             name=arr[i].substring(0,num);
             value=arr[i].substr(num+1);
             this[name]=value;
        }
   }
   $('#userId').val(value);
}
  
   	form.verify({
		 	password: function(value){
		     if(value.length < 4){
		     	 return '密码至少6位';
		     }
		   }
		   ,surePassword: function(value){
		   	var password=$('#userName').val();
		     if(value!= password){
		     	 return '确认密码与密码不一致';
		     }
		   }
		  
	}); 
  

});

	//密码清除
 	$('#clearPassword').click(function(){
 		$('#userName').val("");
 	});
 	//确认密码清除
 	$('#clearSurePassword').click(function(){
 		$('#email').val("");
 	});


</script>
</body>
</html>