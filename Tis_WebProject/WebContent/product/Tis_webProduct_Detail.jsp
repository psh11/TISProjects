<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<c:if test="${empty loginUser}">
	<script>
		alert("로그인을 해야 이용가능합니다.");
		location.href="Tis_webLogin.jsp";
	</script>
</c:if>
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

<link type="text/css" rel="stylesheet" href="./css/reset.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/common/common.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/common/layer/layer.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/layout/layout.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/goods/list.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/button.css?ts=1545872428">
<link type="text/css" rel="stylesheet" href="./css/goods/goods.css?ts=1545872428" />
<link type="text/css" rel="stylesheet" href="./css/custom.css?ts=1545872428" />
<link type="text/css" rel="stylesheet" href="./css/paging.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>

<body class="body-goods body-goods-view pc" onload="init();">
	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="../common/Tis_webTop.jsp"></jsp:include>
		<div id="container">
			<div id="contents">
				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="./main.html" class="local_home">HOME</a> &gt; 상품상세정보</em>
					</div>
				</div>
				<div class="sub_content">
					<div class="content_box">
						<div class="item_photo_info_sec">
							<div class="item_photo_view_box">
								<div class="item_photo_view">
									<div class="item_photo_big">
										<span class="img_photo_big">
											<a href="#lyZoom" id="mainImage" class="zoom_layer_open btn_open_layer">
												<img src="./img/product/${list.product_img1}" width="100%" class="middle" /></a></span>
									</div>
								</div>
							</div>

							<div class="item_info_box">
								<div class="item_tit_detail_cont">
									<div class="item_detail_tit">
										<h3>${list.product_name}</h3>
									</div>
									<div class="item_detail_list">
										<dl>
											<dt>정가</dt>
											<dd>
												<del>
													<span>${list.product_price}</span>원
												</del>
											</dd>
										</dl>
										<dl class="item_price">
											<dt>판매가</dt>
											<dd>
												<strong><strong>${list.product_price}</strong></strong>원
											</dd>
										</dl>
										<dl>
											<dt>구매제한</dt>
											<dd>최소 1개</dd>
										</dl>
										<dl class="item_delivery">
											<dt>배송비</dt>
											<dd>
												<strong>2,500원</strong> 
												<input type="hidden" name="deliveryCollectFl" value="pre" /> <strong> / 주문시결제(선결제)</strong>
												<div class="delivery-detail">
													<input type="hidden" name="deliveryMethodFl" value="delivery" />
													<div class="delivery-division">택배</div>
												</div>
											</dd>
										</dl>
										<dl class="item_size">
											<dt>사이즈</dt>
											<dd>
												<select name = "size" id = "size" onchange="sizechange();">
													<option value = "230">230</option>
													<option value = "240">240</option>
													<option value = "250">250</option>
													<option value = "260">260</option>
													<option value = "270">270</option>
												</select>
											</dd>
										</dl>
										<dl>
											<dt>상품코드</dt>
											<dd>${list.product_id}</dd>
										</dl>
									</div>
									<div class="item_choice_list">
										<form name = "product_frm">
										<table class="option_display_area" border="0" cellpadding="0" cellspacing="0">
											<colgroup>
												<col width="220px" />
												<col />
												<col width = "100px" />
												<col width="100px" />
												<col width="40px" />
											</colgroup>
											
											<tbody id="option_display_item_0">
												<tr class="check optionKey_0">
													<td class="cart_prdt_name">
														<div class="cart_tit_box">
															<strong class="cart_tit"> <span>${list.product_name}</span>
																<span id="option_text_display_0"></span>
															</strong>
														</div>
													</td>
													<td>
														<div id = "sizetext">230mm</div>
													</td>
													<td>
														<span class="count"> 
															<span	class="goods_qty"> 
															   <input type="text" name="goodsCnt" id ="goodsCnt" class="text goodsCnt_0" title="수량"  value="1" onchange="change();">
																<button type="button" class = "btn_up" value = "증가" onclick="add();"><img src="./img/btn_count_up.png"></button>
																<button type="button" class = "btn_down" value = "감소" onclick="del();"><img src="./img/btn_count_down.png"></button>
															</span>
														</span>

													</td>
													
													<td class="item_choice_price">
													<input type="hidden" id ="dbprice" value = "${list.product_price}" />
													<input type="hidden" name="PriceSum" id ="PriceSum" value="" /> 
													<div id = "pricesum"><strong></strong></div>
