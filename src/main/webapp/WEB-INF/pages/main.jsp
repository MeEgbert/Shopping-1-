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
      <link rel="shortcut icon" type="image/x-icon" href="${cp}/css-2/img/favicon.ico">

        <!-- Google Fonts
        ============================================ -->
        <link href='http://fonts.googleapis.com/css?family=Norican' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

        <!-- Bootstrap CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/bootstrap.min.css">
        <!-- Bootstrap CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/font-awesome.min.css">
        <!-- owl.carousel CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/owl.carousel.css">
        <link rel="stylesheet" href="${cp}/css-2/css/owl.theme.css">
        <link rel="stylesheet" href="${cp}/css-2/css/owl.transitions.css">
        <!-- jquery-ui CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/jquery-ui.css">
        <!-- meanmenu CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/meanmenu.min.css">
        <!-- nivoslider CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/lib/css/nivo-slider.css">
        <link rel="stylesheet" href="${cp}/css-2/lib/css/preview.css">
        <!-- animate CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/animate.css">
        <!-- magic CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/magic.css">
        <!-- normalize CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/normalize.css">
        <!-- main CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/main.css">
        <!-- style CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/style.css">
        <!-- responsive CSS
        ============================================ -->
        <link rel="stylesheet" href="${cp}/css-2/css/responsive.css">
        <!-- modernizr JS
        ============================================ -->
        <script src="${cp}/css-2/js/vendor/modernizr-2.8.3.min.js"></script>
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
	  layer.close(loading);
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
                html += '<div class="col-sm-4 col-md-4" style="width:285px;">'+
                '<div class="features-product home2">'+
                '<div class="container">'+
                '<div class="features-home2-slider"> '+
                  ' <div class="col-md-12">'+
                   '<div class="single-product">'+
                 '<div class="level-pro-new">'+
                      '<span>sale</span>'+
                  '</div>'+
                  '<div class="product-img">'+
                      '<a href="#">'+
                          '<img src="'+imgURL+'"  class="primary-img">'+
                          '<img src="'+imgURL+'" alt="" class="secondary-img">'+
                      '</a>'+
                  '</div>'+
                  '<div class="actions" style="width:285px;">'+
                      '<button type="submit" class="cart-btn" title="Add to cart" onclick="productDetail('+allProduct[i].id+')">add to cart</button>'+
                      '<ul class="add-to-link">'+
                         ' <li><a class="modal-view" data-target="#productModal" data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>'+
                          '<li><a href="#"> <i class="fa fa-heart-o"></i></a></li>'+
                          '<li><a href="#"> <i class="fa fa-refresh"></i></a></li>'+
                      '</ul>'+
                  '</div>'+
                  '<div style="background-color: transparent;;padding: 5px 10px 10px;">'+
                      '<div >'+
                          '<a href="#" title="Fusce aliquam" style="margin-top: 10px; margin-bottom: 5px;color: #333;font-size: 20px;font-weight: 500;text-transform: uppercase;">'+allProduct[i].name+'</a>'+
                      '</div>'+
                      '<div class="price-rating">'+
                      '<span>¥'+allProduct[i].price+'</span>'+
                          '<div class="ratings">'+
                              '<i class="fa fa-star"></i>'+
                              '<i class="fa fa-star"></i>'+
                              '<i class="fa fa-star"></i>'+
                              '<i class="fa fa-star"></i>'+
                              '<i class="fa fa-star-half-o"></i>'+
                          '</div>'+
                      '</div>'+
                  '</div>'+
              '</div>'+
               '</div>'+
            '</div>'+
        '</div>'+
        '</div>'+
    '</div>';
              var id = "productArea"+allProduct[i].type;
              var productArea = document.getElementById(id);
              if(mark[allProduct[i].type] == 0){
                  html =''+html;
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
		  allProducts = eval("("+allProducts+")");
		  return allProducts;
	  }

	  function productDetail(Id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = Id;
		  $.ajax({
			  async : false, 
			  type : 'POST',
			  url : '${cp}/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  Result = result.result;
			  },
			  error : function() {
				  layer.alert('查询错误');
			  }
		  });

		  if(Result == "success"){
			  window.location.href = "${cp}/product_detail";
		  }
	  }

  </script>
      <script src="${cp}/css-2/js/vendor/jquery-1.12.1.min.js"></script>
        <script src="${cp}/css-2/js/wow.min.js"></script>

        <script src="${cp}/css-2/js/jquery.meanmenu.js"></script>

        <script src="${cp}/css-2/js/owl.carousel.min.js"></script>

        <script src="${cp}/css-2/js/main.js"></script>
  </body>
</html>