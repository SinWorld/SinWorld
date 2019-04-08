<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
 
    <title>登录页</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../layui/css/style.css">
 　<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
</head>
<body>
 
<div class="login-main">
    <header class="layui-elip">登录</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="account" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <hr/>
        <!--<div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div>-->
        <p><a href='<c:url value="/user/register"/>' class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
</div>
 
 
<script src="../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
 
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            // console.log(data.field);
            $.ajax({
                url:'login.php',
                data:data.field,
                dataType:'text',
                type:'post',
                success:function (data) {
                    if (data == '1'){
                        location.href = "../index.php";
                    }else{
                        layer.msg('登录名或密码错误');
                    }
                }
            })
            return false;
        })
 
    });
</script>
</body>
</html>