<script type="text/javascript">
document.getElementById('PriceSum').value = document.getElementById('dbprice').value;
var PriceSum;
var count;
	
function init() {
	PriceSum = document.getElementById('PriceSum').value;
	count = document.getElementById('goodsCnt').value;
	document.getElementById('pricesum').innerText = PriceSum + " 원";
	document.getElementById('total_price').innerText = PriceSum + " 원";
}

function add() {
	count = document.getElementById('goodsCnt');
	sum = document.getElementById('PriceSum');
	count.value++;
	sum.value = parseInt(count.value) * PriceSum;
	document.getElementById('pricesum').innerText = sum.value + " 원";
	document.getElementById('total_price').innerText = sum.value + " 원";
}

function del() {
	count = document.getElementById('goodsCnt');
	sum = document.getElementById('PriceSum');
	if ( count.value > 1 ) {
		count.value--;
		sum.value = parseInt(count.value) * PriceSum;
		document.getElementById('pricesum').innerText = sum.value + " 원";
		document.getElementById('total_price').innerText = sum.value + " 원";			
	}
}

function sizechange() {
	var size = document.getElementById("size").value;
	document.getElementById("sizetext").innerHTML = size + "mm";
	
}

function cartSubmit() {
	document.getElementById("product_size").value = document.getElementById("size").value;
	document.product_frm.action = "cartInsert.do";
	document.product_frm.method = "get";
	alert("장바구니에 담겼습니다.");
	document.product_frm.submit();
}
</script>
													
													</td>
												</tr>
											</tbody>
										</table>
										<div class="item_price_cont">
											<div class="end_price item_tatal_box">
												<dl class="total_amount">
													<dt>총 합계금액</dt>
													<dd>
														<div class = "total_price" id = "total_price" ></div>
													</dd>
												</dl>
											</div>
										</div>
										<input type = "hidden" name = "product_id" value ="${list.product_id}">
										<input type = "hidden" name = "member_id" value ="${loginUser.id}">
										<input type = "hidden" id = "product_size" name = "product_size" value ="">
										<!-- 수량은 <input type=text name = "goodsCnt" -->
										<!-- 총가격은 <input type="hidden" name="PriceSum" id ="PriceSum" -->
										</form>
									</div>
									<div class="btn_choice_box">
										<div>
											<a href = "javascript:cartSubmit();"><button type="button" class="btn_add_cart">장바구니</button></a>
											<button type="button" class="btn_add_order">바로 구매</button>
										</div>
									</div>
									<div class="pay_box">
										<div class="payco_pay"></div>
										<div class="naver_pay"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="item_goods_sec">
							<div id="detail">
								<div class="item_goods_tab">
									<ul>
										<li class="on"><a href="#detail">상품상세정보</a></li>
										<li><a href="#delivery">배송안내</a></li>
										<li><a href="#exchange">교환 및 반품안내</a></li>
										<li><a href="#reviews">상품후기 <strong>(${Rtotal})</strong></a></li>
										<li><a href="#qna">상품문의 <strong>(0)</strong></a></li>
									</ul>
								</div>
								<div class="detail_cont">
									<h3>상품상세정보</h3>
									<div class="detail_explain_box">
										<div class="image-manual" style="text-align : center;">
											<img src = "./img/product/${list.product_img2}">
											<img src = "./img/product/${list.product_img3}">
										</div>
										<div class="txt-manual">

											<p>&nbsp;</p>
										</div>
									</div>
								</div>
							</div>
							<div id="delivery">
								<div class="item_goods_tab">
									<ul>
										<li><a href="#detail">상품상세정보</a></li>
										<li class="on"><a href="#delivery">배송안내</a></li>
										<li><a href="#exchange">교환 및 반품안내</a></li>
										<li><a href="#reviews">상품후기 <strong>(${Rtotal})</strong></a></li>
										<li><a href="#qna">상품문의 <strong>(0)</strong></a></li>
									</ul>
								</div>
								<div class="delivery_cont">
									<h3>배송안내</h3>
									<div class="admin_msg">
										<p>-
											배송비&nbsp;:&nbsp;기본배송료는&nbsp;2,500원&nbsp;입니다.&nbsp;(도서,산간,오지&nbsp;일부지역은&nbsp;배송비가&nbsp;추가될&nbsp;수&nbsp;있습니다)&nbsp;&nbsp;50,000원&nbsp;이상&nbsp;구매시&nbsp;무료배송입니다.</p>
										<p>-
											본&nbsp;상품의&nbsp;평균&nbsp;배송일은&nbsp;0일입니다.(입금&nbsp;확인&nbsp;후)&nbsp;설치&nbsp;상품의&nbsp;경우&nbsp;다소&nbsp;늦어질수&nbsp;있습니다.[배송예정일은&nbsp;주문시점(주문순서)에&nbsp;따른&nbsp;유동성이&nbsp;발생하므로&nbsp;평균&nbsp;배송일과는&nbsp;차이가&nbsp;발생할&nbsp;수&nbsp;있습니다.]</p>
										<p>-
											본&nbsp;상품의&nbsp;배송&nbsp;가능일은&nbsp;0일&nbsp;입니다.&nbsp;배송&nbsp;가능일이란&nbsp;본&nbsp;상품을&nbsp;주문&nbsp;하신&nbsp;고객님들께&nbsp;상품&nbsp;배송이&nbsp;가능한&nbsp;기간을&nbsp;의미합니다.&nbsp;(단,&nbsp;연휴&nbsp;및&nbsp;공휴일은&nbsp;기간&nbsp;계산시&nbsp;제외하며&nbsp;현금&nbsp;주문일&nbsp;경우&nbsp;입금일&nbsp;기준&nbsp;입니다.)</p>
									</div>
								</div>
							</div>
							<div id="exchange">
								<div class="item_goods_tab">
									<ul>
										<li><a href="#detail">상품상세정보</a></li>
										<li><a href="#delivery">배송안내</a></li>
										<li class="on"><a href="#exchange">교환 및 반품안내</a></li>
										<li><a href="#reviews">상품후기 <strong>(${Rtotal})</strong></a></li>
										<li><a href="#qna">상품문의 <strong>(0)</strong></a></li>
									</ul>
								</div>
								<div class="exchange_cont">
									<h3>교환 및 반품안내</h3>
									<div class="admin_msg">
										<p>-
											상품&nbsp;택(tag)제거&nbsp;또는&nbsp;개봉으로&nbsp;상품&nbsp;가치&nbsp;훼손&nbsp;시에는&nbsp;상품수령후&nbsp;7일&nbsp;이내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능합니다.</p>
										<p>-
											저단가&nbsp;상품,&nbsp;일부&nbsp;특가&nbsp;상품은&nbsp;고객&nbsp;변심에&nbsp;의한&nbsp;교환,&nbsp;반품은&nbsp;고객께서&nbsp;배송비를&nbsp;부담하셔야&nbsp;합니다(제품의&nbsp;하자,배송오류는&nbsp;제외)</p>
										<p>-
											일부&nbsp;상품은&nbsp;신모델&nbsp;출시,&nbsp;부품가격&nbsp;변동&nbsp;등&nbsp;제조사&nbsp;사정으로&nbsp;가격이&nbsp;변동될&nbsp;수&nbsp;있습니다.</p>
										<p>-
											신발의&nbsp;경우,&nbsp;실외에서&nbsp;착화하였거나&nbsp;사용흔적이&nbsp;있는&nbsp;경우에는&nbsp;교환/반품&nbsp;기간내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;합니다.</p>
										<p>-
											수제화&nbsp;중&nbsp;개별&nbsp;주문제작상품(굽높이,발볼,사이즈&nbsp;변경)의&nbsp;경우에는&nbsp;제작완료,&nbsp;인수&nbsp;후에는&nbsp;교환/반품기간내라도&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;합니다.&nbsp;</p>
										<p>-
											수입,명품&nbsp;제품의&nbsp;경우,&nbsp;제품&nbsp;및&nbsp;본&nbsp;상품의&nbsp;박스&nbsp;훼손,&nbsp;분실&nbsp;등으로&nbsp;인한&nbsp;상품&nbsp;가치&nbsp;훼손&nbsp;시&nbsp;교환&nbsp;및&nbsp;반품이&nbsp;불가능&nbsp;하오니,&nbsp;양해&nbsp;바랍니다.</p>
										<p>-
											일부&nbsp;특가&nbsp;상품의&nbsp;경우,&nbsp;인수&nbsp;후에는&nbsp;제품&nbsp;하자나&nbsp;오배송의&nbsp;경우를&nbsp;제외한&nbsp;고객님의&nbsp;단순변심에&nbsp;의한&nbsp;교환,&nbsp;반품이&nbsp;불가능할&nbsp;수&nbsp;있사오니,&nbsp;각&nbsp;상품의&nbsp;상품상세정보를&nbsp;꼭&nbsp;참조하십시오.&nbsp;</p>
									</div>
									<h3>환불안내</h3>
									<div class="admin_msg">- 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내
										입니다.</div>
									<h3>AS안내</h3>
									<div class="admin_msg">
										<p>- 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</p>
										<p>- A/S는 판매자에게 문의하시기 바랍니다.</p>
									</div>
								</div>
							</div>
							<div id="reviews">
					            <div class="item_goods_tab">
					                <ul>
					                    <li><a href="#detail">상품상세정보</a></li>
					                    <li><a href="#delivery">배송안내</a></li>
					                    <li><a href="#exchange">교환 및 반품안내</a></li>
					                    <li class="on"><a href="#reviews">상품후기 <strong>(${Rtotal})</strong></a></li>
					                    <li><a href="#qna">상품문의 <strong>(0)</strong></a></li>
					                </ul>
					            </div>
					            <div class="reviews_cont">
					                <h3>상품후기</h3>
					                <div id="ajax-goods-goodsreview-list">
					                	<div class="reviews_table">
					                		<form name = "reply_frm" id = "reply_frm">
											    <table class="reviews_table_type">
											        <colgroup>
											            <col width="5%">
											            <col>
											            <col width="13%">
											            <col width="13%">
											            <col width="15%">
											        </colgroup>
											        <thead>
											            <tr>
											                <th>평점</th>
											                <th>제목</th>
											                <th>작성자</th>
											                <th>작성일</th>
											                <th></th>
											            </tr>
											        </thead>
											        <tbody>
											        <c:set var="num" value = "${Rtotal - ((replyNum -1) *10)}" />
											        <c:forEach items="${dto}" var="dto">
											            <tr class="js_data_row" data-bdid="goodsreview" data-sno="2" data-auth="y" data-notice="n">
																										                										                
											                <td><strong>${num}</strong></td>
											                <td> <strong>${dto.reply_comment}</strong> </td>
											                <td>${dto.getReply_member_name()}</td>
											                <td>${dto.reply_date}</td>
											                <td>
											                	<c:if test = "${sessionScope.loginUser.id==dto.reply_member_id}">
												                	<a href="javascript:reply_update('${dto.getReply_code()}','${list.product_id}')"  id = "btn_update" class="btn_reviews_more" style="min-width:48px;">수정</a> 
												                	<%-- <button class = "btn_qna_more"  name = "btn_update" id = "btn_update" onclick="reply_update('${dto.getReply_code()}','${list.product_id}');" style="min-width:70px;">수정</button> --%>
												                	<a href="javascript:reply_delete('${dto.getReply_code()}','${list.product_id}','${list.product_code}');" id = "btn_delete" class="btn_reviews_more" style="min-width:48px;">삭제</a>
												                	<%-- <button class = "btn_qna_more"  name = "btn_delete" id = "btn_delete" onclick="reply_delete('${dto.getReply_code()}','${list.product_id}','${list.product_code}');" style="min-width:70px;">삭제</button> --%>
											                	</c:if>
											                </td>
											            </tr>
											            <c:set var="num" value="${num -1}" />
											            </c:forEach>
											        </tbody>
											    </table>
										    </form>
									</div>

