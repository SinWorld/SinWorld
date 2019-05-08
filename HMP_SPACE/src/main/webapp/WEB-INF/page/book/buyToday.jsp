<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>今日团购</title>
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
<%@ include file="head.jsp"%>
<div class="content content-nav-base buytoday-content">
    <div id="list-cont">
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
      <div class="banner-box">
        <div class="banner"></div>
      </div>
      <div class="product-list-box">
        <div class="product-list w1200">  
          <div class="tab-title">
            <a href="javascript:;" class="active tuang" data-content="tuangou">今日团购</a>
            <a href="javascript:;" data-content="yukao">明日预告</a>
          </div>
          <div class="list-cont" cont = 'tuangou'>
            <div class="item-box layui-clear" id="product">
              
            </div>
            <div id="demo0" style="text-align: center;"></div>
          </div>
          <div class="list-cont layui-hide" cont = 'yukao'>
            <div class="item-box layui-clear" id="mryg">
              
          
            </div>
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>  
      </div>
      <div class="footer-wrap">
        <div class="footer w1200">
          <div class="title">
            <h3>团购销量榜</h3>
          </div>
          <div class="list-box layui-clear" id="footerList">
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
  <script>
	var temp=1;
  layui.config({
    base: '../layui-v2.4.5/layui/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$;
     mm = layui.mm;
      laypage.render({
        elem: 'demo0'
        ,count: ${totalPage}//数据总数
        ,jump: function(obj){
      	   var page=obj.curr;
      	   $.ajax({
     	        url:"<c:url value='/book/pageBook'/>",
     	        type:"post",
     	        data:{"nowPage":page},
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
     	        			$('#product').append("<div class='item'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
 	    	        					+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"'style='width: 80%'></a>"
 	    	        			+"<div class='text-box'><p class='title'>"+data[i].page.rows[j].book_name+"</p><p class='plic'>"
 	    	        					+"<span class='ciur-pic'>￥"+data[i].page.rows[j].book_price+"</span><span class='Ori-pic'>￥208.00</span> <span class='discount'>5折</span>"
 	    	        				+"</p>"
 	    	        			+"</div>"
     	        			+"</div>"
     	        			);
     	        			$('#mryg').append("<div class='item'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
	    	        					+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"'style='width: 80%'></a>"
	    	        			+"<div class='text-box'><p class='title'>"+data[i].page.rows[j].book_name+"</p><p class='plic'>"
	    	        					+"<span class='ciur-pic'>￥"+data[i].page.rows[j].book_price+"</span><span class='Ori-pic'>￥208.00</span> <span class='discount'>5折</span>"
	    	        				+"</p>"
	    	        			+"</div>"
 	        			+"</div>"
 	        			);
     	        		}
     	        	}
     	        	temp++;
     	        }
     	    });
         }
      });


      $('body').on('click','*[data-content]',function(){
        $(this).addClass('active').siblings().removeClass('active')
        var dataConte = $(this).attr('data-content');
        $('*[cont]').each(function(i,item){
          var itemCont = $(item).attr('cont');
          console.log(item)
          if(dataConte === itemCont){
            $(item).removeClass('layui-hide');
          }else{
            $(item).addClass('layui-hide');
          }
        })
      })
      thxlb();
});
  function initBookDetails(bookId){
		window.open("<c:url value='/book/queryBookById'/>?bookId="+bookId);
	}
  
  function thxlb(){
	  for(var i=0;i<=2;i++){
		  $('#footerList').append("<div class='item'><img src='../layui-v2.4.5/layui/static/img/ys.jpg'style='width: 100%'>"
	    			+"<div class='text'>"
						+"<div class='right-title-number'>1</div>"
	    				+"<div class='commod'>"
	    					+"<p>哑舍</p>"
	    					+"<span>￥100.00</span>"
	    				+"</div>"
	    			+"</div>"
	    			+"</div>");
	  }
  }
</script>
</body>
</html>