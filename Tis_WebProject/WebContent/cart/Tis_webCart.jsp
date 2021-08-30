<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 리스트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="csrf-token" content="MTYxNDU4Nzc4NTI1NjI2MTQxODQ5MDQwNDY3MDAwMjMzNjgzNjU1MjA4" />

    <link type="text/css" rel="stylesheet" href="css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/common.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/goods/list.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/button.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/member/member.css?ts=1545872428" />
	<link type="text/css" rel="stylesheet" href="css/order/order.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/goods/goods.css?ts=1545872428" />    
    <link type="text/css" rel="stylesheet" href="css/custom.css?ts=1545872428" />
    
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		//수량 1이하 입력불가
		$(".product_amount").on("change",function(){
			if($(this).val()<1){
				$(this).val(1);
			}
		});
		
		var count = $("#listcount").val();
		
		//총 수량, 총 주문금액 함수
		$.fn.totalSettlePrice=function(){
			totalGoodsCnt = $(".goods_select:checked").length;
			$("#totalGoodsCnt").text(totalGoodsCnt);
			
			var totalPriceSum=parseInt(0);
			for(var i=0;i<count;i++){
				if ( $(".goods_select")[i].checked == true){
					var productTotalPrice = parseInt($("#frmCart input[name=goods_select]:checked").parent().siblings("#td_total_price")[i].innerText);
					$("#totalGoodsPrice").text(totalPriceSum+=productTotalPrice);
				} else {
					$("#totalGoodsPrice").text(totalPriceSum);
				}
			}
			
			var totalGoodsPrice = $("#totalGoodsPrice").text();
			var totalDeliveryPrice = $("#totalDeliveryCharge").text();
			$("#totalSettlePrice").text(parseInt(totalGoodsPrice) + parseInt(totalDeliveryPrice));
		}
		
		//체크박스 컨트롤
	  	$("#select_all").on("click",function(){
			var sBoxes = $(".goods_select")
			
			if($(this).prop("checked")==true){
				sBoxes.prop("checked",true);
			}
			else{
				sBoxes.prop("checked",false);
			}
			
			$.fn.totalSettlePrice();
		});
		
		$(".goods_select").click(function() {
			if ( $("input[name='goods_select']:checked").length == count){
				$("#select_all").prop("checked", true);
			} else {
				$("#select_all").prop("checked", false);
			}
		});
		
		//체크박스 선택 해제시 총 주문 가격 변동
	 	$(".goods_select").on("change", function() {
	 		var totalGoodsCnt = $(".goods_select:checked").length;
			$("#totalGoodsCnt").text(totalGoodsCnt);
			
			var totalPriceSum=parseInt(0);
			for(var i=0; i<count; i++){
				if ( $(".goods_select")[i].checked == true){
					var productTotalPrice = parseInt($(".total_price")[i].innerHTML);
					$("#totalGoodsPrice").text(totalPriceSum+=productTotalPrice);
				} else {
					$("#totalGoodsPrice").text(totalPriceSum);
				}
			}
			
			var totalGoodsPrice = $("#totalGoodsPrice").text();
			var totalDeliveryPrice = $("#totalDeliveryCharge").text();
			$("#totalSettlePrice").text(parseInt(totalGoodsPrice) + parseInt(totalDeliveryPrice));	
	 	});
	 	
	 	//상품가격 * 수량 , 총 주문금액
	 	var totalGoodsCnt = $(".goods_select:checked").length;
		$("#totalGoodsCnt").text(totalGoodsCnt);
		
		var totalPriceSum=parseInt(0);
		for(var i=0; i<totalGoodsCnt; i++){
			var productTotalPrice = parseInt($(".total_price")[i].innerHTML);
			$("#totalGoodsPrice").text(totalPriceSum+=productTotalPrice);
		}
		
		var totalGoodsPrice = $("#totalGoodsPrice").text();
		var totalDeliveryPrice = $("#totalDeliveryCharge").text();
		$("#totalSettlePrice").text(parseInt(totalGoodsPrice) + parseInt(totalDeliveryPrice));
		
		
		//수량변경 시 상품가격 * 수량 
		$(".product_amount").on("change keyup",function(){
			var productAmount = $(this).val();
			var price = $(this).parents("td").next().children("strong").text();
			$(this).parents("td").next().next().children("strong").text(productAmount * price);
			
			$.fn.totalSettlePrice();
		});
		
		
		//개별삭제	
		$(".del_btn").click(function (){
			var productId = $(this).parent().parent().children().children(".goods_select").val();
			var userId = $("#user_id").val();
			var cartDeleteConfirm = confirm("장바구니에서 삭제하시겠습니까");
			if(cartDeleteConfirm==true){
				location.href="cartDelete.do?id="+userId+"&productid="+productId;
			}
		});
		
		//선택 상품 삭제
		$("#btn_order_choice_del").on("click",function(){
			//var productId = $("#frmCart input[name=goods_select]")[0].value;		//더미
			var userId = $("#user_id").val();
			var productIdArr = $("#frmCart input[name=goods_select]:checked").serialize();
			var cartDeleteConfirm = confirm("장바구니에서 삭제하시겠습니까");
			if(cartDeleteConfirm==true){
				location.href="cartDelete.do?id="+userId+"&"+productIdArr;
			}
		});
		
		//선택 상품 주문
		$("#btn_order_choice_buy").on("click",function(){
			var userId = $("#user_id").val();
			var totalGoodsPrice = $("#totalGoodsPrice").text();
			var productIdArr = $("#frmCart input[name=goods_select]:checked").serialize();
			var goodsCntArr = $("#frmCart input[name=goods_select]:checked").parent().siblings(".td_order_amount").children("div").children().serialize()
			var productSizeArr = $("#frmCart input[name=goods_select]:checked").next().serialize()
			if(confirm("선택상품을 주문하시겠습니까")==true){
				location.href="orderList.do?id="+userId+"&totalGoodsPrice="+totalGoodsPrice+"&"+productIdArr+"&"+goodsCntArr+"&"+productSizeArr;
			}
		});
		
		//전체 상품 주문
		$("#btn_order_whole_buy").on("click",function(){
			var userId = $("#user_id").val();
			var totalGoodsPrice = $("#totalGoodsPrice").text();
			var productIdArr = $("#frmCart input[name=goods_select]").serialize();
			var goodsCntArr = $("#frmCart input[name=goods_select]").parent().siblings(".td_order_amount").children("div").children().serialize()
			var productSizeArr = $("#frmCart input[name=goods_select]").next().serialize()
			if(confirm("모든 상품을 주문하시겠습니까")==true){
				location.href="orderList.do?id="+userId+"&totalGoodsPrice="+totalGoodsPrice+"&"+productIdArr+"&"+goodsCntArr+"&"+productSizeArr;
			}
		});
		
	});