<script type="text/javascript">
	function reply_delete(code, product_id, product_code) {
		document.reply_frm.action = "replydelete.do?reply_code="+code+"&id="+product_id+"&code="+product_code;
		document.reply_frm.method = "POST";
		alert("삭제하였습니다.");
		document.reply_frm.submit();
		
	}
	
	function reply_update(reply_code, product_id) {
		open("replyupdate.do?reply_code="+reply_code+"&id="+product_id, "댓글수정", "width = 650, height = 450, top = 200, left = 200");
	}

</script>
									
									<div class="pagination">
										<div class="page_wrap">
         								   <div class = "page_nation">		
							                	<c:if test ="${startpage > 10}">
									            	<a class = "arrow pprev" href="productlistDetail.do?id=${id}&code=${code}&replyNum=1"></a>
									            	<a class = "arrow prev" href="productlistDetail.do?id=${id}&code=${code}&replyNum=${startpage-10}"></a>
									            </c:if>
									            
									            <c:forEach var = "i" begin = "${startpage}" end="${endpage}">
									            	<c:choose>
									            		<c:when test="${i == replyNum}">
									            			<a class="active">${i}</a>
									            		</c:when>
									            		<c:otherwise>
									            			<a href="productlistDetail.do?id=${id}&code=${code}&replyNum=${i}">${i}</a>
									            		</c:otherwise>
									            	</c:choose>
									            </c:forEach>
									            
									            <c:if test = "${endpage < pagecount}">
									            	<a class = "arrow next" href="productlistDetail.do?id=${id}&code=${code}&replyNum=${startpage+10}"></a>
									            	<a class = "arrow nnext" href="productlistDetail.do?id=${id}&code=${code}&replyNum=${pagecount}"></a>
									            </c:if>
						              	  </div>
						                </div>
					                </div>
					                <div class="btn_reviews_box">
					                    <a href="javascript:open_popup('${list.product_id}')" class="btn_reviews_write">상품후기 글쓰기</a>
					                </div>
