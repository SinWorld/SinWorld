<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
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
	<%@ include file="head.jsp"%>
	
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
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox">
							<input class="check-all" id="allCheckked" type="checkbox"
								onchange="allSelect()">
						</div>
						<label>&nbsp;&nbsp;全选</label>
					</div>
				</div>
				<div class="th th-item">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price">
					<div class="th-inner">单价</div>
				</div>
				<div class="th th-amount">
					<div class="th-inner">数量</div>
				</div>
				<div class="th th-sum">
					<div class="th-inner">小计</div>
				</div>
				<div class="th th-op">
					<div class="th-inner">操作</div>
				</div>
			</div>
			<form id="form" method="post" style="margin-top: 10px;">
				<div class="OrderList">
					<div class="order-content" id="list-cont">
						<input type="hidden" value='<c:url value="/"/>' id="url">
						<input type="hidden" id="delBookId" name="delBookIds"> <input
							type="hidden" value="${list.size()}" id="product">
						<input type="hidden" id="sumTotalPrices" name="sumTotalPrice">
						<c:forEach items="${list}" var="l">
							<ul class="item-content layui-clear">
								<li class="th th-chk">
									<div class="select-all">
										<div class="cart-checkbox">
											<input class="CheckBoxShop" type="checkbox" name="select-all"
												value="${l.bookInforMation.getBook_id()}">
										</div>
									</div>
								</li>
								<li class="th th-item">
									<div class="item-cont">
										<a href="javascript:;"><img
											src='<c:url value="/${l.bookInforMation.getBook_image()}"/>'
											alt=""></a>
										<div class="text">
											<div class="title" style="line-height: 80px;">${l.bookInforMation.getBook_name()}</div>
											<!--    <p><span>粉色</span>  <span>130</span>cm</p> -->
										</div>
									</div>
								</li>
								<li class="th th-price"><span class="th-su" style="line-height: 80px;">${l.bookInforMation.getBook_price()}</span>
								</li>
								<li class="th th-amount">
									<div class="box-btn layui-clear">
										<span name="count" id="count" style="line-height: 80px;">${l.count}</span>
									</div>
								</li>
								<li class="th th-sum"><span class="sum" name="totalPrice" style="line-height: 80px;">${l.totalPrice}</span>
								</li>
								<li class="th th-op"><a
									onclick="deletCartItemById(${l.bookInforMation.getBook_id()})"
									id="deleteBook"><span class="dele-btn" style="line-height: 80px;">删除</span></a></li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="layui-form-item" style="margin-bottom: 0px;">
					<label class="layui-form-label">收货人</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text" name="address_name" lay-verify="shouhuor"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="shr"> <span id="clearShr" class="close"><i
							class="layui-icon layui-icon-close-fill"></i></span>
					</div>
				</div>

				<div class="layui-form-item"
					style="margin-bottom: 0px; margin-top: 10px;">
					<label class="layui-form-label">收货地址</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text" name="address_adr" lay-verify="shouhuodz"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="shdz"> <span id="clearShdz" class="close"><i
							class="layui-icon layui-icon-close-fill"></i></span>
					</div>
				</div>

				<div class="layui-form-item" style="margin-bottom: 0px;">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-block" style="width: 576px;">
						<input type="text" name="address_phone" lay-verify="lianxifs"
							autocomplete="off" class="layui-input" style="width: 55.5%"
							id="lxfs"> <span id="clearLxfs" class="close"><i
							class="layui-icon layui-icon-close-fill"></i></span>
					</div>
				</div>
				
				<table class="layui-hide" id="test" lay-filter="test"></table>

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
							class="batch-dele-btn">批量删除</span></a>
					</div>
					<div class="th Settlement">
						<button class="layui-btn" type="button" onclick="payFor()">结算</button>
					</div>
					<div class="th total">
						<p>
							应付：<span class="pieces-total" id="sumTotalPrice">0</span>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
     <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">选择以下地址</button>
    </div>
