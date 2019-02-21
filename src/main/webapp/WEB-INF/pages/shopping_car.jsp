<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SHOPZON</title>
	  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/css/style.css" rel="stylesheet">
	  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/layer.js" type="text/javascript"></script>
    
  </head>
  <body>
    
	<jsp:include page="include/newHead.jsp"/>


		<br><br>
	<section>
	<div class="container-fluid bigHead">
		<div class="row">
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<table class="table table-hover  table-striped  table-responsive table-content" id="shoppingCarTable">
				</table>

				<hr/>
				<div class="row" >
				<button type="button" class="btn btn-danger btn-lg col-lg-4 col-md-2 col-sm-2" onclick="deletePre()">删除</button>
					<div class="col-lg-4 col-md-4 col-sm-4"></div>
					<button type="button" class="btn btn-success btn-lg col-lg-4 col-md-2 col-sm-2" onclick="confirmPre()">确认购买</button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
	</section>

	<jsp:include page="include/newFoot.jsp"/>

<script type="text/javascript">
	    
	listShoppingCars();  
	   function listShoppingCars() {
			var shoppingCarTable = document.getElementById("shoppingCarTable");
			var allShoppingCars = getShoppingCars();
			shoppingCarTable.innerHTML = "";
			var html = '<tr>'+
							'<th>是否购买</th>'+
							'<th>商品图片</th>'+
							'<th>商品名称</th>'+
							'<th>商品单价</th>'+
							'<th>商品数量</th>'+
						'</tr>';
			for(var i=0;i<allShoppingCars.length;i++){
				var product = getProductById(allShoppingCars[i].productId);
				var imgURL = "${cp}/img/"+allShoppingCars[i].productId+".jpg";
				html  += '<tr >'+
						'<td>'+
						'<div '+
						'<label>'+
						'<input type="checkbox"  style="width:20px;height:20px;"  id="checkbox'+allShoppingCars[i].productId+'" value="option1">'+
						'</label>'+
						'</div>'+
						'</td>'+
						'<td><img src="'+imgURL+'"'+" height="+'80px"'+' width="'+'75px'+'"/></td>'+
						'<td>'+product.name+'</td>'+
						'<td>'+product.price+'</td>'+
						'<td>'+allShoppingCars[i].counts+'</td>'+
						'</tr>';
			}
			shoppingCarTable.innerHTML += html;

		} 

	    function getShoppingCars() {

			var shoppingCarProducts = "";
			var user = {};
			user.userId = ${currentUser.id};
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/getShoppingCars',
				data : user,
				dataType : 'json',
				success : function(result) {
					shoppingCarProducts = result.result;
				},
				error : function() {
					layer.alert('查询错误');
				}
			});
			shoppingCarProducts = eval("("+shoppingCarProducts+")");
			return shoppingCarProducts;
		} 

	    function confirmPre() {
			var allShoppingCars = getShoppingCars();
			var buyProducts = new Array;
			var buyProductsCounts = new Array;
			var buyCounts = 0;
			for(var i=0;i<allShoppingCars.length;i++){
				var checkBox = document.getElementById("checkbox"+allShoppingCars[i].productId);
				if(checkBox.checked){
					buyProducts[buyCounts] = allShoppingCars[i].productId;
					buyProductsCounts[buyCounts] = allShoppingCars[i].counts;
					buyCounts++;
				}
			}
			if(buyCounts == 0){
				layer.msg("未选中商品",{icon:2});
			}
			else{
				buyConfirm(buyProducts,buyProductsCounts);
			}
		}
		
	    function deletePre() {
			var allShoppingCars = getShoppingCars();
			var buyProducts = new Array;
			var buyProductsCounts = new Array;
			var buyCounts = 0;
			for(var i=0;i<allShoppingCars.length;i++){
				var checkBox = document.getElementById("checkbox"+allShoppingCars[i].productId);
				if(checkBox.checked){
					buyProducts[buyCounts] = allShoppingCars[i].productId;
					buyProductsCounts[buyCounts] = allShoppingCars[i].counts;
					buyCounts++;
				}
			}
			if(buyCounts == 0){
				layer.msg("未选中商品",{icon:2});
			}
			else{
				deleteConfirm(buyProducts,buyProductsCounts);
			}
		}
		
	    function getProductById(id) {
			var productResult = "";
			var product = {};
			product.id = id;
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/getProductById',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
				},
				error : function(result) {
					layer.alert('查询错误');
				}
			});
			productlist = JSON.parse(productResult);
			return productlist;
		}

      

		 
	     function buyConfirm(productsId,productsCounts) {
			var address = getUserAddress(${currentUser.id});
			var phoneNumber = getUserPhoneNumber(${currentUser.id});
			var totalPrice = 0;
			var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
			'<div class="col-sm-10 col-md-10 col-lg-10">'+
			'<table class="table confirm-margin table-responsive">';

			html +=
				'<tr class="active">'+
					'<td>商品名称</td>'+
					'<td>商品单价</td>'+
					'<td>购买数量</td>'+
				'</tr>';
			for(var i=0;i<productsId.length;i++){
				var product = getProductById(productsId[i]);
			
			html +=
			'<tr>'+
			    '<td>'+product.name+'</td>'+
				'<td>'+product.price+'</td>'+
				'<td>'+productsCounts[i]+'</td>'+
			'</tr>';
			totalPrice+=product.price*productsCounts[i];
			}
			html +='</table>';
			
			html +=
			'<div class="row">'+
				'<div class="col-md-12 col-sm-12 col-xs-12">'+
				    '<div class="col-md-6 col-sm-6 col-xs-12">'+
				    '</div>'+
					'<div class="col-md-6 col-sm-6 col-xs-12">'+
			
							'<table class="table table-hover table-responsive">'+
								'<tbody>'+
									'<tr >'+
							            '<th><font size="3" color="#8bc34a">总金额：</font></th>'+
										'<td>'+totalPrice+'</td>'+
									'</tr>'+
									'<tr >'+
										'<th><font size="3" color="#8bc34a">收货地址：</font></th>'+
									'<td>'+address+'</td>'+
									'<tr >'+
										'<th><font size="3" color="#8bc34a">联系电话：</font></th>'+
									'<td>'+phoneNumber+'</td>'+
									'</tr>'+
								'</tbody>'+
							'</table>'+
						
					'</div>'+
				'</div>'+
			'</div>';

			html +=
			'<div class="row">'+
			'<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
			'<button class="btn btn-success col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecordsPre(['+productsId+'],['+productsCounts+'])">确认购买</button>'+
			'</div>'+
			'</div>';

			layer.open({
				type:1,
				title:'请确认订单信息：',
				content:html,
				area:['650px','400px'],
			});
		}

	     function deleteConfirm(productsId,productsCounts) {
			var address = getUserAddress(${currentUser.id});
			var phoneNumber = getUserPhoneNumber(${currentUser.id});
			var totalPrice = 0;

			var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
					'<div class="col-sm-10 col-md-10 col-lg-10">'+
					'<table class="table confirm-margin">';
			for(var i=0;i<productsId.length;i++){
				var product = getProductById(productsId[i]);
				html +=	'<tr>'+
					'<th>商品'+(i+1)+'名称：</th>'+
					'<td>'+product.name+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>商品单价：</th>'+
					'<td>'+product.price+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>购买数量：</th>'+
					'<td>'+productsCounts[i]+'</td>'+
					'</tr>'+
					'<tr>';
				totalPrice+=product.price*productsCounts[i];
			}
			html +='</table>'+
					'<div class="row">'+
					'<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
					'<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="deleteToShoppingCardPre(['+productsId+'],['+productsCounts+'])">确认删除</button>'+
					'</div>'+
					'</div>';
			layer.open({
				type:1,
				title:'请确认删除信息：',
				content:html,
				area:['650px','350px'],
			});
		}

	     function getUserAddress(id) {
			var address = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/getUserAddressAndPhoneNumber',
				data : user,
				dataType : 'json',
				success : function(result) {
					address = result.address;
				},
				error : function(result) {
					layer.alert('查询错误');
				}
			});
			return address;
		}

		
		
	     function getUserPhoneNumber(id) {
			var phoneNumber = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/getUserAddressAndPhoneNumber',
				data : user,
				dataType : 'json',
				success : function(result) {
					phoneNumber = result.phoneNumber;
				},
				error : function(result) {
					layer.alert('查询错误');
				}
			});
			return phoneNumber;
		}

	     function addToShoppingRecordsPre(productsId,productsCounts) {
			for(var i=0;i<productsId.length;i++){
				addToShoppingRecords(productsId[i],productsCounts[i]);
			}
			layer.confirm('前往订单状态？', {icon: 1, title:'购买成功',btn:['前往订单','继续购买']},
					function(){
						window.location.href = "${cp}/shopping_record";
					},
					function(index){
                        window.location.href = "${cp}/shopping_car";
					}
			);
		}
		
	      function deleteToShoppingCardPre(productsId,productsCounts) {
			for(var i=0;i<productsId.length;i++){
				deleteToShoppingcards(productsId[i],productsCounts[i]);
			}
			layer.confirm('前往商城主页？', {icon: 1, title:'删除成功',btn:['前往首页','继续购买']},
					function(){
						window.location.href = "${cp}/main";
					},
					function(index){
                        window.location.href = "${cp}/shopping_car";
					}
			);
		}
		
	     	     function addToShoppingRecords(productId,productCounts) {

			var shoppingRecord = {};
			shoppingRecord.userId = ${currentUser.id};
			shoppingRecord.productId = productId;
			shoppingRecord.counts = productCounts;
			var buyResult = "";
			$.ajax({
				c : false,
				type : 'POST',
				url : '${cp}/addShoppingRecord',
				data : shoppingRecord,
				dataType : 'json',
				success : function(result) {
					buyResult = result.result;
					var product = getProductById(productId);
					if(buyResult == "success") {
		                deleteShoppingCar(productId);
					}else 
						if(buyResult == "unEnough"){
						layer.alert("商品 "+product.name+" 库存不足，购买失败",{icon:1});
				}
				},
				error : function() {
					layer.alert('购买错误');
				}
			});
	   }
		
		function deleteToShoppingcards(productId,productCounts) {
                deleteShoppingCar(productId);
		}
		
		function deleteShoppingCar(productId) {
            var shoppingCar = {};
            shoppingCar.userId = ${currentUser.id};
            shoppingCar.productId = productId;
            var deleteResult = "";
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/deleteShoppingCar',
                data : shoppingCar,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function(result) {
                    layer.alert('查询用户错误');
                }
            });
            }  
	</script>
  </body>
</html>