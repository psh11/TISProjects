<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tis_product</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="csrf-token" content="MTYxNDMxOTYyMDMwODYwNjM1ODMwOTg3Mzk3MTg1MjY5NzQ5NDk0NTAy" />


<link type="text/css" rel="stylesheet"  href="css/reset.css?ts=1545872428">
<link type="text/css" rel="stylesheet"  href="css/common/common.css?ts=1545872428">
<link type="text/css" rel="stylesheet"	href="css/common/layer/layer.css?ts=1545872428">
<link type="text/css" rel="stylesheet"	href="css/layout/layout.css?ts=1545872428">
<link type="text/css" rel="stylesheet"	href="css/goods/list.css?ts=1545872428">
<link type="text/css" rel="stylesheet"	href="css/button.css?ts=1545872428">
<link type="text/css" rel="stylesheet"	href="css/main/main.css?ts=1545872428" />
<link type="text/css" rel="stylesheet"	href="css/custom.css?ts=1545872428" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>


</head>

<body class="body-main body-index pc">
	<div class="top_area"></div>
	
	<div id="wrap">
		<div id="header_warp">
			<div id="header">
				<div class="header_top">
					<div class="header_top_cont">
						<ul class="top_member_box">
						<c:choose>
							<c:when test = "${empty loginUser}">
								<li><a href="Tis_webLogin.jsp">LOGIN</a><span class="txt_bar"></span></li>
								<li><a href="Tis_webMemberJoin.jsp">JOIN</a><span class="txt_bar"></span></li>
							</c:when>
							<c:when test = "${loginUser.id == 'admin'}">
								<li><a href="logout.do">LOGOUT</a><span class="txt_bar"></span></li>
								<li>
									<a href="admin/productlist">관리자페이지</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="logout.do">LOGOUT</a><span class="txt_bar"></span></li>
								<li>
									<div class="top_mypage_cont">
										<span class="top_mypage_tit"><a	href="Tis_webMypage.jsp">MYPAGE</a></span>
									</div> <span class="txt_bar"></span>
								</li>
								<li>
									<a href="cartList.do?id=${loginUser.id}">장바구니 <strong></strong></a>
									<span class="txt_bar"></span>
								</li>
							</c:otherwise>
						</c:choose>
						</ul>

					</div>
				</div>
				<div class="header_search">
					<div class="header_search_cont">
						<div class="h1_logo">
							<a href="main.jsp"><img src="img/top-logo1.png" alt="로고" title="로고" /></a>
						</div>
					</div>
				</div>
				
				<div class="header_gnb">
					<div class="gnb">
						<div class="gnb_allmenu_wrap"></div>
						<div class="gnb_menu_box">
							<ul class="depth0 gnb_menu0" style="margin-left:100px">
								<li><a href="productlist.do?code=1">Running Shoes</a>
								</li>
								<li><a href="productlist.do?code=2">Heel/Pumps</a>
								</li>
								<li><a href="productlist.do?code=3">Sneakers</a>
								</li>
								<li><a href="productlist.do?code=4">Flat/Loafers</a>
								</li>
								<li><a href="productlist.do?code=5">Boots/Walkers</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="gnb_bg"></div>
				</div>
			</div>


		</div>

		<div id="container">
			<div id="contents">


				<div class="sub_content">


					<div class="main_visual">
 <style type="text/css">
     .slider-wrap .slick-slide {
        overflow:hidden;
    }

    .slider-banner-511517418{
    width:100%;
    }
    .slider-banner-511517418 img{
		max-width: 100%;
    }

	.body-main #wrap .slider-banner-511517418 img{max-width:none;}

    .slider-banner-511517418 .slick-prev{
       background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
       background:#ffffff\0/IE8;
    }
    .slider-banner-511517418 .slick-next{
        background-image:   url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
        background:#ffffff\0/IE8;
    }

    .slider-banner-511517418 .slick-dots li{
        width:12.5%;
        margin:0 4px !important;
    }
    .slider-banner-511517418 .slick-dots li button{
        font-size:12px;
        width:100%;
        height:30px;
        text-align:center;
        background:#000000;
        border-radius:0;
        color:#fff;
        opacity:1;
    }
    .slider-banner-511517418 .slick-dots li.slick-active button{
        background:#cfcfcf;
    }
