<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>即将到期</title>
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<style>
.close {
	float: right;
	position: relative;
	top: -28px;
	right: 265px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/head/head.jsp"%>

	<div class="content content-nav-base shopcart-content">
		<div class="main-nav">
			<div class="inner-cont0">
				<div class="inner-cont1 w1200">
					<div class="inner-cont2">
					    <a href='<c:url value="/book/allProduct"/>' class="active">所有商品</a>
						<a href='<c:url value="/book/buyTodady"/>'>今日团购</a> 
						<a href="information.html">商城资讯</a>
						<a href="about.html">关于我们</a>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-bg w1200">
			<h3>夏季清仓</h3>
		</div>
		<div class="cart w1200">
			<div class="cart-table-th">
				<div class="th th-item" style="width: 10%;padding-left: 45px;">
					<div class="cart-checkbox" style="width: 65px">
						<input class="check-all" id="allCheckked" type="checkbox"
							onchange="allSelect()">
							<label>&nbsp;&nbsp;全选</label>
					</div>
				</div>
				<div class="th th-item" style="width: 20%">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price" style="width: 15%">
					<div class="th-inner">借阅数量</div>
				</div>
				<div class="th th-price" style="width: 20%">
					<div class="th-inner">借阅日期</div>
				</div>
				<div class="th th-price" style="width: 15%">
					<div class="th-inner">约定归还日期</div>
				</div>
				
				<div class="th th-price" style="width: 10%">
					<div class="th-inner">是否归还</div>
				</div>
				<div class="th th-price" style="width: 10%">
					<div class="th-inner">操作</div>
				</div>
			</div>
			<form id="form" method="post">
				<div class="OrderList">
					<div class="order-content" id="list-cont">
					<input type="hidden" id="url" value='<c:url value="/"/>'>
						<input type="hidden" id="delBookId" name="delBookIds">
						<input type="hidden" id="size" value="${myBorrows.size()}">
						<c:forEach items="${myBorrows}" var="m">
							<ul class="item-content layui-clear">
								<li class="th th-chk" style="width:6%">
									<div class="select-all">
										<div class="cart-checkbox">
											<input class="CheckBoxShop" type="checkbox" name="select-all"
												value="${m.ids}">
											<input  type="hidden" name="ids" value="${m.ids}">
										</div>
									</div>
								</li>
								<li class="th th-item" style="width: 20%">
									<div class="item-cont">
										<a href="javascript:;"><img
											src='<c:url value="/${m.getBook().getBook_image()}"/>'
											alt=""></a>
											<br/>
										<div class="text" style="width: 200px;">
											<div class="title" style="line-height: 50px;">${m.getBook().getBook_name()}</div>
											<!--    <p><span>粉色</span>  <span>130</span>cm</p> -->
										</div>
									</div>
								</li>
								<li class="th th-amount" style="width: 20%">
									<div class="box-btn layui-clear">
										<div class="box-btn layui-clear" style="margin-top: 23px">
											<div class="less layui-btn">-</div>
											<input class="Quantity-input" type="" name="count"
												value="${m.getCount()}" disabled="disabled" id="count">
										</div>
									</div>
								</li>
								<li class="th th-price" style="line-height: 80px;width: 15%"><span class="th-su" name="borrowDate">${m.getBorrowDate()}</span>
								</li>
								<li class="th th-price" style="margin-top: 30px;width: 15%"><span class="th-su">${m.getAppoint_return_time()}</span>
								</li>
								<li class="th th-price" style="margin-top: 30px;width: 10%"><span class="th-su"><c:if test="${m.getIs_return()==false}">否</c:if></span>
								</li>
								<li class="th th-op" style="line-height: 80px;width: 10%">
									<a><span class="dele-btn" style="line-height: 80px;color: red">归还</span></a></li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="FloatBarHolder layui-clear" id="payFor">
					<div class="th th-chk">
						<div class="select-all">
							<div class="cart-checkbox">
								<input class="check-all" id="yx" type="checkbox" value="true">
							</div>
							<label>&nbsp;&nbsp;已选<span class="Selected-pieces"
								id="totalCount">0</span>件
							</label>
						</div>
					</div>
					<div class="th batch-deletion">
						<a id="batchDelete" onclick="plsc()"><span
							class="batch-dele-btn">批量归还</span></a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript">
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['form','mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    var form= layui.form
   	var size=$('#size').val();
    if(size==0){
    	$('#payFor').hide();
    }else{
    	$('#payFor').show();
    }
});
  
 	//归还
 	$('ul li').find("span[class='dele-btn']").click(function(){
 		//获得当前行索引
 	  var index=$('ul li').find("span[class='dele-btn']").index(this);
 		//获得当前归还数量
 	  var count=$('ul li').find("input[id='count']")[index].value;
 		//获得当前行所有主键值
      var ids=$('input[name="ids"]')[index].value;
      ids=ids.substring(1,ids.length-1);
	  layer.confirm('您确定要归还该书籍吗？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示'},function(index){
		 //ajax进行归还
			$.ajax({
				url : "<c:url value='/borrow/giveBooks'/>",
				type : "post",
				dataType : 'json',
				async : false,
				data : {
					"count" : count,
					"ids" : ids
				},
				error : function() {
					alert("出错");
				},
				success : function(data) {
					if(data.flag=='success'){
						//layer.alert('成功',{icon: 6});
						//layer.msg('已归还',{icon: 1}); 
						location.reload();
						//layer.msg('已移除',{icon: 2}); 
					}
				}
			});
			 
		  }
	  );
	});
  
