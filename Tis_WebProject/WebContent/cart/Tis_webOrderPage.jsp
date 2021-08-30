<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link type="text/css" rel="stylesheet" href="js/jquery/chosen/chosen.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/custom.css?ts=1545872428" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		/* 
		var goodsPriceSum = parseInt($("#goodsPriceSum").text());
		var totalDeliveryCharge = parseInt($("#totalDeliveryCharge").text());
		$("#totalSettlePrice").text(goodsPriceSum + totalDeliveryCharge);
		$("#totalSettlePriceView").text(goodsPriceSum + totalDeliveryCharge);
		
		$.fn.nullCheck=function(){
			var needInput = $("input:text").not("#phoneNum,#receiverPhone,#orderMemo");
			for(var i=0;i<needInput.length;i++){
				if(needInput[i].value==""||needInput[i].value==null){
					alert("필수항목을 입력하세요")
					needInput[i].focus();
					return false;
				}
			}
			
			$("#frmOrder").submit()
		}
		*/
		
		
		$.fn.nullCheck=function(){
			//받는사람 이름 정규식
			var regName=/^[가-힣]{2,}$/;
			if(regName.test($("#receiverName").val())==false) {
				alert("이름을 정확히 입력해주세요");
				$("#receiverName").focus();
				return false;
			}
			
			if($("#sample6_postcode").val()==null || $("#sample6_postcode").val()=="") {
				alert("우편번호를 입력해주세요");
				$("#sample6_postcode").focus();
				$(".btn_post_search").css("border","3px solid red");
				return false;
			}
			
			//밥는사람 휴대폰번호 정규식
			var regCellphone = /^[0-9]{0,11}$/;
			if(regCellphone.test($("#reveicerCellPhone").val())==false) {
				alert("휴대폰번호를 정확히 입력해주세요");
				$("#receiverCellPhone").focus();
				return false;
			}
			
			$("#frmOrder").submit()
			
		}
		
	});
</script>
	
