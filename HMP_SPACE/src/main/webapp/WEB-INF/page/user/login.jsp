<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>登录页</title>
    <link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="../layui-v2.4.5/layui/css/style.css">
 　	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
</head>
<body background="../layui-v2.4.5/layui/images/login/1.jpg" style="background-size: 100%;">
 <style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 10px;
	   	cursor:pointer;
	}
</style>
<div class="login-main" style="margin-top: 40px;">
    <header class="layui-elip">登录</header>
    <form class="layui-form" method="post">
        <div class="layui-input-inline">
            <input type="text" name="userName" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input" id="userName">
            <span id="close" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input" id="password">
            <span id="clearPasswprd" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
        </div>
        <div class="layui-input-inline login-btn">
            <button  type="button" class="layui-btn" id="login">登录</button>
        </div>
        <hr/>
      <!--   <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div> -->
        <p>
	        <a href='<c:url value="/user/register"/>' class="fl">立即注册</a>
	        <a href='<c:url value="/user/forgotPassword"/>' class="fr">忘记密码？</a>
        </p>
    </form>
</div>
 
<script src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        $(document).on('click','#login',function(){
            // console.log(data.field);
            var userName=$('#userName').val();
			var password=$('#password').val();
            $.ajax({
                url:'<c:url value="/user/doLogin"/>',
                data:{"userName":userName,"password":password},
                dataType:'json',
                type:'post',
                async:false,
                success:function (data) {
                    if (data == '1'){
                        location.href ='<c:url value="/user/index"/>';
                    }else{
                    	layer.alert('用户名或密码错误，请重新输入',{icon: 5});
                    }
                }
            })
        })
      	//用户名设置为空
     	$('#close').click(function(){
     		$('#userName').val("");
     	});
      	//密码设置为空
     	$('#clearPasswprd').click(function(){
     		$('#password').val("");
     	});
    });
</script>
</body>
</html>