</script>
	<script type="text/javascript">
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['form','mm','jquery','element','car','table'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    var form= layui.form
    var table = layui.table;
    var url=$('#url').val();
    table.render({
      elem: '#test'
      ,url:url+"book/myShopAddress"
      ,toolbar: '#toolbarDemo'
      ,cols: [[
    	 {type:'radio'}
    	,{field:'index', width:"10%", title: '序号', sort: true,type:'numbers'}
        ,{field:'address_name', width:"20%", title: '收货人',align:'center'}
        ,{field:'address_phone', width:"20%", title: '联系方式',align:'center'}
        ,{field:'address_adr', width:"50%", title: '收货地址',align:'center'}
      ]]
      ,page: true
    });
    
    //头工具栏事件
    table.on('toolbar(test)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态
      //获取是否选中单选框
      var number=checkStatus.data.length;
      if(obj.event=='getCheckData'){
	      if(number==0){
	    	  layer.alert('请选择收货地址',{icon: 5});
	    	  return;
	      }else{
		      switch(obj.event){
		        case 'getCheckData':
		          var data = checkStatus.data;  //获取选中行数据
		         $('#shr').val(data[obj.config.index-1].address_name);
		         $('#shdz').val(data[obj.config.index-1].address_adr);
		         $('#lxfs').val(data[obj.config.index-1].address_phone);
		        break;
		      };
	      }
      }
    });
    
    anNiu();
  
});
  function anNiu(){
	  var size=$('#product').val();
	  if(size==0){
		  $("#payFor").hide();
	  }else{
		  $("#payFor").show();
	  }
  }
  
 
  
  function deletCartItemById(bookId){
	  layer.confirm('您确定要删除该类商品吗？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示'},function(index){
			  //获取表单
			  var form=document.getElementById('form');
			  var url=$('#url').val();
			  form.action=url+"/book/deleteCart?bookId="+bookId;
			  form.submit();
			  layer.close(index);
		  }
	  );
  }
  
  //复选框选中
  function allSelect(){
		var select=document.getElementById("allCheckked");
		var flag=select.checked;
		var allSelect=document.getElementsByName("select-all");
		var yx=document.getElementById("yx");
		//总数量
		var totalCount=0;
		var counts=$('ul li').find("span[id='count']");
		//总金额
		var sumTotalPrice=0;
		var totalPrices=$('ul li').find("span[class='sum']");
		if(flag){
			yx.checked=true;
			for(var i=0;i<allSelect.length;i++){
				allSelect[i].checked=true;
			}
			//遍历 ul 下li里的数量
			for(var i=0;i<counts.length;i++){
				var count=counts[i].innerHTML;
				totalCount+=count*1;
			}
			$('#totalCount').text(totalCount);
			//遍历 ul 下li里的小计
			for(var i=0;i<totalPrices.length;i++){
				var tprice=totalPrices[i].innerHTML;
				sumTotalPrice+=tprice*1;
			}
			$('#sumTotalPrice').text(sumTotalPrice+".0");
		}else{
			yx.checked=false;
			for(var i=0;i<allSelect.length;i++){
				allSelect[i].checked=false;
			}
			$('#totalCount').text(0);
			$('#sumTotalPrice').text(0.0);
		}
	}
  
	//批量删除 逻辑删除
  function plsc(){
	  //获取所有复选框
	  var checboxs=document.getElementsByName('select-all');
	  //获取批量删除a标签元素
	  var a=$('#batchDelete');
	  var url=$('#url').val();
	  var delBookIds=$('#delBookId');
	  //获取表单
	  var form=document.getElementById('form');
	  //遍历该集合复选框
	  for(var i=0;i<checboxs.length;i++){
		  //判断该复选框是否被选中
		  if(checboxs[i].checked==true){
			  //选中状态
			  //获取该集合复选框中的书籍主键
			  var bookId=checboxs[i].value;
			  if(undefined!=delBookIds.value){
				  delBookIds.value=delBookIds.value+","+bookId;
				}else{
					delBookIds.value=bookId;
				}
		  }
	  }
	  layer.confirm('您确定要清空购物车吗？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示'},function(index){
			  $('#delBookId').val(delBookIds.value);
			  form.action=url+"/book/clearCart";
			  form.submit();
			  layer.close(index);
		  }
		  );
  }
  
  $('ul li').find("input[class='CheckBoxShop']").click(function(){
	  //点击复选框  获取当前点击的行索引
	  var index=$('ul li').find("input[class='CheckBoxShop']").index(this);
	  //获取当前点击的复选框元素
	  var checbox=$('ul li').find("input[class='CheckBoxShop']")[index];
	  //是否处于选中状态
	  var flag=checbox.checked;
	  //获取当前点击的商品数量值
	  var count=$('ul li').find("span[id='count']")[index].innerHTML;
	  //获取当前点击的商品小计
	  var totalPrices=$('ul li').find("span[class='sum']")[index].innerHTML;
	  var yx=document.getElementById("yx");
	  //选中
	  if(flag){
			$('#totalCount').text($('#totalCount').text()*1+count*1);
			$('#sumTotalPrice').text($('#sumTotalPrice').text()*1+totalPrices*1+".0");
			yx.checked=true;
	  }else{
		  $('#totalCount').text($('#totalCount').text()*1-count*1);
		  $('#sumTotalPrice').text($('#sumTotalPrice').text()*1-totalPrices*1+".0");
			yx.checked=false;
	  }
  });
  
  //支付
function payFor(){
	var  count=$('#totalCount').text();
	//获取表单
	var form=document.getElementById('form');
	var url=$('#url').val();
	//获取收货人
	var shr=$('#shr').val();
	//获取收货地址
	var shdz=$('#shdz').val();
	//获取联系方式
	var lxfs=$('#lxfs').val();
	var delBookIds=$('#delBookId');
	//获取所有复选框
	var checboxs=document.getElementsByName('select-all');
	if(shr==""){
		layer.alert("请填写收货人");
		return;
	}if(shdz==""){
		layer.alert("请填写收货地址");
		return;
	}if(lxfs==""){
		layer.alert("请填写联系方式");
		return;
	}
	if(count!=0){
	    //遍历该集合复选框
	    for(var i=0;i<checboxs.length;i++){
			  //判断该复选框是否被选中
			  if(checboxs[i].checked==true){
				  //选中状态
				  //获取该集合复选框中的书籍主键
				  var bookId=checboxs[i].value;
				  if(undefined!=delBookIds.value){
					  delBookIds.value=delBookIds.value+","+bookId;
					}else{
						delBookIds.value=bookId;
					}
			  }
	    }
		$('#delBookId').val(delBookIds.value);
		$('#sumTotalPrices').val($('#sumTotalPrice').text());
		form.action=url+"/book/payfor";
		form.submit();
	}else{
		layer.alert("请勾选需要付款的商品");
	}
}
  
	//用户名清除
	$('#clearShr').click(function(){
		$('#shr').val("");
	});
	//密码清除
	$('#clearShdz').click(function(){
		$('#shdz').val("");
	});
	//确认密码清除
	$('#clearLxfs').click(function(){
		$('#lxfs').val("");
	});

</script>

</body>
</html>