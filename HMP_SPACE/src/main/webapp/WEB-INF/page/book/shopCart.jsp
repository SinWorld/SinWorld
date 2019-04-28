<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 265px;
	   	cursor:pointer;
	}
</style>
</head>
<body>
 <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href='<c:url value="/book/initIndex"/>'>首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="">${userName}</a></div>
        <div class="sp-cart"><a href="<c:url value='/book/initShopCart'/>"><i class="layui-icon">&#xe698;</i></a></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
             <img src="../layui-v2.4.5/layui/static/img/logo.jpg" style="width: 30%;margin-top: 25px;">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base shopcart-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="commodity.html" class="active">所有商品</a>
            <a href="buytoday.html">今日团购</a>
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
              <input class="check-all check" id="allCheckked" type="checkbox" value="true">
            </div>
          <label>&nbsp;&nbsp;全选</label>
          </div>
        </div>
        <div class="th th-item">
          <div class="th-inner">
            商品
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            单价
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
            数量
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            小计
          </div>
        </div>
        <div class="th th-op">
          <div class="th-inner">
            操作
          </div>
        </div>  
      </div>
      <div class="OrderList">
        <div class="order-content" id="list-cont">
        	<input type="hidden" value="${cart.getCartItems().size()}" id="cartSize">
        	<c:forEach items="${cart.getCartItems()}" var="c">
          <ul class="item-content layui-clear">
            <li class="th th-chk">
              <div class="select-all">
                <div class="cart-checkbox">
                  <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                </div>
              </div>
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src='<c:url value="/${c.getBook().getBook_image()}"/>' alt=""></a>
                <div class="text">
                  <div class="title">${c.getBook().getBook_name()}</div>
               <!--    <p><span>粉色</span>  <span>130</span>cm</p> -->
                </div>
              </div>
            </li>
            <li class="th th-price">
              <span class="th-su">${c.getBook().getBook_price()}</span>
            </li>
            <li class="th th-amount">
              <div class="box-btn layui-clear">
                <div class="less layui-btn">-</div>
                <input class="Quantity-input" type="" name="" value="${c.getCount()}" disabled="disabled">
                <div class="add layui-btn">+</div>
              </div>
            </li>
            <li class="th th-sum">
              <span class="sum">${c.getSubTotal()}</span>
            </li>
            <li class="th th-op">
              <a href="<c:url value='/book/deleteCart'/>?bookId=+${c.getBook().getBook_id()}"><span class="dele-btn">删除</span></a>
            </li>
          </ul>
          </c:forEach>
        </div>
      </div>


    
      
	<div class="layui-form-item" style="margin-bottom: 0px;">
		<label class="layui-form-label">收货地址</label>
		<div class="layui-input-block" style="width: 576px;">
			<input type="text" name="shAddress" lay-verify="author"
				autocomplete="off" class="layui-input" style="width: 55.5%" id="shdz">
			 <span id="clearAuthor" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
		</div>
	</div>
	
	<div class="layui-form-item" style="margin-bottom: 0px;">
		<label class="layui-form-label">收货人</label>
		<div class="layui-input-block" style="width: 576px;">
			<input type="text" name="shr" lay-verify="author"
				autocomplete="off" class="layui-input" style="width: 55.5%" id="shdz">
			 <span id="clearAuthor" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
		</div>
	</div>
	
	<div class="layui-form-item" style="margin-bottom: 0px;">
		<label class="layui-form-label">联系方式</label>
		<div class="layui-input-block" style="width: 576px;">
			<input type="text" name="phoneNumber" lay-verify="author"
				autocomplete="off" class="layui-input" style="width: 55.5%" id="shdz">
			 <span id="clearAuthor" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
		</div>
	</div>

      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
          <div class="select-all">
            <div class="cart-checkbox">
              <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
            </div>
            <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
          </div>
        </div>
        <div class="th batch-deletion">
         <a href='<c:url value="/book/clearCart"/>'><span class="batch-dele-btn">批量删除</span></a>
        </div>
        <div class="th Settlement">
          <button class="layui-btn" type="button" id="payFor">结算</button>
        </div>
        <div class="th total">
          <p>应付：<span class="pieces-total">0</span></p>
        </div>
      </div>
    </div>
  </div>
  
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    
    // 模版导入数据
    // var html = demo.innerHTML,
    // listCont = document.getElementById('list-cont');
    // mm.request({
    //   url: '../json/shopcart.json',
    //   success : function(res){
    //     listCont.innerHTML = mm.renderHtml(html,res)
    //     element.render();
    //     car.init()
    //   },
    //   error: function(res){
    //     console.log(res);
    //   }
    // })
    // 
    car.init()
    anNiu();

});
  function anNiu(){
	  var cartSize=$('#cartSize').val();
	  if(cartSize==0){
		  $("#payFor").addClass("layui-btn layui-btn-radius layui-btn-disabled").prop("disabled" , true);
	  }
  }
  
</script>

</body>
</html>