<script type="text/javascript">
	function open_popup(product_id){
		window.open("replyinsert.do?product_id="+product_id, "댓글입력", "width = 650, height = 450, top = 200, left = 200")
	}
	
	function reloadPage() {
		location.reload();
	}
</script>					                


					            </div>
					            </div>
					        </div>
							<div id="qna">
								<div class="item_goods_tab">
									<ul>
										<li><a href="#detail">상품상세정보</a></li>
										<li><a href="#delivery">배송안내</a></li>
										<li><a href="#exchange">교환 및 반품안내</a></li>
										<li><a href="#reviews">상품후기 <strong>(${Rtotal})</strong></a></li>
										<li class="on"><a href="#qna">상품문의 <strong>(0)</strong></a></li>
									</ul>
								</div>

								<div class="qna_cont">
									<h3>상품Q&amp;A</h3>
									<div id="ajax-goods-goodsqa-list"></div>
									<div class="btn_qna_box">
<!-- 										<a href="#" class="btn_qna_more">상품문의 전체보기</a>
										 <a href="#" class="btn_qna_write">상품문의 글쓰기</a> -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<script type="text/javascript" src="js/gd_board_goods.js" charset="utf-8"></script>
				</div>
			</div>
		</div>
		<jsp:include page="../common/Tis_webFooter.jsp"></jsp:include>


	</div>
</body>
</html>