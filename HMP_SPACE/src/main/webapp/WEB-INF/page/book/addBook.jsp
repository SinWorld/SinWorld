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
<title>新增</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="../jquery/jquery-3.3.1.js"></script>
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 265px;
	   	cursor:pointer;
	}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
</head>
<body>
	<div>
		<header class="layui-elip"
			style="width: 95%;margin-top:30px;text-align:center;font-size:40px;">新增图书</header>
	</div>
	<div
		style="margin-left:120px;width: 700px;">
		<form class="layui-form" action="<c:url value='/book/addBook'/>" method="post" enctype="multipart/form-data">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">图书名称</label>
				<div class="layui-input-block">
					<input type="text" name="book_name" lay-verify="bookName"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="bookName">
					 <span id="clearBookName" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label">作者</label>
				<div class="layui-input-block">
					<input type="text" name="book_author" lay-verify="author"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="author">
					 <span id="clearAuthor" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: -18px;">
				<label class="layui-form-label">出版社</label>
				<div class="layui-input-block">
					<input type="text" name="book_press" lay-verify="bookPress"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="bookPress">
					 <span id="clearBookPress" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: -18px;">
				<label class="layui-form-label">版本</label>
				<div class="layui-input-block">
					<input type="text" name="book_version" lay-verify="bookVersion"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="bookVersion">
					 <span id="clearBookVersion" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item" style="margin-top: 15px;">
				<label class="layui-form-label">种类</label>
				<div class="layui-input-inline">
					<select name=book_type id="bookType" lay-filter="bookType" lay-verify="bookType">
						<option value="" selected="selected">请选择书籍种类</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: -18px;">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-block">
					<input type="text" name="book_price" lay-verify="bookPrice"
						autocomplete="off" class="layui-input" style="width: 56.5%" id="bookPrice">
					 <span id="clearBookPrice" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">简介</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea" name="book_synopsis" style="width:57%"></textarea>
			 </div>
			
			 <div class="layui-upload" style="margin-top: 10px;">
                 <label class="layui-form-label">图书照片:</label>
                 <div class="layui-upload layui-input-block">
                     <input type="hidden" name="book_image" id="img" required lay-verify="photo" />
                     <button type="button" class="layui-btn layui-btn-primary" id="fileBtn"><i class="layui-icon">&#xe67c;</i>选择文件</button>
                     <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>
                     <img alt="照片"  style="width: 10%" id="photo">
                 </div>
            </div>

			<div class="layui-form-item"
				style="text-align: center;margin-left: -145px;>
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
  initBookType();
  
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
 
 //ajax实现初始化书籍种类
function initBookType() {
	$.ajax({
		type : "post",
		url : "<c:url value='/book/bookType'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for(var i=0;i<msg.length;i++){
				$("#bookType").append(
				   "<option value='"+msg[i].codelist_code+"'>"+ msg[i].codelist_mean +"</option>");
			}
			form.render('select');
		}
	});
}


 	//书籍名称清除
   	$('#clearBookName').click(function(){
   		$('#bookName').val("");
   	});
   	//作者清除
   	$('#clearAuthor').click(function(){
   		$('#author').val("");
   	});
   	//出版社清除
   	$('#clearBookPress').click(function(){
   		$('#bookPress').val("");
   	});
   	//版本清除
   	$('#clearBookVersion').click(function(){
   		$('#bookVersion').val("");
   	});
   	//价格清除
   	$('#clearBookPrice').click(function(){
   		$('#bookPrice').val("");
   	});
   	
   	
   	form.verify({
		  bookName: function(value, item){ //value：表单的值、item：表单的DOM对象
		   if(value==""){
		   		return '书籍名称不能为空';
		   }
		  } 
		  ,author: function(value){
		     if(value==""){
		     	 return '作者不能为空';
		     }
		   }
		   ,bookPress: function(value){
		     if(value==""){
		     	 return '出版社不能为空';
		     }
		   }
		   ,bookVersion: function(value){
		     if(value==""){
		     	 return '版本不能为空';
		     }
		   }
		   ,bookType: function(value){
		     if(value==""){
		     	 return '请选择书籍种类';
		     }
		   }
		   ,bookPrice: function(value){
		     if(value==""){
		     	 return '书籍价格不能为空';
		     }
		   }
		    ,photo: function(value){
		     if(value==""){
		     	 return '书籍图片不能为空';
		     }
		   }
	}); 
  
});

	layui.use('upload',function(){
          var upload = layui.upload;
          upload.render({
              elem: '#fileBtn'
              ,url: "<c:url value='/book/bookUpload'/>"
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