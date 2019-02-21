<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <title>购物+</title>
	  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/css/style.css" rel="stylesheet">

	  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->
  </head>
<body class="other-page shop">

		<jsp:include page="include/newHead.jsp"/>
		
		
		<section class="page-content-wrapper">
			<div class="container">
				<div class="row">
					<div class="content-full pt-50 pb-55 fix">
						<div class="col-md-12">

							<div class="main-menu lemon-bg" style="width:100%">
								<nav>
									<ul id="nav">
										<li><a id="11">水</a>&nbsp;</li>
										<li><a id="22">乳</a>&nbsp;</li>
										<li><a id="33">面霜</a>&nbsp;</li>
										<li><a id="44">精华</a>&nbsp;</li>
										<li><a id="55">套装</a>&nbsp;</li>
									</ul>
								</nav>
							</div>
			
							<div name="productArea1" class="row pd-10" id="productArea1">
							</div>
			
							<div name="productArea2" class="row" id="productArea2">
							</div>
			
							<div name="productArea3" class="row" id="productArea3">
							</div>
			
			                <div name="productArea4" class="row" id="productArea4">
							</div>
			
							<div name="productArea5" class="row" id="productArea5">
							</div>
			
							<div name="productArea6" class="row" id="productArea6">
							</div>


							
						</div>
					</div>
				</div>
			</div>
		</section>
    
<jsp:include page="include/newFoot.jsp"/>
  <script type="text/javascript">
  
  $("#11").css('color','green');
  $("#productArea2").hide();
  $("#productArea3").hide();
  $("#productArea4").hide();
  $("#productArea5").hide();
  
  $(document).ready(function(){
	  
	  $("#11").click(function(){
		  $("#productArea1").show();  
		  $("#productArea2").hide();
		  $("#productArea3").hide();
		  $("#productArea4").hide();
		  $("#productArea5").hide();
		  $("#11").css('color','green');
		  $("#22").css('color','white');
		  $("#33").css('color','white');
		  $("#44").css('color','white');
		  $("#55").css('color','white');
		  });
	  
	  $("#22").click(function(){
		  $("#productArea1").hide();  
		  $("#productArea2").show();
		  $("#productArea3").hide();
		  $("#productArea4").hide();
		  $("#productArea5").hide();
		  $("#11").css('color','white');
		  $("#22").css('color','green');
		  $("#33").css('color','white');
		  $("#44").css('color','white');
		  $("#55").css('color','white');
		  });
	  
	  $("#33").click(function(){
		  $("#productArea1").hide();  
		  $("#productArea2").hide();
		  $("#productArea3").show();
		  $("#productArea4").hide();
		  $("#productArea5").hide();
		  $("#11").css('color','white');
		  $("#22").css('color','white');
		  $("#33").css('color','green');
		  $("#44").css('color','white');
		  $("#55").css('color','white');
		  });
	  
	  $("#44").click(function(){
		  $("#productArea1").hide();  
		  $("#productArea2").hide();
		  $("#productArea3").hide();
		  $("#productArea4").show();
		  $("#productArea5").hide();
		  $("#11").css('color','white');
		  $("#22").css('color','white');
		  $("#33").css('color','white');
		  $("#44").css('color','green');
		  $("#55").css('color','white');
		  });
	  
	  $("#55").click(function(){
		  $("#productArea1").hide();  
		  $("#productArea2").hide();
		  $("#productArea3").hide();
		  $("#productArea4").hide();
		  $("#productArea5").show();
		  $("#11").css('color','white');
		  $("#22").css('color','white');
		  $("#33").css('color','white');
		  $("#44").css('color','white');
		  $("#55").css('color','green');
		  });
	  
	});

  
  
  
  
  

	  var loading = layer.load(0);

      var productType = new Array;
      productType[1] = "水";
      productType[2] = "乳";
      productType[3] = "面霜";
      productType[4] = "精华";
      productType[5] = "套装";


	  listProducts();

	  function listProducts() {
		  var allProduct = getAllProducts();
          var mark = new Array;
          mark[1] = 0;
          mark[2] = 0;
          mark[3] = 0;
          mark[4] = 0;
          mark[5] = 0;
          for(var i=0;i<allProduct.length;i++){
              var html = "";
			  var imgURL = "${cp}/img/"+allProduct[i].id+".jpg";
			  html += '<div class="col-sm-4 col-md-4" >'+
					  '<div class="boxes pointer" onclick="productDetail('+allProduct[i].id+')">'+
					  '<div class="big bigimg">'+
					  '<img src="'+imgURL+'">'+
					  '</div>'+
					  '<p class="product-name">'+allProduct[i].name+'</p>'+
					  '<p class="product-price">¥'+allProduct[i].price+'</p>'+
					  '</div>'+
					  '</div>';
              var id = "productArea"+allProduct[i].type;
              var productArea = document.getElementById(id);
              if(mark[allProduct[i].type] == 0){
                  html ='<hr></hr>'+html;
                  mark[allProduct[i].type] = 1;
              }
              productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }
	  function getAllProducts() {
		  var allProducts = null;
		  var nothing = {};
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/getAllProducts',
			  data : nothing,
			  dataType : 'json',
			  success : function(result) {
				  if (result!=null) {
					  allProducts = result.allProducts;
				  }
				  else{
					  layer.alert('查询错误');
				  }
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });
		  //划重点划重点，这里的eval方法不同于prase方法，外面加括号
		  allProducts = eval("("+allProducts+")");
		  return allProducts;
	  }

	  function productDetail(id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = id;
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  jumpResult = result.result;
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });

		  if(jumpResult == "success"){
			  window.location.href = "${cp}/product_detail";
		  }
	  }

  </script>
<%-- <!-- all js here -->
        <script src="${cp}/js-1/vendor/jquery-1.12.4.min.js"></script>
        <script src="${cp}/js-1/bootstrap.min.js"></script>
        <script src="${cp}/js-1/owl.carousel.min.js"></script>
        <script src="${cp}/js-1/isotope.pkgd.min.js"></script>
        <script src="${cp}/js-1/jquery.nivo.slider.js"></script>
		<script src="${cp}/js-1/jquery.simpleLens.min.js"></script>
		<script src="${cp}/js-1/jquery.magnific-popup.min.js"></script>
		<script src="${cp}/js-1/animated-heading.js"></script>
        <script src="${cp}/js-1/price-slider.js"></script>
        <script src="${cp}/js-1/jquery.ajaxchimp.min.js"></script>
        <script src="${cp}/js-1/jquery.countdown.js"></script>
		<script src="${cp}/js-1/jquery.meanmenu.js"></script>
        <script src="${cp}/js-1/plugins.js"></script>
        <script src="${cp}/js-1/main.js"></script>
 --%>
  </body>
</html>