</script>
</head>

<body class="body-member body-join pc">

	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="../common/Tis_webTop.jsp"></jsp:include>
		<div id="container">
			<div id="contents">

				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.jsp" class="local_home">HOME</a> &gt; 장바구니</em>
					</div>
				</div>

				<div class="sub_content">


					<div class="content_box">
						<div class="order_wrap">
							<div class="order_tit">
								<h2>장바구니</h2>
							</div>

							<div class="cart_cont">
							

								<form id="frmCart" name="frmCart" method="post" target="ifrmProcess">
								<input type="hidden" name = "listcount" id = "listcount" value = "${count}">
									<div class="cart_cont_list">
										<div class="order_cart_tit"></div>

										<div class="order_table_type">
											<table>
												<colgroup>
													<col style="width: 5%">													
													<col>
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 10%">
													<col style="width: 10%">
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox" id="select_all"  checked = "checked" autocomplete="off"></th>
														<th>상품/옵션 정보</th> 
														<th>수량</th>
														<th>상품금액(원)</th>
														<th>합계금액(원)</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													
												<c:forEach var="cartlist" items="${cartlist }">
													<tr>
														<td>
															<input type="checkbox" name="goods_select" class="goods_select" checked="checked" value="${cartlist.productId }" autocomplete="off">
															<input type="hidden" name="product_size" value="${cartlist.productSize }">
														</td>
														<td class="td_left">
															<div class="pick_add_cont">
																<span class="pick_add_img"> 
																<img src="${path }/img/product/${cartlist.productImg1 }" width="40" alt="" title="" class="middle">
																</span>
																<div class="pick_add_info">

																	<em>${cartlist.productName }</em>
																	<div class="pick_option_box">사이즈 : ${cartlist.productSize }mm</div>

																	<div class="pick_option_box"></div>
																</div>
															</div>
														</td>
														<td class="td_order_amount">
															<div class="order_goods_num">
																<input type="text" class="product_amount" name="product_amount" value="${cartlist.goodsCnt }" autocomplete="off">
															</div>
														</td>
														<td class="td_order_amount">
															<strong class="order_sum_txt price">${cartlist.productPrice }</strong>
															<p class="add_currency"></p>
															
														</td>
															
														<td id="td_total_price"><strong class="total_price">${cartlist.productPrice * cartlist.goodsCnt }</strong>
															<p class="add_currency"></p></td>
														<td class="td_delivery" rowspan="1">
															<button type="button" class="del_btn"><img src="img/delete.png"></button>
															<!-- <input type="button" class="del_btn" value="장바구니에서 제외"> -->
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
											
											<input type="hidden" value="${id}" id="user_id" name="user_id">
										</div>
									</div>
								</form>
								
								<p></p>
								
								<c:if test="${endPage<pageSum }">
									<a href="cartList.do?id=${id }&page=${i }">[이전]</a>
								</c:if>
								
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:choose>
										<c:when test="${i==pageNum }">
											<div style="text-align:center"><font color="grey">${i }</font></div>
										</c:when>
										<c:otherwise>
											<a href="cartList.do?id=${id }&page=${i }">[${i }]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${startPage>10 }">
									<a href="cartList.do?id=${id }&page=${i }">[다음]</a>
								</c:if>
	
								<p></p>
								<div class="btn_left_box">
									<a href="main.jsp" class="shop_go_link"><em>&lt;	쇼핑 계속하기</em></a>
								</div>

								<div class="price_sum">
									<div class="price_sum_cont">
										<div class="price_sum_list">
											<dl>
												<dt>
													총 <strong id="totalGoodsCnt"></strong> 개의 상품금액
												</dt>
												<dd>
													<strong id="totalGoodsPrice">0</strong>원
												</dd>
											</dl>
											<span><img src="img/order_price_plus.png" 	alt="더하기"></span>
											<dl>
												<dt>배송비</dt>
												<dd>
													<strong id="totalDeliveryCharge">2500</strong>원
												</dd>
											</dl>
											<span><img src="img/order_price_total.png" 	alt="합계"></span>
											<dl class="price_total">
												<dt>합계</dt>
												<dd>
													<strong id="totalSettlePrice"></strong>원
												</dd>
											</dl>
										</div>
									</div>
								</div>

								<div class="btn_order_box">
									<span class="btn_left_box">
										<button type="button" class="btn_order_choice_del" id="btn_order_choice_del">선택 상품 삭제</button>
									</span> 
									<span class="btn_center_box">
										<button type="button" class="btn_order_choice_buy" id="btn_order_choice_buy">선택 상품 주문</button>
										<button type="button" class="btn_order_whole_buy" id="btn_order_whole_buy">전체 상품 주문</button>
									</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="../common/Tis_webFooter.jsp"></jsp:include>


	</div>
</body>
</html>