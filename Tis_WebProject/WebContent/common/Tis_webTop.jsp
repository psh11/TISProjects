<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
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
						<a href="main.jsp"><img src="img/top-logo1.png" alt="상단 로고" title="상단 로고" /></a>
					</div>
					<div class="top_search"></div>
				</div>
			</div>
			<div class="header_gnb">
				<div class="gnb">
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
