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
<!-- <link rel="stylesheet" href="../layui/css/layui.css"> -->
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
</head>
<body>
<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend  style="width: 136px;padding-left: 620px;padding-right: 620px;">用户注册</legend>
</fieldset> -->
<div>
<header class="layui-elip" style="width: 97%;margin-top:65px;text-align:center;font-size:40px;">注册</header>
 </div>
<div style="margin-top: 11px;margin-left: auto;margin-right: auto;width: 800px;">
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">真实姓名</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>

 <div class="layui-form-item">
    <label class="layui-form-label">用户密码</label>
    <div class="layui-input-block">
      <input type="password" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-block">
      <input type="password" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="0" title="男" checked>
      <input type="radio" name="sex" value="1" title="女">
    </div>
  </div>
  
   <div class="layui-inline">
      <label class="layui-form-label">出生年月</label>
      <div class="layui-input-inline">
        <input type="text" name="date" id="date" lay-verify="date" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input" style="width: 85.5%">
      </div>
    </div>
  
  <div class="layui-form-item" style="margin-top: 10px;">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">地址</label>
    <div class="layui-input-inline">
      <select name="quiz1">
        <option value="" selected="">请选择省</option>
        <option value="浙江" >浙江省</option>
        <option value="你的工号">江西省</option>
        <option value="你最喜欢的老师">福建省</option>
      </select>
    </div>
    <div class="layui-input-inline">
      <select name="quiz2">
        <option value="">请选择市</option>
        <option value="杭州">杭州</option>
        <option value="宁波" disabled="">宁波</option>
        <option value="温州">温州</option>
        <option value="温州">台州</option>
        <option value="温州">绍兴</option>
      </select>
    </div>
    <div class="layui-input-inline">
      <select name="quiz3">
        <option value="">请选择县/区</option>
        <option value="西湖区">西湖区</option>
        <option value="余杭区">余杭区</option>
        <option value="拱墅区">临安市</option>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">联系方式</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">身份证号</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 85.5%">
    </div>
  </div>
  
  <div class="layui-form-item"  style="text-align: center;>
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 </div>
<script src="../layui/layui.js" charset="utf-8"></script>
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
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 
  //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "男"
    ,"desc": "我爱 layui"
  })
});
</script>
</body>
</html>