//数量减少
	$('ul li').find("div[class='less layui-btn']").click(function(){
		//获取当前点击行索引
		var index=$('ul li').find("div[class='less layui-btn']").index(this);
		//获取当前行数量值
		var count=$('ul li').find("input[id='count']")[index].value;
		//若数量减至1则不可再减少
		if(count==1){
			return;
		}
		//自减
		count--;
		//赋值
		$('ul li').find("input[id='count']")[index].value=count;
	});
	
  //复选框选中
  function allSelect(){
		var select=document.getElementById("allCheckked");
		var flag=select.checked;
		var allSelect=document.getElementsByName("select-all");
		var yx=document.getElementById("yx");
		//总数量
		var totalCount=0;
		var counts=$('ul li').find("input[id='count']");
		if(flag){
			yx.checked=true;
			for(var i=0;i<allSelect.length;i++){
				allSelect[i].checked=true;
			}
			//遍历 ul 下li里的数量
			for(var i=0;i<counts.length;i++){
				var count=counts[i].value;
				totalCount+=count*1;
			}
			$('#totalCount').text(totalCount);
		}else{
			yx.checked=false;
			for(var i=0;i<allSelect.length;i++){
				allSelect[i].checked=false;
			}
			$('#totalCount').text(0);
		}
	}
  $('ul li').find("input[class='CheckBoxShop']").click(function(){
	  //点击复选框  获取当前点击的行索引
	  var index=$('ul li').find("input[class='CheckBoxShop']").index(this);
	  //获取当前点击的复选框元素
	  var checbox=$('ul li').find("input[class='CheckBoxShop']")[index];
	  //是否处于选中状态
	  var flag=checbox.checked;
	  //获取当前点击的商品数量值
	  var count=$('ul li').find("input[id='count']")[index].value;
	  var yx=document.getElementById("yx");
	  //选中
	  if(flag){
			$('#totalCount').text($('#totalCount').text()*1+count*1);
			yx.checked=true;
	  }else{
		  $('#totalCount').text($('#totalCount').text()*1-count*1);
			yx.checked=false;
	  }
  });
	//批量删除 逻辑删除
  function plsc(){
	  //获取所有复选框
	  var checboxs=document.getElementsByName('select-all');
	  //获取批量删除a标签元素
	  var a=$('#batchDelete');
	  var url=$('#url').val();
	  var delBorrows=$('#delBookId');
	  //获取表单
	  var form=document.getElementById('form');
	  //遍历该集合复选框
	  for(var i=0;i<checboxs.length;i++){
		  //判断该复选框是否被选中
		  if(checboxs[i].checked==true){
			  //选中状态
			  //获取该集合复选框中的书籍主键
			  var borrowId=checboxs[i].value;
			  if(undefined!=delBorrows.value){
				  delBorrows.value=delBorrows.value+","+borrowId;
				}else{
					delBorrows.value=borrowId;
				}
		  }
	  }
	  if(delBorrows.value!=undefined){
		  var delBorrow =delBorrows.value.replace(/\[|]/g,'');
	  }
	  var yx=document.getElementById("yx");
	  var flag=yx.checked;
	  if(flag==false){
		  layer.alert('请勾选需要选中的书籍');
		  return;
	  }
	  layer.confirm('您确定要一键归还吗？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示'},function(index){
			  $('#delBookId').val(delBorrow);
			  //ajax进行批量归还
				$.ajax({
					url : "<c:url value='/borrow/batchReturn'/>",
					type : "post",
					dataType : 'json',
					async : false,
					data : {
						"delBorrow" : delBorrow,
					},
					error : function() {
						alert("出错");
					},
					success : function(data) {
						if(data.flag=='success'){
							location.reload();
						}
					}
				});
		   }
		 );
  }
	  
</script>

</body>
</html>