</style>

						<div  class="slider-wrap slider-banner-511517418">
						    <div>
						     <img src="img/banner/mainbanner_1.jpg"  alt="메인베너1" title="메인베너1`"   />
						    </div>
						    <div>
						     <img src="img/banner/mainbanner_2.jpg"  alt="메인베너2" title="메인베너2"   />
						    </div>
						    <div>
						     <img src="img/banner/mainbanner_3.jpg"  alt="메인베너3" title="메인베너3"   />
						    </div>
						    <div>
						     <img src="img/banner/mainbanner_4.jpg"  alt="메인베너4" title="메인베너4"   />
						    </div>
						
						</div >

<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>

</div>
					<div class="main_content">
						<div class="main_slide_ban">

					        <div class="main_banner">
						            <span>
									<img src="img/banner/smail-banner1.jpg"  alt="작은베너1" title="작은베너1"   />            </span>
						            <span>
									<img src="img/banner/smail-banner2.jpg"  alt="작은베너2" title="작은베너2"   />            </span>
						            <span>
									<img src="img/banner/smail-banner3.jpg"  alt="작은베너3" title="작은베너3"   />            </span>
						            <span>
									<img src="img/banner/smail-banner4.jpg"  alt="작은베너4" title="작은베너4"   />            </span>
						        </div>
					  		</div>
					
					
						<div class="main_goods_cont simple">
							<div class="goods_list main_wrap_2">
								<div class="goods_list_tit">
									<h3><img src='img/1_imageNm.gif'></h3>
								</div>
								<div class="goods_list_cont goods_content_1">
									<div class="item_gallery_type">
									    <ul>
									        <li  style="width:33.333333333333%;">
									            <div class="item_cont">
									                <div class="item_photo_box" >
									                    <a href="productlist.do?code=1">
									                        <img src="img/banner/center-banner1.jpg" width="360" alt="여성신발" title="여성신발" class="middle"  />
									                    </a>
									                </div>
									                <div class="item_info_cont">
									                    <div class="item_tit_box">
									                        <a href="productlist.do?code=1">
									                            <strong class="item_name">여성신발</strong>
									                        </a>
									                    </div>
									                    <div class="item_money_box">
									                        <del>100,000 원</del>
									                        <strong class="item_price">
									                            <span >60,000 원</span>
									                        </strong>
									                    </div>
									                    <div class="item_icon_box">
									                        
									                    </div>
									                </div>
									            </div>
									        </li>
									        <li  style="width:33.333333333333%;">
									            <div class="item_cont">
									                <div class="item_photo_box" >
									                    <a href="productlist.do?code=1">
									                        <img src="img/banner/center-banner2.jpg" width="360" alt="남성신발" title="남성신발" class="middle"  />
									                    </a>
									                </div>
									                <div class="item_info_cont">
									                    <div class="item_tit_box">
									                        <a href="productlist.do?code=1">
									                            <strong class="item_name">남성신발</strong>
									                        </a>
									                    </div>
									                    <div class="item_money_box">
									                        <del>100,000 원 </del>
									                        <strong class="item_price">
									                            <span >60,000 원 </span>
									                        </strong>
									                    </div>
									                    <div class="item_icon_box">
									                        
									                    </div>
									                </div>
									            </div>
									        </li>
									        <li  style="width:33.333333333333%;">
									            <div class="item_cont">
									                <div class="item_photo_box" >
									                    <a href="productlist.do?code=1">
									                        <img src="img/banner/center-banner3.png" width="360" alt="SLING BACK" title="SLING BACK" class="middle"  />
									                    </a>
									                </div>
									                <div class="item_info_cont">
									                    <div class="item_tit_box">
									                        <a href="productlist.do?code=1">
									                            <strong class="item_name">SLING BACK</strong>
									                        </a>
									                    </div>
									                    <div class="item_money_box">
									                        <del>100,000 원 </del>
									                        <strong class="item_price">
									                            <span >60,000 원 </span>
									                        </strong>
									                    </div>
									                    <div class="item_icon_box">
									                        
									                    </div>
									                </div>
									            </div>
									        </li>
									    </ul>
									</div>
									    </div>
									</div>						
									
								<div class="main_goods_cont simple">
									<div class="goods_list main_wrap_2">
										 <div class="goods_list_tit">
								         <h3><img src='img/2_imageNm.gif'></h3>
								 		 </div>
										    
										<div class="goods_list_cont goods_content_2">
											<div class="item_simple_type">
												<ul>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/T2.jpg" width="270" alt="운동화" title="운동화" class="middle" />
																	<div class="item_simple_over">																	
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">운동화</strong>
																				</div>
																				<div class="item_money_box">
																					<del>60,000 원</del>
																					<strong class="item_price"> 
																					<span>40,000 원	</span>
																					</strong>
																				</div>
																				<div class="item_icon_box">
																				
																				</div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div>
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/T9.jpg" width="270" alt="운동화" title="운동화" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">운동화</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>90,000 원 </del>
																					<strong class="item_price"> <span>80,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/H1.jpg" width="270" alt="하이힐" title="하이힐" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">하이힐</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>60,000 원 </del>
																					<strong class="item_price"> <span>40,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div>
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/H2.jpg" width="270" alt="하이힐" title="하이힐" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">하이힐</strong>
																				</div>
																				<div class="item_money_box">
																					<del>250,000 원 </del>
																					<strong class="item_price"> <span>180,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/S6.jpg" width="270" alt="스니커즈" title="스니커즈" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">스니커즈</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>200,000 원 </del>
																					<strong class="item_price"> <span>150,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/S7.jpg" width="270" alt="스니커즈" title="스니커즈" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">스니커즈</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>15,000 원 </del>
																					<strong class="item_price"> <span>89,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/F3.jpg" width="270" alt="플립슈즈" title="플립슈즈" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">플립슈즈</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>90,000 원 </del>
																					<strong class="item_price"> <span>40,000 원
																					</span>
																					</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
													<li style="width: 25%;">
														<div class="item_cont">
															<div class="item_photo_box">
																<a href="productlist.do?code=1">
																	<img src="img/product/F8.jpg" width="270" alt="플립슈즈" title="플립슈즈" class="middle" />
																	<div class="item_simple_over">
																		<div class="item_simple_info">
																			<div class="item_info_cont">
																				<div class="item_tit_box">
																					<strong class="item_name">플립슈즈</strong>
																				</div>
																				<!-- //item_tit_box -->
																				<div class="item_money_box">
																					<del>80,000 원</del>
																					<strong class="item_price"> <span>56,000 원</span>	</strong>
																				</div>
																				<div class="item_icon_box"></div>
																			</div>
																		</div>
																	</div> 
																</a>
															</div>
														</div> 
													</li>
												</ul>
											</div>
										</div>
									</div>

							</div>

						</div>


						<div class="main_banner_bottom">
							<div class="bank">
								<img src = "img/bank.png" >
								<div class="bank_info">
									<strong>1004-22-45578</strong>
									<p>
										<em>TIS은행</em> <br>예금주 : 홍길동
									</p>
								</div>
							</div>
							
							<div class="cs">
								<img src = "img/cs.png" >
								<div class="cs_center">
									<strong>1544-3000</strong>
									<p>
										운영시간 : 10:00 - 17:00 점심시간 : 12:00 - 14:00<br /> 휴무 : SATURDAY, SUNDAY,HOLIDAY
									</p>
								</div>
							</div>
						</div>

					</div>



				</div>
			</div>
		</div>

			<div id="footer">


				<div class="foot_cont">
					
					<div class="foot_info">
						<div class="foot_list">
							<ul>
								<li><a href="#">이용약관</a></li>
								<li><a href="#"><strong>개인정보처리방침</strong></a></li>
							</ul>
						</div>
						<address>
							<strong>TIS Shop</strong> <span>서울특별시 영등포구 선유로 130 (지번 : 양평동 3가 5-4번지), 에이스하이테크시티3차 2층</span>
						</address>
						<div class="foot_info_list">
							<dl>
								<dt>대표 :</dt>
								<dd>홍길동</dd>
							</dl>
							<dl>
								<dt>사업자등록번호 :</dt>
								<dd>
									123-45-67890 <a href="#" class="btn_licensee_info"></a>
								</dd>
							</dl>
							<dl>
								<dt>통신판매업신고번호 :</dt>
								<dd></dd>
							</dl>

						</div>
						<div class="foot_info_list">
							<dl>
								<dt>개인정보관리자 :</dt>
								<dd></dd>
							</dl>
							<dl>
								<dt>대표번호 :</dt>
								<dd>
									<strong>1544-3000</strong>
								</dd>
							</dl>
							<dl>
								<dt>팩스번호 :</dt>
								<dd>1544-3000</dd>
							</dl>
							<dl>
								<dt>메일 :</dt>
								<dd>
									<a href="#" class="btn_email">tis@tis.co.kr</a>
								</dd>
							</dl>
							<dl>
								<dt>호스팅제공 :</dt>
								<dd>TIS정보기술교육센터</dd>
							</dl>
						</div>
						<p class="copyright">
							copyright (c) <strong>Tis</strong> all rights
							reserved.
						</p>
					</div>
				</div>
				<div class="foot_certify">
					<span></span> <span></span>
				</div>
		</div>
	</div>

</body>
</html>