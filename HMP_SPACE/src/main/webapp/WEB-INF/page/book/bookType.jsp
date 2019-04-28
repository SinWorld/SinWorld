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
				<div class="sp-cart">
					<a href="<c:url value='/book/initShopCart'/>"><i
						class="layui-icon">&#xe698;</i></a>
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
				<div class="mallSearch">
					<form action="" class="layui-form" novalidate>
						<input type="text" name="title" required lay-verify="required"
							autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
						<button class="layui-btn" lay-submit lay-filter="formDemo">
							<i class="layui-icon layui-icon-search"></i>
						</button>
						<input type="hidden" name="" value="">
					</form>
				</div>
			</div>
		</div>
	</div>


	<div class="content">
		<div class="main-nav">
			<div class="inner-cont0">
				<div class="inner-cont1 w1200">
					<div class="inner-cont2">
						<a href="commodity.html" class="active">所有商品</a> <a
							href="buytoday.html">今日团购</a> <a href="information.html">商城资讯</a>
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
						<ul class="normal-nav layui-clear" style="height: 480px;"
							id="types">

						</ul>
					</div>
				</div>
			</div>
			<div class="category-banner">
				<div class="w1200">
					<img src="../layui-v2.4.5/layui/static/img/background.JPG"
						style="width: 100%; height: 480px;">
				</div>
			</div>
		</div>
		





	



	<!-- 	<div class="product-cont w1200" id="product-cont">
			<div class="product-item product-item1 layui-clear">
				<div class="left-title">
					<h4>
						<i>1F</i>
					</h4>
					<img src="../layui-v2.4.5/layui/static/img/icon_gou.png">
					<h5>古典文学</h5>
				</div>
				<div class="right-cont">
					<a href="javascript:;" class="top-img"><img
						src="../layui-v2.4.5/layui/static/img/wxlogo.jpg" alt=""
						style="width: 100%; height: 200px;"></a>
					<div class="img-box">
						<a href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/sj.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/sjz.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/ly.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/sgyy.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/shj.jpg"></a>
					</div>
				</div>
			</div>
			<div class="product-item product-item2 layui-clear">
				<div class="left-title">
					<h4>
						<i>2F</i>
					</h4>
					<img src="../layui-v2.4.5/layui/static/img/icon_gou.png">
					<h5>西方名胜</h5>
				</div>
				<div class="right-cont">
					<a href="javascript:;" class="top-img"><img
						src="../layui-v2.4.5/layui/static/img/xfmslogo.jpg" alt=""
						style="width: 100%; height: 200px;"></a>
					<div class="img-box">
						<a href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/xf1.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/xf2.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/xf3.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/xf4.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/xf5.jpg"></a>
					</div>
				</div>
			</div>
			<div class="product-item product-item3 layui-clear">
				<div class="left-title">
					<h4>
						<i>3F</i>
					</h4>
					<img src="../layui-v2.4.5/layui/static/img/icon_gou.png">
					<h5>宗教文化</h5>
				</div>
				<div class="right-cont">
					<a href="javascript:;" class="top-img"><img
						src="../layui-v2.4.5/layui/static/img/zjwhlogo.jpg" alt=""
						style="width: 100%; height: 200px;"></a>
					<div class="img-box">
						<a href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/zjwh1.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/zjwh2.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/zjwh3.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/zjwh4.jpg"></a> <a
							href="javascript:;"><img
							src="../layui-v2.4.5/layui/static/img/zjwh5.jpg"></a>
					</div>
				</div>
			</div>
		</div> -->

		<div class="product-list-box" id="product-list-box" style="margin-top: 80px;">
			<div class="product-list-cont w1200">
				<h4>书籍展示</h4>
				<div class="product-item-box layui-clear">

					<%-- <div class="list-item">
	            <a onclick="initBookDetails(${list.book_id})"><img src='<c:url value="/${list.book_image}"/>' style="width: 62%"></a>
	            <p style="text-align: center;">${list.book_name}</p>
	            <span>￥${list.book_price}</span>
	          </div> --%>
					<div id="product"></div>
					<br/>
					<div id="demo7" style="margin-top: 55%"></div>
					<fieldset class="layui-elem-field layui-field-title"
						style="margin-top: 30px;"></fieldset>
					<input type="hidden" id="page">
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
			<p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
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
	        url:"<c:url value='/book/bookType'/>",
	        type:"post",
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	for(var i=0;i<data.length;i++){
	        		$('#types').append( "<li class='nav-item'>"
	               +"<div class='title'>"+data[i].codelist_mean+"</div>"
	               +"<p style='padding-left: 23px;'><a href='${pageContext.request.contextPath}/book/bookType?typeId="+data[i].codelist_code+"'>"+data[i].codelist_mean+"</a></p>"
	               +"<i class='layui-icon layui-icon-right'></i></li>")
	        	}
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
</script>
</body>
</html>