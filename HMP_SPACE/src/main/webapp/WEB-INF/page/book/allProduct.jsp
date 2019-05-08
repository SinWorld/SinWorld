<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有商品</title>
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/static/css/main.css">
<link rel="stylesheet" type="text/css" href="../layui-v2.4.5/layui/css/layui.css">
<script type="text/javascript" src="../layui-v2.4.5/layui/layui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
<%@ include file="head.jsp"%>
<div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <input type="hidden" id="allProduct" value="allProduct">
          <div class="list-box" id="types">
           
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            
            <div class="cont-list layui-clear" id="list-cont">
             
            </div>
            <!-- 模版引擎导入 -->
            <!-- <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}    
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script> -->
            <div id="demo0" style="text-align: center;"></div>
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
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: ${totalPage} //数据总数
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
    	        		$('#list-cont').empty();
    	        	}
    	        	for(var i=0;i<data.length;i++){
    	        		for(var j=0;j<data[i].page.rows.length;j++){
    	        			$('#list-cont').append("<div class='item'><div class='img'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
	    	        					+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"'style='width: 80%'></a></div>"
	    	        			+"<div class='text'><p class='title'>"+data[i].page.rows[j].book_name+"</p><p class='price'>"
	    	        					+"<span class='pri'>￥"+data[i].page.rows[j].book_price+"</span>"
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


    // 模版引擎导入
    //  var html = demo.innerHTML;
    //  var listCont = document.getElementById('list-cont');
    //  // console.log(layui.router("#/about.html"))
    // mm.request({
    //     url: '../json/commodity.json',
    //     success : function(res){
    //       console.log(res)
    //       listCont.innerHTML = mm.renderHtml(html,res)
    //     },
    //     error: function(res){
    //       console.log(res);
    //     }
    //   })
    
  	bookType();
    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    })
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }
    })
  
});
  
//初始化图书种类
  function bookType(){
	//决定跳转页
	var allProuuct=$('#allProduct').val();
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
  	        		$('#types').append( "<dl><dt>"+data[i].codelist_mean+"</dt>"
  	               +"<dd><a  onclick='bookTypeShow("+data[i].codelist_code+")'>"+data[i].codelist_mean+"</a></dd></dl>"
  	             )
  	        	}
  	        }
  	    });
  }
  
  function bookTypeShow(bookId){
		$.ajax({
			url:"<c:url value='/book/queryBookByType'/>",
  	        type:"post",
  	        dataType:'json',
  	      	data:{"nowPage":1,"typeId":bookId},
  	        async:false,
  	        error : function() {
  				alert("出错");
  			},
  	        success:function (data) {
  	        	$('#list-cont').empty();
  	       	for(var i=0;i<data.length;i++){
  	        	for(var j=0;j<data[i].page.rows.length;j++){
	        			$('#list-cont').append("<div class='item'><div class='img'><a onclick='initBookDetails("+data[i].page.rows[j].book_id+")'>"
		        					+"<img src='${pageContext.request.contextPath}/"+data[i].page.rows[j].book_image+"'style='width: 80%'></a></div>"
		        			+"<div class='text'><p class='title'>"+data[i].page.rows[j].book_name+"</p><p class='price'>"
		        					+"<span class='pri'>￥"+data[i].page.rows[j].book_price+"</span>"
		        				+"</p>"
		        			+"</div>"
	        			+"</div>"
	        			);
	        		}
  	        	}
  	        }
  	    });
	}
  
  function initBookDetails(bookId){
		window.open("<c:url value='/book/queryBookById'/>?bookId="+bookId);
	}

  
  
  
</script>
</body>
</html>