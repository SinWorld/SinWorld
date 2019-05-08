<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书商城</title>
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<style type="text/css">
.pointer {
	cursor: pointer;
}
.u_num {
	display: inline-block;
	color: #fff;
	background: #fb8240;
	height: 15px;
	line-height: 14px;
	padding: 0 10px;
	text-align: center;
	border-radius: 7px;
	font-size: 12px;
	font-style: normal;
	float: right;
	margin-top: 0px;
}
</style>
</head>
<body id="list-cont">
<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a
					href='<c:url value="/book/initIndex"/>'>首页</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<a href="">${userName}</a>
				</div>
				<div class="sp-cart" style="margin-right: 22px;">
					<a href="<c:url value='/book/initShopCart'/>"><i
						class="layui-icon" title="购物车">&#xe698;<em class="u_num" id="cartCount"></em></i></a>
				</div>
				<div class="sp-cart" style="margin-right: 22px;">
					<a href="<c:url value='/book/orderCartem'/>"><i
						class="layui-icon layui-icon-file" title="我的订单"><em class="u_num" id="myOrderCount"></em></i></a>
				</div>
				<div class="sp-cart">
					<a href="<c:url value='/book/myCollection'/>"><i
						class="layui-icon layui-icon-star-fill " title="我的收藏"><em class="u_num" id="myCollectionCount"></em></i></a>
				</div>
			</div>
		</div>
	</div>


	<div class="header">
		<div class="headerLayout w1200">
			<div class="headerCon">
				<h1 class="mallLogo">
					<a href="#" title="图书商城"> <img
						src="../layui-v2.4.5/layui/static/img/logo.jpg"
						style="width: 30%; margin-top: 25px;">
					</a>
				</h1>
			</div>
		</div>
		<div class="header mallSearch">
			<form action="" class="layui-form" novalidate style="left: -157px;">
				<input type="text" name="title" required lay-verify="required"
					autocomplete="off" class="layui-input" placeholder="请输入需要的商品"
					id="productName">
				<button class="layui-btn" lay-submit lay-filter="formDemo"
					type="button" onclick="queryBookByBookName()">
					<i class="layui-icon layui-icon-search"></i>
				</button>
				<input type="hidden" name="" value="">
			</form>
		</div>
	</div>

	<div class="content">
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
		<div class="category-con">
			<div class="category-inner-con w1200">
				<div class="category-type">
					<h3>
						全部分类<i class="layui-icon" id="fl">&#xe61a;</i>
					</h3>

				</div>
				<div class="category-tab-content" id="book_type">
					<div class="nav-con">
						<ul class="normal-nav layui-clear" style="height:480px;top:-53px"
							id="types">

						</ul>
					</div>
				</div>
			</div>
			<div class="category-banner">
				<div class="w1200">
					<img src="../layui-v2.4.5/layui/static/img/background.JPG"
						style="width: 100%; height: 480px;margin-top: -54px;">
				</div>
			</div>
		</div>
	
		<div class="product-list-box" id="product-list-box" style="margin-top: 80px;">
			<div class="product-list-cont w1200">
				<h4>书籍展示</h4>
				<div class="product-item-box layui-clear">
					<div id="product"></div>
					<br/>
					<div id="demo7" style="margin-top: 55%"></div>
					<fieldset class="layui-elem-field layui-field-title"
						style="margin-top: 30px;"></fieldset>
					<input type="hidden" id="page">
					<input type="hidden" id="total">
				</div>
			</div>
		</div>
		
	</div>

	<div class="footer">
		<div class="ng-promise-box">
			<div class="ng-promise w1200">
				<p class="text">
					<a class="icon1" href="javascript:;">7天无理由退换货</a> <a class="icon2"
						href="javascript:;">满99元全场免邮</a> <a class="icon3"
						style="margin-right: 0" href="javascript:;">100%品质保证</a>
				</p>
			</div>
		</div>
		<div class="mod_help w1200">
			<p>
				<a href="javascript:;">关于我们</a> <span>|</span> <a
					href="javascript:;">帮助中心</a> <span>|</span> <a href="javascript:;">售后服务</a>
				<span>|</span> <a href="javascript:;">商城资讯</a> <span>|</span> <a
					href="javascript:;">关于货源</a>
			</p>
			<p class="coty">图书商城版权所有 &copy; 2012-2020</p>
		</div>
	</div>
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
	<script type="text/javascript">
	var temp=1;
layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel','laypage','layer'],function(){
      var carousel = layui.carousel,laypage = layui.laypage,layer = layui.layer;
      mm = layui.mm;
      var option = {
        elem: '#test1',
        width: '100%',//设置容器宽度
        arrow: 'always',
        height:'298',
        indicator:'none'
      }
      carousel.render(option);
      bookType();
     //完整功能
     laypage.render({
       elem: 'demo7',
       count: ${totalPage},
       layout:['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
       jump: function(obj){
    	   var page=obj.curr;
    	   var typeId= GetRequest();
    	   $.ajax({
   	        url:"<c:url value='/book/queryBookByType'/>",
   	        type:"post",
   	        data:{"nowPage":page,"typeId":typeId.typeId},
   	        dataType:'json',
   	        async:false,
   	        error : function() {
   				alert("出错");
   			},
   	        success:function (data) {
   	        	if(temp!=1){
   	        		$('#product').empty();
   	        	}
   	        	for(var i=0;i<data.length;i++){
   	        		for(var j=0;j<data[i].page.rows.length;j++){
   	        			$('#product').append("<div class='list-item pointer'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
   	        			+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"' style='width: 62%'></a>"
   	        			+"<p style='text-align: center;'>"+data[i].page.rows[j].book_name+"</p>"
   	        			+"<span>￥"+data[i].page.rows[j].book_price+"</span></div>");
   	        			
   	        		}
   	        	}
   	        	temp++;
   	        }
   	    });
       }
     }); 

});

function initBookDetails(bookId){
	window.open("<c:url value='/book/queryBookById'/>?bookId="+bookId);
}

//初始化图书种类
function bookType(){
	$.ajax({
	        url:"<c:url value='/book/bookTypes'/>",
	        type:"post",
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	for(var i=0;i<data.length-1;i++){
	        		$('#types').append( "<li class='nav-item'>"
	               +"<div class='title'>"+data[i].codelist_mean+"</div>"
	               +"<p style='padding-left: 23px;'><a href='${pageContext.request.contextPath}/book/bookType?typeId="+data[i].codelist_code+"'>"+data[i].codelist_mean+"</a></p>"
	               +"<i class='layui-icon layui-icon-right'></i></li>")
	        	}
	        	var cartCount=data[data.length-1].cartCount;
	        	var myCollectionCount=data[data.length-1].myCollectionCount;
	        	var myOrderCount=data[data.length-1].myOrderCount;
	        	$('#cartCount').text(cartCount);
	        	$('#myCollectionCount').text(myCollectionCount);
	        	$('#myOrderCount').text(myOrderCount);
	        }
	    });
}


$(".category-type").click(function(){
	$("#book_type").fadeToggle("slow");
});

function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}

function queryBookByBookName(){
	layui.use(['mm','carousel','laypage','layer'],function(){
	      var carousel = layui.carousel
	      ,laypage = layui.laypage
	      ,layer = layui.layer;
	     //完整功能
	     laypage.render({
	       jump: function(obj){
	    	   var page=obj.curr;
	    	   var product=$('#productName').val();
	    	   var typeId= GetRequest();
	    	   $.ajax({
	   	        url:"<c:url value='/book/pageBook'/>",
	   	        type:"post",
	   	        data:{"nowPage":page,"bookName":product},
	   	        dataType:'json',
	   	        async:false,
	   	        error : function() {
	   				alert("出错");
	   			},
	   	        success:function (data) {
	   	        	if(temp!=1){
	   	        		$('#product').empty();
	   	        	}
	   	        	for(var i=0;i<data.length;i++){
	   	        		var total=data[i].page.total;
	   	        		$('#total').val(total);
	   	        		for(var j=0;j<data[i].page.rows.length;j++){
	   	        			$('#product').append("<div class='list-item pointer'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
	   	        			+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"' style='width: 62%'></a>"
	   	        			+"<p style='text-align: center;'>"+data[i].page.rows[j].book_name+"</p>"
	   	        			+"<span>￥"+data[i].page.rows[j].book_price+"</span></div>");
	   	        		}
	   	        	}
	   	        	temp++;
	   	        }
	   	    });
	       }
	       ,elem: 'demo7'
		   ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	       ,count: $('#total').val()
	     }); 
	});
}


</script>
</body>
</html>