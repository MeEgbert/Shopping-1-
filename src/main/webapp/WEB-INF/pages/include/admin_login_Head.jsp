<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html  lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Cart</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="${cp}/image/apple-touch-icon.png">
		<link rel="shortcut icon" type="image/x-icon" href="${cp}/image/icon/favicon.ico">
        <!-- Place favicon.ico in the root directory -->
		<!-- all css here -->
        <link rel="stylesheet" href="${cp}/css-1/bootstrap.min.css">
        <link rel="stylesheet" href="${cp}/css-1/font-awesome.min.css">
        <link rel="stylesheet" href="${cp}/css-1/elegant-font.css">
        <link rel="stylesheet" href="${cp}/css-1/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="${cp}/css-1/meanmenu.min.css">
		<link rel="stylesheet" href="${cp}/css-1/magnific-popup.css">
        <link rel="stylesheet" href="${cp}/css-1/animate.css">
        <link rel="stylesheet" href="${cp}/css-1/owl.carousel.min.css">
		<link rel="stylesheet" href="${cp}/css-1/animate-heading.css">
        <link rel="stylesheet" href="${cp}/css-1/owl.theme.default.min.css">
        <link rel="stylesheet" href="${cp}/css-1/jquery-ui.css">
        <link rel="stylesheet" href="${cp}/css-1/shortcode/shortcodes.css">
        <link rel="stylesheet" href="${cp}/css-1/style.css">
        <link rel="stylesheet" href="${cp}/css-1/responsive.css">
        <script src="${cp}/js-1/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body >

         

        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!-- Header Area Start -->
		<header>
			<!-- Header Menu Area -->
			<div class="menu-area mt-60">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-12">
							<div class="logo-area text-center text-uppercase">
								<a href="index.html"><img src="${cp}/image/icon/logo.png" alt="" /></a>
							</div>
						</div>
						<div class="col-md-9 col-sm-12">
							<div class="main-menu lemon-bg">
								<nav>
									<ul id="nav">
										<li><a href="${cp}/main">主页</a></li>
<!-- 										<li><a href="about.html">About Us</a></li> -->
										<li><a href="${cp}/main">购物</a>
<!-- 											<ul>
												<li><a href="shop.html"><i class="arrow_carrot-right"></i> Shop</a></li>
												<li><a href="shop-grid.html"><i class="arrow_carrot-right"></i> Shop Grid</a></li>
												<li><a href="shop-list.html"><i class="arrow_carrot-right"></i> Shop List</a></li>
												<li><a href="single-product.html"><i class="arrow_carrot-right"></i> Single Product</a></li>
											</ul> -->
										</li>
										<!-- <li><a href="blog.html">BLOG</a>
											<ul>
												<li><a href="blog.html"><i class="arrow_carrot-right"></i>Blog</a></li>
												<li><a href="blog-details.html"><i class="arrow_carrot-right"></i>Blog Details</a></li>
											</ul>
										</li> -->
										<li><a href="${cp}/shopping_car">购物车</a></li>
										<li><a href="${cp}/shopping_record">我的订单</a></li>
										<!-- <li><a href="#">PAGES</a>
											<ul>
												<li><a href="checkout.html"><i class="arrow_carrot-right"></i>Checkout</a></li>
												<li><a href="cart.html"><i class="arrow_carrot-right"></i>Cart</a></li>
												<li><a href="account.html"><i class="arrow_carrot-right"></i>Account</a></li>
												<li><a href="login.html"><i class="arrow_carrot-right"></i>Login</a></li>
											</ul>
										</li> -->
										<!-- <li><a href="portfolio.html">PORTFOLIO</a></li> -->
									</ul>
<%-- <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty currentUser}">
                    <li><a href="${cp}/admin_login" methods="post">登录</a></li>
                </c:if>
                <c:if test="${not empty currentUser}">
                    <c:if test="${currentUser.role == 1}">
                        <li><a href="${cp}/control" methods="post">控制台</a></li>
                    </c:if>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                ${currentUser.name}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <c:if test="${currentUser.role == 1}">
                                <li><a href="${cp}/shopping_handle">处理订单</a></li>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="${cp}/admin_doLogout">注销登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul> --%>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Header Menu Area -->
			<!-- MOBILE-MENU-AREA START --> 
			<div class="mobile-menu-area">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="mobile-area">
								<div class="mobile-menu">
									<nav id="mobile-nav">
										<ul>
											<li><a href="${cp}/main">Home </a>
												
											</li>
											<li><a href="about.html"> About Us </a></li>
											<li><a href="${cp}/main">SHOP</a>
																							</li>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-details.html">Blog Details</a></li>
											<li><a href="#">PAGES</a>
											</li>
											<li><a href="portfolio.html">Portfolio</a></li>
											<li><a href="404.html">404 Error</a></li>
											<li><a href="contact.html">Contact</a></li>
										</ul>
									</nav>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- MOBILE-MENU-AREA END  -->
			<!-- Banner Area Start -->
			<div class="banner-area pb-90 pt-160 bg-2">
				<div class="container">
					<div class="row">
						<div class="banner-content text-center text-white">
							<h1>Cart</h1>
							<ul>
								<li><a href="${cp}/main">home</a> <span class="arrow_carrot-right "></span></li>
								<li>Cart</li>
							</ul>	
						</div>
					</div>
				</div>
			</div>
			<!-- Banner Area End -->
		</header>
        <!-- Header Area End -->
        <!-- Page Content Wraper Area Start -->

<%-- 
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
        <script src="${cp}/js-1/main.js"></script> --%>
        
        <script type="text/javascript">
    function searchProduct() {
        var search = {};
        search.searchKeyWord = document.getElementById("searchKeyWord").value;
        var searchResult = "";
        $.ajax({
            async : false,
            type : 'POST',
            url : '${cp}/searchPre',
            data : search,
            dataType : 'json',
            success : function(result) {
                searchResult = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        if(searchResult == "success")
            window.location.href = "${cp}/search";
    }
</script>
    </body>
</html>

