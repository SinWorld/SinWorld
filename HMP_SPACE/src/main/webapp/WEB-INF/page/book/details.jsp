<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍详情</title>
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<style type="text/css">
.dj {
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
<body>
	<%@ include file="head.jsp"%>

	<div class="content content-nav-base datails-content">
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
		<div class="data-cont-wrap w1200">
			<div class="crumb">
				<a href="javascript:;">首页</a> <span>></span> <a href="javascript:;">所有商品</a>
				<span>></span> <a href="javascript:;">产品详情</a>
			</div>
			<div class="product-intro layui-clear">
				<div class="preview-wrap">
					<a href="javascript:;"><img
						src='<c:url value="/${book.book_image}"/>' style="width: 90%" id="midimg"></a>
				</div>
					<div id="bigView" style="display:none;"><img width="500" height="500" alt="" src='<c:url value="/${book.book_image}"/>' /></div>
				<div style='display:none;' id='winSelector'></div>
				<div class="itemInfo-wrap">
					<div class="itemInfo">
						<div class="title">
							<h4>${book.book_name}</h4>
							<span><i class="layui-icon layui-icon-star dj" id="sc"></i>收藏</span>
							<input type="hidden" value="true" id="flag">
						</div>
						<div class="summary" style="height: auto;">
							<p class="reference">
								<span>参考价</span>
								<del>￥280.00</del>
							</p>
							<p class="activity">
								<span>活动价</span><strong class="price"><i>￥</i>${book.book_price}</strong>
							</p>
							<p>
								<span>书籍详情</span><strong>${book.book_synopsis}</strong>
							</p>
						</div>
						<form method="post" id="cartForm">
							<input type="hidden" value="${book.book_id}" name="bid" id="bid">
							<input type="hidden" value='<c:url value="/"/>' id="url">
							<input type="hidden" value="${book.is_collection}"
								id="isCollection">
							<div class="choose-attrs">
								<!--               <div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span> <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div></div>
	 -->
								<div class="number layui-clear">
									<span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
									<div class="number-cont">
										<span class="cut btn">-</span><input
											onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
											onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
											maxlength="4" type="" name="count" value="1"><span
											class="add btn">+</span>
									</div>
								</div>
							</div>
							<div class="choose-btns">
								<button class="layui-btn layui-btn-primary purchase-btn"
									type="button" onclick="addCarts()">立刻购买</button>
								<button class="layui-btn  layui-btn-danger car-btn"
									type="button" onclick="addCarts()">
									<i class="layui-icon layui-icon-cart-simple"></i>加入购物车
								</button>
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
			base : '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use([ 'form', 'mm', 'jquery' ], function() {
			var mm = layui.mm, $ = layui.$, form = layui.form;
			var cur = $('.number-cont input').val();
			$('.number-cont .btn').on('click', function() {
				if ($(this).hasClass('add')) {
					cur++;

				} else {
					if (cur > 1) {
						cur--;
					}
				}
				$('.number-cont input').val(cur)
			})
			collection();
		});
		//添加购物车
		function addCarts() {
			var bookId = $('#bid').val();
			var url = $('#url').val();
			var form = document.getElementById("cartForm");
			form.action = url + "/book/addCart?bookId=" + bookId
			form.submit();
		}

		//页面加载事件判断收藏 样式
		function collection() {
			var flag = $('#isCollection').val();
			if (flag == "true") {
				$('#sc').removeClass("layui-icon layui-icon-star dj");
				$('#sc').addClass("layui-icon layui-icon-star-fill dj");
			} else {
				$('#sc').removeClass("layui-icon layui-icon-star-fill dj");
				$('#sc').addClass("layui-icon layui-icon-star dj");
			}
		}
		//是否收藏
		$('#sc').click(function() {
			var flag = $('#flag').val();
			var bookId = $('#bid').val();
			$.ajax({
				url : "<c:url value='/book/collection'/>",
				type : "post",
				dataType : 'json',
				async : false,
				data : {
					"bookId" : bookId,
					"flag" : flag
				},
				error : function() {
					alert("出错");
				},
				success : function(data) {
					if (data.isCollection) {
						$('#sc').removeClass("layui-icon layui-icon-star dj");
						$('#sc').addClass("layui-icon layui-icon-star-fill dj");
						$('#flag').val(false);
					} else {
						$('#sc').removeClass("layui-icon layui-icon-star-fill dj");
						$('#sc').addClass("layui-icon layui-icon-star dj");
						$('#flag').val(true);
					}
	
				}
			});
		});
		
		// 解决 ie6 select框 问题
		/*$.fn.decorateIframe = function(options) {
	        if ($.browser.msie && $.browser.version < 7) {
	            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
	            $(this).each(function() {
	                var $myThis = $(this);
	                //创建一个IFRAME
	                var divIframe = $("<iframe />");
	                divIframe.attr("id", opts.iframeId);
	                divIframe.css("position", "absolute");
	                divIframe.css("display", "none");
	                divIframe.css("display", "block");
	                divIframe.css("z-index", opts.iframeZIndex);
	                divIframe.css("border");
	                divIframe.css("top", "0");
	                divIframe.css("left", "0");
	                if (opts.width == 0) {
	                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
	                }
	                if (opts.height == 0) {
	                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
	                }
	                divIframe.css("filter", "mask(color=#fff)");
	                $myThis.append(divIframe);
	            });
	        }
	    }
	    $.fn.decorateIframe.defaults = {
	        iframeId: "decorateIframe1",
	        iframeZIndex: -1,
	        width: 0,
	        height: 0
	    }
		 //放大镜视窗
	    $("#bigView").decorateIframe();
	    //点击到中图
	    var midChangeHandler = null;
	    
		//大视窗看图
		function mouseover(e) {
		    if ($("#winSelector").css("display") == "none") {
		        $("#winSelector,#bigView").show();
		    }
		    $("#winSelector").css(fixedPosition(e));
		    e.stopPropagation();
		}
		function mouseOut(e) {
		    if ($("#winSelector").css("display") != "none") {
		        $("#winSelector,#bigView").hide();
		    }
		    e.stopPropagation();
		}
		$("#midimg").mouseover(mouseover); //中图事件
	    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

	    var $divWidth = $("#winSelector").width(); //选择器宽度
	    var $divHeight = $("#winSelector").height(); //选择器高度
	    var $imgWidth = $("#midimg").width(); //中图宽度
	    var $imgHeight = $("#midimg").height(); //中图高度
	    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度
	    
	    function fixedPosition(e) {
	        if (e == null) {
	            return;
	        }
	        var $imgLeft = $("#midimg").offset().left; //中图左边距
	        var $imgTop = $("#midimg").offset().top; //中图上边距
	        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
	        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
	        X = X < 0 ? 0 : X;
	        Y = Y < 0 ? 0 : Y;
	        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
	        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

	        if ($viewImgWidth == null) {
	            $viewImgWidth = $("#bigView img").outerWidth();
	            $viewImgHeight = $("#bigView img").height();
	            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
	                $viewImgWidth = $viewImgHeight = 800;
	            }
	            $height = $divHeight * $viewImgHeight / $imgHeight;
	            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
	            $("#bigView").height($height);
	        }
	        var scrollX = X * $viewImgWidth / $imgWidth;
	        var scrollY = Y * $viewImgHeight / $imgHeight;
	        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
	        $("#bigView").css({ "top": 75, "left": $(".preview-wrap").offset().left + $(".preview-wrap").width() + 15 });
	        return { left: X, top: Y };
	    }*/
	</script>
</body>
</html>