<!-- 우편번호 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
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
						<em><a href="main.html" class="local_home">HOME</a> &gt; 주문서 작성 / 결제</em>
					</div>
				</div>
				<div class="sub_content">
					<div class="content_box">
						<form id="frmOrder" name="frmOrder" action="orderComplete.do"
							method="post" novalidate="novalidate">
							 
							<input type="hidden" name="user_id" value="${id }">
							
							<div class="order_wrap">
								<div class="order_tit">
									<h2>주문서작성/결제</h2>
								</div>

								<div class="order_cont">

									<div class="cart_cont_list">
										<div class="order_cart_tit">
											<h3>주문상세내역</h3>
										</div>

										<div class="order_table_type">
											<table>
												<colgroup>
													<col>
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 13%">
													<col style="width: 10%">
													<col style="width: 10%">
												</colgroup>
												<thead>
													<tr>
														<th>상품/옵션 정보</th>
														<th>수량</th>
														<th>상품금액(원)</th>
														<th>합계금액(원)</th>
														<th>기타</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="orderlist" items="${orderlist }">
												
												<input type="hidden" name="product_id" value="${orderlist.productId }">
												<input type="hidden" name="goods_cnt" value="${orderlist.goodsCnt }">
												<input type="hidden" name="product_size" value="${orderlist.productSize }">
												
													<tr>
														<td class="td_left">
															<div class="pick_add_cont">
																<span class="pick_add_img"> 
																<a href="../goods/goods_view.php?goodsNo=1000000010">
																 <img src="${path }/img/product/${orderlist.productImg1 }" width="40" alt="" title="" class="middle"></a>
																</span>
																<div class="pick_add_info">
																	<em><a href="../goods/goods_view.php?goodsNo=1000000010">${orderlist.productName }</a></em>
																	<div class="pick_option_box">사이즈 ${orderlist.productSize }mm</div>
																	<div class="pick_option_box"></div>
																</div>
															</div></td>
														<td class="td_order_amount">
															<div class="order_goods_num">
																<strong>${orderlist.goodsCnt }개</strong>
															</div>
														</td>
														<td class="td_order_amount"><strong
															class="order_sum_txt price">${orderlist.productPrice }</strong></td>

														<td><strong class="order_sum_txt">${orderlist.productPrice*orderlist.goodsCnt }</strong></td>
														<td class="td_delivery" rowspan="1"><br>
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>	
									<div class="btn_left_box">
										<a style="cursor:pointer" class="shop_go_link" onclick="javascript:history.back()"><em>&lt;
												장바구니 가기</em></a>
									</div>
									<div class="price_sum">
										<div class="price_sum_cont">
											<div class="price_sum_list">
												<dl>
													<dt>
														총 <strong>${fn:length(orderlist) }</strong> 개의 상품금액
													</dt>
													<dd>
														<strong id="goodsPriceSum">${totalGoodsPrice }</strong>원
													</dd>
												</dl>
												<span><img src="img/order_price_plus.png" alt="더하기"></span>
												<dl>
													<dt>배송비</dt>
													<dd>
														<strong id="totalDeliveryCharge">2500</strong>원
													</dd>
												</dl>
												<span><img src="img/order_price_total.png" alt="합계"></span>
												<dl class="price_total">
													<dt>합계</dt>
													<dd>
														<strong id="totalSettlePrice">80,000</strong>원
													</dd>
												</dl>
											</div>
										</div>
									</div>
									<div class="order_view_info">
										<div class="order_info">
											<div class="order_zone_tit">
												<h4 style="display:inline-block">주문자 정보</h4>
												<h6 style="color:red; display:inline-block">*는 필수입력사항</h6>
											</div>
											<div class="order_table_type">
												<table class="table_left">
													<colgroup>
														<col style="width: 15%;">
														<col style="width: 85%;">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row"><span class="important">주문하시는 분 * </span></th>
															<td><input type="text" name="orderName" value="${loginInfo.name }" data-pattern="gdEngKor" maxlength="20"></td>
														</tr>
														<tr>
															<th scope="row"><span class="important">휴대폰 번호 * </span></th>
															<td>
																<input type="text" id="mobileNum1" name="orderCellPhone" value="010" maxlength="20" style="width:60px"> -
																<input type="text" id="mobileNum2" name="orderCellPhone" value="${fn:substring(loginInfo.phone,3,7) }" maxlength="20" style="width:90px"> -
																<input type="text" id="mobileNum3" name="orderCellPhone" value="${fn:substring(loginInfo.phone,7,11) }" maxlength="20" style="width:90px">
															</td>
														</tr>
														<tr>
															<th scope="row">전화번호</th>
															<td><input type="text" id="phoneNum" name="orderPhone" value="" maxlength="20" placeholder="없을시 휴대폰번호"></td>
														</tr>
														<tr>
															<th scope="row"><span class="important">이메일 * </span></th>
															<td class="member_email">
																<input type="text" name="orderEmail" value="${fn:substringBefore(loginInfo.email,'@') }"> @ 
																<input type="text" name="orderEmail" value="${fn:substringAfter(loginInfo.email,'@') }">
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="delivery_info">
											<div class="order_zone_tit">
												<h4 style="display:inline-block">배송정보</h4>
												<h6 style="color:red; display:inline-block">*는 필수입력사항</h6>
											</div>
											<div class="order_table_type shipping_info">
												<table class="table_left shipping_info_table">
													<colgroup>
														<col style="width: 15%;">
														<col style="width: 85%;">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row"><span class="important">받으실분 * </span></th>
															<td><input type="text" name="receiverName" id="receiverName"
																data-pattern="gdEngKor" maxlength="20" autocomplete="off"></td>
														</tr>
														<tr>
															<th scope="row"><span class="important">받으실 곳 * </span></th>
															<td class="member_address">
																<div class="address_postcode">
																	<input type="text" name="receiverZonecode" id="sample6_postcode" readonly="readonly" autocomplete="off"> 
																	<input type="hidden" name="receiverZipcode"> 
																	<span 	id="receiverZipcodeText" class="old_post_code"></span>
																	<button type="button" class="btn_post_search" onclick="sample6_execDaumPostcode();">우편번호검색</button>
																</div>
																<div class="address_input">
																	<input type="text" name="receiverAddress" id="sample6_address" readonly="readonly" autocomplete="off">
																	<input type="text" id="sample6_extraAddress" placeholder="참고항목" autocomplete="off"><br>
																	<input type="text" name="receiverAddressSub" id="sample6_detailAddress" placeholder="상세주소" autocomplete="off">
																</div>
															</td>
														</tr>
														<tr>
															<th scope="row">전화번호</th>
															<td><input type="text" id="receiverPhone" name="receiverPhone"></td>
														</tr>
														<tr>
															<th scope="row"><span class="important">휴대폰 번호 * </span></th>
															<td><input type="text" id="receiverCellPhone" name="receiverCellPhone"></td>
														</tr>
														<tr>
															<th scope="row">남기실 말씀</th>
															<td class="td_last_say"><input type="text" id="orderMemo" name="orderMemo"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="payment_info">
											<div class="order_zone_tit">
												<h4>결제정보</h4>
											</div>

											<div class="order_table_type">
												<table class="table_left">
													<colgroup>
														<col style="width: 15%;">
														<col style="width: 85%;">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">상품 합계 금액</th>
															<td><strong id="totalGoodsPrice"
																class="order_payment_sum">${totalGoodsPrice }</strong></td>
														</tr>
														<tr>
															<th scope="row">배송비</th>
															<td><span id="totalDeliveryCharge">2500</span>원 <span class="multi_shipping_text"></span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="payment_progress">
											<div class="order_zone_tit">
												<h4>결제수단 선택 / 결제</h4>
											</div>

											<div class="payment_progress_list">
												<div class="js_pay_content">

													<div id="settlekind_general" class="general_payment">
														<dl>
															<dt>일반결제</dt>
															<dd>
																<input type="radio" id="Kind_gb" name="Kind" value="신용카드" checked>&nbsp;신용카드&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" id="" name="Kind" value="무통장입금" checked>&nbsp;무통장입금&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" id="" name="Kind" value="휴대폰결제" checked>&nbsp;휴대폰결제&nbsp;&nbsp;&nbsp;&nbsp;
															</dd>
														</dl>
													</div>
												</div>

											</div>
											<div class="payment_final">
												<div class="payment_final_total">
													<dl>
														<dt>최종 결제 금액</dt>
														<dd>
															<span><strong id="totalSettlePriceView">80,000</strong>원</span>
														</dd>
													</dl>

												</div>
												<br>
												<div class="btn_center_box">
													<button type="button" class="btn_order_buy order-buy" onclick="$(this).nullCheck()">
														<em>결제하기</em>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="../common/Tis_webFooter.jsp"></jsp:include>


	</div>
</body>
</html>