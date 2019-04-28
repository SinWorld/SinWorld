<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍详情</title>
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
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


  <div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
      <div class="crumb">
        <a href="javascript:;">首页</a>
        <span>></span>
        <a href="javascript:;">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img src='<c:url value="/${book.book_image}"/>' style="width: 90%"></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4>${book.book_name} </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary" style="height:auto;">
              <p class="reference"><span>参考价</span> <del>￥280.00</del></p>
              <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>${book.book_price}</strong></p>
			 <p ><span>书籍详情</span><strong>${book.book_synopsis}</strong></p>
            </div>
            <form action='<c:url value="/book/addCart"/>' method="post" id="cartForm">
            	<input type="hidden" value="${book.book_id}" name="bid">
	            <div class="choose-attrs">
	<!--               <div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span> <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div></div>
	 -->              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="count" value="1"><span class="add btn">+</span></div></div>
	            </div>
	            <div class="choose-btns">
	              <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
	              <button class="layui-btn  layui-btn-danger car-btn" type="button" id="addCart" onclick="addCarts()"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  
	            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  })
  .use(['form','mm','jquery'],function(){
      var mm = layui.mm,$ = layui.$,form=layui.form;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur)
      })
  });
  
  $('#addCart').click(function(){
	 $('#cartForm').submit(); 
  });
  
  
  
</script>
</body>
</html>