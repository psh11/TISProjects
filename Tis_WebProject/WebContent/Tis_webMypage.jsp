<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link type="text/css" rel="stylesheet" href="js/jquery/chosen/chosen.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/custom.css?ts=1545872428" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body class="body-member body-join pc">
	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="common/Tis_webTop.jsp"></jsp:include>
		<div id="container">
			<div id="contents">

				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.html" class="local_home">HOME</a> &gt; My페이지</em>
					</div>
				</div>

				<div class="sub_content">


					<div class="content_box">
						<div class="order_wrap">
							<div class="order_tit">
								<h2>My페이지</h2>
							</div>

							<div class="cart_cont">
								<form action = "" method = "get">
									
								</form>
								
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="common/Tis_webFooter.jsp"></jsp:include>


	</div>
</body>
</html>